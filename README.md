# SMVDU-TITAN-X

<div align="center">

![SMVDU-TITAN-X Banner](docs/assets/banner.svg)

**An Open-Source High-Performance 64-bit RISC-V Multicore System-on-Chip**

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![RISC-V](https://img.shields.io/badge/ISA-RISC--V%20RV64GC-brightgreen.svg)](https://riscv.org)
[![Chipyard](https://img.shields.io/badge/Framework-Chipyard-orange.svg)](https://github.com/ucb-bar/chipyard)
[![Docs](https://img.shields.io/badge/Docs-MkDocs-informational.svg)](docs/)
[![CI](https://github.com/your-org/smvdu-titan-x/actions/workflows/lint.yml/badge.svg)](/.github/workflows)

</div>

---

## Overview

**SMVDU-TITAN-X** is a modular, research-grade, open-source RISC-V SoC platform designed for:

- 🔬 Computer architecture research
- 🚀 FPGA prototyping and hardware validation
- 🤖 AI/ML hardware accelerator development
- 🐧 Embedded Linux system development
- 🔮 Future ASIC tapeout exploration

Built on proven open-source ecosystems — **Chipyard**, **Rocket-Chip**, **TileLink**, **LiteX** — SMVDU-TITAN-X focuses engineering effort on SoC integration, accelerator design, and scalable architecture rather than reinventing foundational components.

---

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        SMVDU-TITAN-X                            │
├─────────────────────────────────────────────────────────────────┤
│  CPU Cluster                                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  Rocket Core │  │  BOOM (OoO)  │  │    CVA6      │          │
│  │   RV64GC     │  │   RV64GC     │  │   RV64GC     │          │
│  │  L1-I + L1-D │  │  L1-I + L1-D │  │  L1-I + L1-D │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                            │                                     │
│               ┌────────────▼────────────┐                       │
│               │     TileLink NoC         │                       │
│               └────────────┬────────────┘                       │
│                            │                                     │
│  ┌─────────────────────────▼──────────────────────────────┐    │
│  │                Shared Resources                          │    │
│  │  L2 Cache │ DDR Controller │ DMA │ PLIC │ CLINT │ ROM  │    │
│  └─────────────────────────┬──────────────────────────────┘    │
│                            │                                     │
│  ┌─────────────────────────▼──────────────────────────────┐    │
│  │              Peripheral Subsystem                        │    │
│  │  UART │ SPI │ I2C │ GPIO │ Ethernet │ PCIe │ USB │ HDMI│    │
│  └─────────────────────────┬──────────────────────────────┘    │
│                            │                                     │
│  ┌─────────────────────────▼──────────────────────────────┐    │
│  │              Accelerator Subsystem                       │    │
│  │    AI Engine │ DSP Engine │ Crypto │ Video DMA          │    │
│  └────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────┘
```

---

## Project Phases

| Phase | Goal | Status |
|-------|------|--------|
| **Phase 1** | Single-core bring-up, UART, bare-metal firmware | 🚧 In Progress |
| **Phase 2** | DDR + OpenSBI + Linux boot | 📋 Planned |
| **Phase 3** | Multicore (quad-core) + SMP Linux | 📋 Planned |
| **Phase 4** | Advanced IO (Ethernet, USB, PCIe, SDIO) | 📋 Planned |
| **Phase 5** | AI / DSP / Crypto accelerators | 📋 Planned |
| **Phase 6** | ASIC synthesis and physical design exploration | 📋 Planned |

---

## Repository Structure

```
smvdu-titan-x/
├── hardware/          # RTL design (Chisel + Verilog)
│   ├── rtl/           # Source RTL
│   ├── chipyard/      # Chipyard submodule + configs
│   ├── constraints/   # FPGA pin constraints
│   └── ip/            # Third-party IP
├── verification/      # Simulation & verification
│   ├── sim/           # Verilator harnesses
│   ├── cocotb/        # Python testbenches
│   ├── riscv-dv/      # Instruction generators
│   └── riscv-tests/   # Compliance tests
├── fpga/              # FPGA deployment targets
│   ├── artix7/        # Xilinx Artix-7
│   ├── kintex7/       # Xilinx Kintex-7
│   └── litex_targets/ # LiteX rapid prototyping
├── software/          # Software stack
│   ├── firmware/      # Bare-metal firmware
│   ├── opensbi/       # OpenSBI + platform config
│   ├── uboot/         # U-Boot + board config
│   ├── linux/         # Linux kernel + defconfig
│   └── buildroot/     # BusyBox rootfs
├── asic/              # ASIC research flow
│   ├── openroad/
│   └── openlane/
├── docs/              # Documentation (MkDocs)
├── scripts/           # Automation scripts
└── .github/           # CI/CD workflows
```

---

## Quick Start

### Prerequisites

```bash
# Ubuntu 22.04 / 24.04 LTS recommended
sudo apt update
bash scripts/setup/install_deps.sh
bash scripts/setup/setup_riscv_toolchain.sh
```

### Clone with Submodules

```bash
git clone --recursive https://github.com/your-org/smvdu-titan-x.git
cd smvdu-titan-x
git submodule update --init --recursive
```

### Chipyard Setup

```bash
bash scripts/setup/setup_chipyard.sh
```

### Run First Simulation (Phase 1)

```bash
bash scripts/sim/run_verilator.sh
```

### Build Documentation Locally

```bash
pip install mkdocs-material
mkdocs serve
```

---

## Software Stack

```
Applications
     │
Linux Userspace (BusyBox)
     │
Linux Kernel (RISC-V)
     │
OpenSBI (M-mode runtime)
     │
U-Boot (Bootloader)
     │
SMVDU-TITAN-X Hardware
```

---

## Toolchain

| Domain | Tools |
|--------|-------|
| Hardware Design | Chisel (Scala), Verilog, SystemVerilog |
| Simulation | Verilator, cocotb |
| ISA Verification | riscv-dv, riscv-tests |
| FPGA | Xilinx Vivado, LiteX |
| Software | RISC-V GCC, OpenSBI, U-Boot, Linux, Buildroot |
| ASIC | OpenROAD, OpenLane, Sky130 PDK |

---

## Open-Source Dependencies

| Project | Purpose | License |
|---------|---------|---------|
| [Chipyard](https://github.com/ucb-bar/chipyard) | SoC generation framework | Apache 2.0 |
| [Rocket-Chip](https://github.com/chipsalliance/rocket-chip) | RISC-V processor generator | Apache 2.0 |
| [BOOM](https://github.com/riscv-boom/riscv-boom) | Out-of-order RISC-V core | Apache 2.0 |
| [CVA6](https://github.com/openhwgroup/cva6) | Application-class RISC-V core | SHL 2.0 |
| [LiteX](https://github.com/enjoy-digital/litex) | FPGA SoC builder | BSD 2-Clause |
| [OpenSBI](https://github.com/riscv-software-src/opensbi) | RISC-V SBI firmware | BSD 2-Clause |
| [Verilator](https://github.com/verilator/verilator) | RTL simulator | LGPL 3.0 |
| [cocotb](https://github.com/cocotb/cocotb) | Python verification | BSD 3-Clause |
| [OpenTitan](https://github.com/lowRISC/opentitan) | Security IP inspiration | Apache 2.0 |
| [OpenROAD](https://github.com/The-OpenROAD-Project/OpenROAD) | ASIC PnR | BSD 3-Clause |

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Commit message format
- Branch strategy
- Code review requirements
- Simulation requirements before merge

---

## License

Copyright © 2025 SMVDU-TITAN-X Contributors.

Licensed under the [Apache License 2.0](LICENSE).

---

## Acknowledgements

SMVDU-TITAN-X builds upon the exceptional work of:
- [UC Berkeley BAR](https://bar.eecs.berkeley.edu/) — Chipyard & Rocket-Chip
- [RISC-V International](https://riscv.org/) — Open ISA standard
- [OpenHW Group](https://www.openhwgroup.org/) — CVA6
- [lowRISC](https://lowrisc.org/) — OpenTitan security IP
- [enjoy-digital](https://github.com/enjoy-digital) — LiteX ecosystem
