#!/usr/bin/env bash
# SMVDU-TITAN-X Phase 1 — Build Verilator Simulator
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
step()  { echo -e "\n${BLUE}━━━ $* ━━━${NC}"; }

SUBMODULE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHIPYARD_DIR="$SUBMODULE_ROOT/../hardware/chipyard"
SIM_DIR="$CHIPYARD_DIR/sims/verilator"
CONFIG="TitanXPhase1Config"

echo -e "${BLUE}Building SMVDU-TITAN-X Phase 1 Simulator...${NC}"

# Check Chipyard directory
if [ ! -d "$CHIPYARD_DIR" ]; then
    error "Chipyard framework not found at $CHIPYARD_DIR"
    error "Ensure this phase repo is checked out inside the smvdu-titan-x orchestrator repo."
    exit 1
fi

# Activate Conda environment
step "Activating Chipyard environment"
CONDA_BASE=$(conda info --base 2>/dev/null || echo "$HOME/miniforge3")
source "$CONDA_BASE/etc/profile.d/conda.sh"
conda activate chipyard

# Compile simulator
step "Compiling Verilator Simulator (CONFIG=$CONFIG)"
cd "$SIM_DIR"
make CONFIG="$CONFIG" -j$(nproc)

info "Simulator compilation complete!"
info "Simulator Binary: $SIM_DIR/simulator-chipyard.harness-${CONFIG}"
