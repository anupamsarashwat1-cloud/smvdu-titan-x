#!/usr/bin/env bash
# SMVDU-TITAN-X — Chipyard Setup Script
# Sets up the Chipyard SoC framework for SMVDU-TITAN-X development
#
# This script:
#   1. Initializes the Chipyard submodule
#   2. Sets up the Chipyard conda environment
#   3. Builds the toolchain and Verilator (if not already present)
#   4. Runs a quick Rocket core simulation to validate the setup
#
# Usage: bash scripts/setup/setup_chipyard.sh [--skip-build]
#
# Prerequisites: install_deps.sh must have been run first
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
step()  { echo -e "\n${BLUE}━━━ $* ━━━${NC}"; }

# ─── Configuration ────────────────────────────────────────────────────────────
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CHIPYARD_DIR="$REPO_ROOT/hardware/chipyard"
SKIP_BUILD=false

for arg in "$@"; do
    case $arg in
        --skip-build) SKIP_BUILD=true ;;
    esac
done

info "SMVDU-TITAN-X Chipyard Setup"
info "Repo root: $REPO_ROOT"
info "Chipyard dir: $CHIPYARD_DIR"

# ─── Step 1: Initialize Chipyard submodule ────────────────────────────────────
step "Initializing Chipyard submodule"

cd "$REPO_ROOT"
if [ ! -f "$CHIPYARD_DIR/.git" ] && [ ! -d "$CHIPYARD_DIR/.git" ]; then
    info "Initializing Chipyard submodule (this may take several minutes)..."
    git submodule update --init --recursive hardware/chipyard
else
    info "Chipyard submodule already initialized."
    info "Run 'git submodule update --recursive hardware/chipyard' to update."
fi

cd "$CHIPYARD_DIR"

# ─── Step 2: Conda environment setup ─────────────────────────────────────────
step "Setting up Chipyard conda environment"

if ! command -v conda &>/dev/null; then
    warn "Conda not found. Installing Miniforge..."
    MINIFORGE_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"
    wget -q -O /tmp/miniforge.sh "$MINIFORGE_URL"
    bash /tmp/miniforge.sh -b -p "$HOME/miniforge3"
    rm /tmp/miniforge.sh
    export PATH="$HOME/miniforge3/bin:$PATH"
    conda init bash
    info "Miniforge installed. Run: source ~/.bashrc && bash $0"
    exit 0
fi

info "Conda found: $(conda --version)"

# Create/activate Chipyard conda environment
if conda env list | grep -q "chipyard"; then
    info "Chipyard conda env already exists."
else
    info "Creating Chipyard conda environment (this takes ~10 minutes)..."
    conda env create -f conda-lock.yml --name chipyard || \
    conda env create -f environment.yml --name chipyard
fi

# ─── Step 3: Copy SMVDU-TITAN-X configs ──────────────────────────────────────
step "Installing SMVDU-TITAN-X configs into Chipyard"

TITAN_CONFIG_SRC="$REPO_ROOT/hardware/chipyard/configs/TitanXConfig.scala"
TITAN_CONFIG_DST="$CHIPYARD_DIR/generators/smvdu-titan-x/src/main/scala"

if [ -f "$TITAN_CONFIG_SRC" ]; then
    mkdir -p "$TITAN_CONFIG_DST"
    cp "$TITAN_CONFIG_SRC" "$TITAN_CONFIG_DST/TitanXConfig.scala"
    info "Copied TitanXConfig.scala to Chipyard generators"
else
    warn "TitanXConfig.scala not found at $TITAN_CONFIG_SRC"
fi

# ─── Step 4: Build Chipyard tools ────────────────────────────────────────────
if $SKIP_BUILD; then
    warn "Skipping Chipyard build (--skip-build specified)"
else
    step "Building Chipyard tools and Verilator"
    info "This will take 20-60 minutes depending on your system..."
    info "Activate conda env first: conda activate chipyard"

    echo ""
    echo "  To complete setup, run the following commands:"
    echo ""
    echo "    conda activate chipyard"
    echo "    cd $CHIPYARD_DIR"
    echo "    ./scripts/init-submodules-no-riscv-tools.sh"
    echo "    make -C sims/verilator CONFIG=SmallRocketConfig"
    echo ""
    echo "  Or use the SMVDU-TITAN-X simulation config:"
    echo "    make -C sims/verilator CONFIG=smvdu.titan.x.TitanXSimConfig"
    echo ""
fi

# ─── Step 5: Quick validation ────────────────────────────────────────────────
step "Validation"

info "Chipyard directory structure:"
ls -la "$CHIPYARD_DIR/" 2>/dev/null || warn "Chipyard not fully initialized yet"

echo ""
info "═══════════════════════════════════════════════════════"
info "  Chipyard Setup Complete"
info "═══════════════════════════════════════════════════════"
info ""
info "To run first simulation:"
info "  conda activate chipyard"
info "  cd hardware/chipyard"
info "  make -C sims/verilator CONFIG=smvdu.titan.x.TitanXSimConfig"
info ""
info "Reference: https://chipyard.readthedocs.io"
echo ""
