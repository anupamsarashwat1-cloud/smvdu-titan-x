# Contributing to SMVDU-TITAN-X

Thank you for your interest in contributing to SMVDU-TITAN-X! This document outlines guidelines for contributing to the project.

---

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Branch Strategy](#branch-strategy)
- [Commit Message Format](#commit-message-format)
- [Development Workflow](#development-workflow)
- [Simulation Requirements](#simulation-requirements)
- [Code Review Process](#code-review-process)
- [Documentation Standards](#documentation-standards)

---

## Code of Conduct

All contributors are expected to adhere to respectful, inclusive, and professional conduct. Harassment or discrimination of any kind will not be tolerated.

---

## Getting Started

1. Fork the repository
2. Clone with submodules:
   ```bash
   git clone --recursive https://github.com/YOUR_USERNAME/smvdu-titan-x.git
   cd smvdu-titan-x
   git submodule update --init --recursive
   ```
3. Set up your development environment:
   ```bash
   bash scripts/setup/install_deps.sh
   bash scripts/setup/setup_riscv_toolchain.sh
   ```
4. Create a feature branch (see [Branch Strategy](#branch-strategy))

---

## Branch Strategy

```
main                  # Stable, always boots/simulates correctly
  └── develop         # Integration branch
        ├── feature/phase1-uart-controller
        ├── feature/phase2-linux-boot
        ├── fix/verilator-sim-crash
        └── docs/phase3-multicore-guide
```

| Branch Prefix | Purpose |
|---------------|---------|
| `feature/` | New hardware blocks, peripherals, accelerators |
| `fix/` | Bug fixes in RTL, simulation, or scripts |
| `docs/` | Documentation updates only |
| `ci/` | CI/CD workflow changes |
| `asic/` | ASIC flow experiments |

**Rules:**
- Never commit directly to `main`
- PRs to `main` must pass all CI checks
- PRs to `develop` require at least 1 reviewer approval

---

## Commit Message Format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short description>

[optional body]

[optional footer]
```

### Types

| Type | Use |
|------|-----|
| `feat` | New hardware feature, peripheral, or accelerator |
| `fix` | Bug fix in RTL, simulation, or scripts |
| `docs` | Documentation changes only |
| `sim` | Simulation or verification changes |
| `ci` | CI/CD changes |
| `fpga` | FPGA-specific changes |
| `asic` | ASIC flow changes |
| `chore` | Build scripts, dependencies, tooling |
| `refactor` | Code restructuring without functional change |

### Scopes

`core`, `interconnect`, `cache`, `memory`, `uart`, `spi`, `i2c`, `gpio`, `ethernet`, `pcie`, `usb`, `ai-engine`, `dsp`, `crypto`, `video`, `opensbi`, `linux`, `uboot`, `fpga`, `sim`, `docs`

### Examples

```
feat(uart): add 16550-compatible UART with FIFO support

Implements a UART peripheral with:
- 16-byte TX/RX FIFOs
- Programmable baud rate
- Interrupt support

Closes #42

fix(sim): resolve Verilator timing violation in L2 cache arbiter

docs(phase2): add Linux boot tutorial for Arty A7

feat(ai-engine): add systolic array matrix multiply accelerator
```

---

## Development Workflow

```
1. Create feature branch from develop
2. Implement changes
3. Write/update testbenches
4. Run simulation regression (REQUIRED)
5. Run linting (REQUIRED)
6. Update documentation
7. Open Pull Request
8. Address review comments
9. Merge after CI passes + approval
```

---

## Simulation Requirements

**Before opening a PR, ALL of the following must pass:**

### RTL Changes
```bash
# 1. Verilator lint — zero warnings allowed
bash scripts/sim/run_verilator.sh --lint-only

# 2. Unit simulation
bash scripts/sim/run_verilator.sh

# 3. cocotb tests (if peripheral changed)
bash scripts/sim/run_cocotb.sh <module_name>
```

### ISA Changes
```bash
# RISC-V compliance tests
cd verification/riscv-tests
make isa
```

### For Core Changes
- Run riscv-dv instruction generation regression
- Provide waveform screenshots for any timing-sensitive changes

---

## Code Review Process

- PRs require at least **1 reviewer approval** for `develop`
- PRs require at least **2 reviewer approvals** for `main`
- Reviewers will check:
  - Correctness of RTL design
  - Simulation passes
  - Code style and documentation
  - Memory map consistency
  - No hardcoded addresses (use parameters)
- Authors must respond to all review comments before merge

---

## Documentation Standards

- All new hardware blocks must have a `README.md` in their directory
- Document:
  - Block purpose and functionality
  - Interface signals (with widths and directions)
  - Register map (if applicable)
  - Timing diagrams (ASCII or Wavedrom)
  - Known limitations
- Update `docs/architecture/` for major architectural changes
- Update `docs/memory_map.md` when adding new address regions

---

## Hardware Design Guidelines

- Use **parameters** for all configurable widths, depths, and addresses
- No hardcoded addresses in RTL — use `localparam` or top-level parameters
- Synchronous resets unless there is a strong reason otherwise
- All FFs must be reset to a known state
- Clock domain crossings must be properly synchronized (document the strategy)
- Follow TileLink protocol specifications strictly for bus transactions

---

## Questions?

Open a [Discussion](https://github.com/your-org/smvdu-titan-x/discussions) or file an issue using the appropriate template.
