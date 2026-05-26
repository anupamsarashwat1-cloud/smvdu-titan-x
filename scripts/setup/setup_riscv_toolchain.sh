#!/usr/bin/env bash
# SMVDU-TITAN-X — RISC-V GCC Toolchain Installer
# Installs the RISC-V GNU Toolchain (riscv64-unknown-elf-*)
# Supports: prebuilt binaries (fast) or source build (slower, custom)
#
# Usage:
#   bash scripts/setup/setup_riscv_toolchain.sh           # Install prebuilt
#   bash scripts/setup/setup_riscv_toolchain.sh --source  # Build from source
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
step()  { echo -e "\n${BLUE}━━━ $* ━━━${NC}"; }

# ─── Configuration ────────────────────────────────────────────────────────────
TOOLCHAIN_INSTALL_DIR="${RISCV:-/opt/riscv}"
TOOLCHAIN_VERSION="2024.09.03"   # Update as needed
ARCH="rv64gc"
ABI="lp64d"

# ─── Arguments ───────────────────────────────────────────────────────────────
BUILD_FROM_SOURCE=false
for arg in "$@"; do
    case $arg in
        --source) BUILD_FROM_SOURCE=true ;;
        --dir=*)  TOOLCHAIN_INSTALL_DIR="${arg#*=}" ;;
        --help)
            echo "Usage: $0 [--source] [--dir=/path/to/install]"
            echo "  --source   Build from source (slower, ~45 min)"
            echo "  --dir=DIR  Installation directory (default: /opt/riscv)"
            exit 0
            ;;
    esac
done

info "SMVDU-TITAN-X RISC-V Toolchain Setup"
info "Target arch: $ARCH ($ABI)"
info "Install dir: $TOOLCHAIN_INSTALL_DIR"

# ─── Check if already installed ──────────────────────────────────────────────
if command -v riscv64-unknown-elf-gcc &>/dev/null; then
    EXISTING_VER=$(riscv64-unknown-elf-gcc --version | head -1)
    info "Toolchain already installed: $EXISTING_VER"
    read -p "Reinstall? [y/N] " answer
    [[ "$answer" != "y" ]] && exit 0
fi

# ─── Prebuilt Install ─────────────────────────────────────────────────────────
install_prebuilt() {
    step "Installing prebuilt RISC-V toolchain"

    # Detect host architecture
    HOST_ARCH=$(uname -m)
    case "$HOST_ARCH" in
        x86_64) HOST="x86_64-linux" ;;
        aarch64) HOST="aarch64-linux" ;;
        *)
            warn "Unsupported host arch: $HOST_ARCH"
            warn "Falling back to source build..."
            BUILD_FROM_SOURCE=true
            return
            ;;
    esac

    TARBALL="riscv-gnu-toolchain-${HOST}.tar.gz"
    DOWNLOAD_URL="https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/${TOOLCHAIN_VERSION}/${TARBALL}"

    info "Downloading $TARBALL..."
    wget --show-progress -O "/tmp/${TARBALL}" "$DOWNLOAD_URL"

    info "Extracting to $TOOLCHAIN_INSTALL_DIR..."
    sudo mkdir -p "$TOOLCHAIN_INSTALL_DIR"
    sudo tar -xzf "/tmp/${TARBALL}" -C "$TOOLCHAIN_INSTALL_DIR" --strip-components=1
    rm "/tmp/${TARBALL}"
}

# ─── Source Build ─────────────────────────────────────────────────────────────
build_from_source() {
    step "Building RISC-V toolchain from source (this takes ~45 minutes)"

    # Install prerequisites
    sudo apt-get install -y \
        autoconf automake autotools-dev curl python3 \
        libmpc-dev libmpfr-dev libgmp-dev \
        gawk build-essential bison flex texinfo gperf \
        libtool patchutils bc zlib1g-dev libexpat-dev

    SOURCE_DIR="/tmp/riscv-gnu-toolchain-src"
    if [ ! -d "$SOURCE_DIR" ]; then
        info "Cloning riscv-gnu-toolchain..."
        git clone --depth=1 \
            https://github.com/riscv-collab/riscv-gnu-toolchain.git \
            "$SOURCE_DIR"
    fi

    cd "$SOURCE_DIR"
    info "Configuring for $ARCH / $ABI..."
    ./configure \
        --prefix="$TOOLCHAIN_INSTALL_DIR" \
        --with-arch="$ARCH" \
        --with-abi="$ABI"

    info "Building (using $(nproc) cores)..."
    make -j"$(nproc)"

    info "Installing to $TOOLCHAIN_INSTALL_DIR..."
    sudo make install
}

# ─── Run install ─────────────────────────────────────────────────────────────
if $BUILD_FROM_SOURCE; then
    build_from_source
else
    install_prebuilt
    # Fall through to source if prebuilt not available
    if $BUILD_FROM_SOURCE; then
        build_from_source
    fi
fi

# ─── Add to PATH ─────────────────────────────────────────────────────────────
PROFILE_FILE="${HOME}/.bashrc"
EXPORT_LINE="export PATH=\"${TOOLCHAIN_INSTALL_DIR}/bin:\$PATH\""
RISCV_LINE="export RISCV=\"${TOOLCHAIN_INSTALL_DIR}\""

if ! grep -q "$TOOLCHAIN_INSTALL_DIR" "$PROFILE_FILE" 2>/dev/null; then
    echo "" >> "$PROFILE_FILE"
    echo "# RISC-V Toolchain (SMVDU-TITAN-X)" >> "$PROFILE_FILE"
    echo "$RISCV_LINE" >> "$PROFILE_FILE"
    echo "$EXPORT_LINE" >> "$PROFILE_FILE"
    info "Added toolchain to $PROFILE_FILE"
fi

export PATH="${TOOLCHAIN_INSTALL_DIR}/bin:$PATH"
export RISCV="$TOOLCHAIN_INSTALL_DIR"

# ─── Verify ──────────────────────────────────────────────────────────────────
step "Verification"
if command -v riscv64-unknown-elf-gcc &>/dev/null; then
    info "riscv64-unknown-elf-gcc: $(riscv64-unknown-elf-gcc --version | head -1)"
    info "riscv64-unknown-elf-as:  $(riscv64-unknown-elf-as --version | head -1)"
    info "riscv64-unknown-elf-ld:  $(riscv64-unknown-elf-ld --version | head -1)"
else
    error "Toolchain not found on PATH after installation."
    error "Run: source ~/.bashrc"
    exit 1
fi

# ─── Test build ──────────────────────────────────────────────────────────────
step "Quick Build Test"
TESTDIR=$(mktemp -d)
cat > "$TESTDIR/test.S" << 'EOF'
.section .text
.globl _start
_start:
    li a0, 42
    li a7, 93
    ecall
EOF

riscv64-unknown-elf-as -march=rv64gc -mabi=lp64d \
    -o "$TESTDIR/test.o" "$TESTDIR/test.S"
riscv64-unknown-elf-ld -o "$TESTDIR/test.elf" "$TESTDIR/test.o" 2>/dev/null || true
rm -rf "$TESTDIR"

echo ""
info "═══════════════════════════════════════════════════"
info "  RISC-V Toolchain Installed Successfully!"
info "═══════════════════════════════════════════════════"
info ""
info "Run: source ~/.bashrc"
info "Then: cd software/firmware/hello_uart && make"
echo ""
