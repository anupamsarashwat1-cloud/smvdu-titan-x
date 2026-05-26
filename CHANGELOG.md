# Changelog

All notable changes to SMVDU-TITAN-X will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added
- Repository scaffold with full directory structure
- `.gitmodules` referencing all key open-source dependencies:
  - Chipyard, Rocket-Chip, CVA6, BOOM
  - LiteX, LiteDRAM, LiteEth, LitePCIe
  - OpenSBI, U-Boot
  - cocotb, riscv-tests, riscv-dv
- Hardware RTL skeleton (`hardware/rtl/`)
- Phase 1 bare-metal firmware stub (`software/firmware/hello_uart/`)
- FPGA constraint files for Artix-7 and Kintex-7
- LiteX rapid prototyping target for Arty A7
- OpenLane and OpenROAD ASIC flow configurations
- MkDocs documentation site with Material theme
- CI/CD workflows (lint, simulation regression, compliance, docs)
- Automation scripts for setup, simulation, FPGA, and ASIC flows
- Initial memory map definition (Phase 1)

---

## [0.1.0-alpha] — 2025-05-26

### Added
- Initial project definition and architecture specification
- Project repository initialized
- Apache 2.0 license applied
- RISC-V RV64GC target ISA defined
- Six-phase development roadmap established:
  1. Single-core bring-up
  2. Linux boot
  3. Multicore + SMP
  4. Advanced IO
  5. Accelerators
  6. ASIC exploration
- Memory map defined for Phase 1 boot sequence
- Tool ecosystem selected:
  - Chipyard (primary SoC framework)
  - LiteX (FPGA rapid prototyping)
  - Verilator (simulation)
  - OpenROAD + OpenLane (ASIC)

### Architecture Decisions
- **Primary CPU**: Rocket Core (RV64GC) — proven, Linux-capable, Chipyard-native
- **Interconnect**: TileLink for coherent on-chip fabric, AXI4/APB bridges for peripherals
- **Cache hierarchy**: Per-core L1 I/D + shared L2 via InclusiveCache
- **Boot sequence**: Boot ROM → OpenSBI → U-Boot → Linux → BusyBox

---

[Unreleased]: https://github.com/anupamsarashwat1-cloud/smvdu-titan-x/compare/v0.1.0-alpha...HEAD
[0.1.0-alpha]: https://github.com/anupamsarashwat1-cloud/smvdu-titan-x/releases/tag/v0.1.0-alpha
