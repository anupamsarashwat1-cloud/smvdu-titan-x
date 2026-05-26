#!/usr/bin/env bash
# SMVDU-TITAN-X — System Dependency Installer
# Installs all required system packages for Ubuntu 22.04/24.04 LTS
#
# Usage: sudo bash scripts/setup/install_deps.sh
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

# ─── Colors ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

# ─── OS Check ────────────────────────────────────────────────────────────────
if [ ! -f /etc/os-release ]; then
    error "Cannot determine OS. This script requires Ubuntu 22.04 or 24.04."
    exit 1
fi

. /etc/os-release
if [[ "$ID" != "ubuntu" ]]; then
    warn "This script is optimized for Ubuntu. Proceeding anyway..."
fi

info "SMVDU-TITAN-X Dependency Installer"
info "OS: $PRETTY_NAME"
echo ""

# ─── Check for root ──────────────────────────────────────────────────────────
if [ "$EUID" -ne 0 ]; then
    error "This script must be run as root. Use: sudo bash $0"
    exit 1
fi

# ─── Update package lists ────────────────────────────────────────────────────
info "Updating package lists..."
apt-get update -qq

# ─── Build Tools ─────────────────────────────────────────────────────────────
info "Installing build tools..."
apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    wget \
    cmake \
    ninja-build \
    autoconf \
    automake \
    libtool \
    pkg-config \
    bison \
    flex \
    gawk \
    texinfo \
    gperf \
    patch \
    patchutils \
    zlib1g-dev \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    libexpat-dev \
    libffi-dev \
    libssl-dev \
    libncurses-dev \
    libreadline-dev \
    libsqlite3-dev \
    libelf-dev \
    device-tree-compiler

# ─── Java/Scala for Chisel/Chipyard ──────────────────────────────────────────
info "Installing Java (for Chisel/Chipyard SBT builds)..."
apt-get install -y --no-install-recommends \
    openjdk-17-jdk \
    openjdk-17-jre

# Install SBT (Scala Build Tool)
info "Installing SBT..."
if ! command -v sbt &>/dev/null; then
    echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" \
        > /etc/apt/sources.list.d/sbt.list
    curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" \
        | apt-key add - 2>/dev/null
    apt-get update -qq
    apt-get install -y sbt
    info "SBT installed: $(sbt --version 2>/dev/null | head -1)"
else
    info "SBT already installed: $(sbt --version 2>/dev/null | head -1)"
fi

# ─── Verilator ───────────────────────────────────────────────────────────────
info "Installing Verilator..."
apt-get install -y --no-install-recommends \
    verilator \
    libgoogle-perftools-dev \
    numactl

VERILATOR_VERSION=$(verilator --version 2>/dev/null | head -1 || echo "not installed")
info "Verilator: $VERILATOR_VERSION"

# NOTE: Chipyard may require a specific Verilator version.
# If you need to build from source:
# warn "If Chipyard requires a newer Verilator, run: bash scripts/setup/build_verilator.sh"

# ─── Python3 ─────────────────────────────────────────────────────────────────
info "Installing Python3 and pip..."
apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-dev \
    python3-venv \
    python3-setuptools \
    python3-wheel

# ─── Python packages ─────────────────────────────────────────────────────────
info "Installing Python packages (cocotb, litex dependencies)..."
pip3 install --upgrade pip
pip3 install \
    cocotb \
    cocotb-bus \
    pyelftools \
    pexpect \
    migen \
    litex \
    litedram \
    liteeth \
    litepcie \
    litescope \
    meson

# ─── Device Tree Compiler ────────────────────────────────────────────────────
info "Installing device tree compiler..."
apt-get install -y device-tree-compiler

# ─── QEMU RISC-V ─────────────────────────────────────────────────────────────
info "Installing QEMU for RISC-V (for software stack validation)..."
apt-get install -y --no-install-recommends \
    qemu-system-misc \
    qemu-user \
    qemu-user-static

# ─── OpenFPGALoader / Programming Tools ──────────────────────────────────────
info "Installing OpenFPGALoader (FPGA programming tool)..."
apt-get install -y --no-install-recommends \
    openocd || warn "openocd not available — install manually for JTAG debugging"

# ─── Waveform Viewers ────────────────────────────────────────────────────────
info "Installing waveform viewers..."
apt-get install -y --no-install-recommends \
    gtkwave || warn "GTKWave not available in this repository"

# ─── Misc Tools ──────────────────────────────────────────────────────────────
info "Installing miscellaneous tools..."
apt-get install -y --no-install-recommends \
    minicom \
    picocom \
    screen \
    tmux \
    htop \
    tree \
    ripgrep \
    jq \
    bc \
    xxd

# ─── Summary ─────────────────────────────────────────────────────────────────
echo ""
info "════════════════════════════════════════════════════"
info "  SMVDU-TITAN-X Dependencies Installed Successfully"
info "════════════════════════════════════════════════════"
info ""
info "Next steps:"
info "  1. Install RISC-V GCC toolchain:"
info "       bash scripts/setup/setup_riscv_toolchain.sh"
info "  2. Set up Chipyard:"
info "       bash scripts/setup/setup_chipyard.sh"
info "  3. (Optional) Set up LiteX:"
info "       bash scripts/setup/setup_litex.sh"
echo ""
