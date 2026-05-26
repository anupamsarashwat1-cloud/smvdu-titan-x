# SMVDU-TITAN-X

<div class="hero" markdown>

# SMVDU-TITAN-X 🚀

**An Open-Source High-Performance 64-bit RISC-V Multicore SoC**

[Get Started](tutorials/environment_setup.md){ .md-button .md-button--primary }
[Architecture](architecture/overview.md){ .md-button }
[View on GitHub](https://github.com/your-org/smvdu-titan-x){ .md-button }

</div>

---

## What is SMVDU-TITAN-X?

SMVDU-TITAN-X is a **modular, research-grade, open-source RISC-V SoC platform** designed for computer architecture research, FPGA prototyping, AI accelerator development, and future ASIC exploration.

Built on proven open-source ecosystems — **Chipyard**, **Rocket-Chip**, **TileLink**, **LiteX** — it focuses engineering effort on SoC integration and accelerator design rather than reinventing foundational components.

---

## Key Features

<div class="grid cards" markdown>

- :material-cpu-64-bit: **RISC-V RV64GC**

    Full 64-bit ISA with integer, MUL/DIV, atomics, floating-point, and compressed instruction support with full MMU and Linux capability.

- :material-layers-triple: **Multicore Architecture**

    Scales from single-core to quad-core with coherent shared L2 cache via TileLink.

- :material-chip: **FPGA Proven**

    Deploys to Xilinx Artix-7, Kintex-7 and LiteX-supported boards for hardware validation and software development.

- :material-robot: **AI Accelerators**

    Extensible accelerator subsystem for AI/ML engines, DSP, cryptographic hardware, and custom IP.

- :material-penguin: **Linux-Capable**

    Full software stack: OpenSBI → U-Boot → Linux Kernel → BusyBox/Buildroot.

- :material-test-tube: **Open-Source ASIC Path**

    Architecture compatible with OpenROAD, OpenLane, and Sky130 PDK for future tapeout exploration.

</div>

---

## Development Phases

| Phase | Goal | Status |
|-------|------|--------|
| **Phase 1** | Single-core bring-up, UART, bare-metal ASM | 🚧 In Progress |
| **Phase 2** | DDR + OpenSBI + Linux boot | 📋 Planned |
| **Phase 3** | Quad-core SMP + shared L2 | 📋 Planned |
| **Phase 4** | Ethernet, USB, PCIe, SDIO | 📋 Planned |
| **Phase 5** | AI / DSP / Crypto accelerators | 📋 Planned |
| **Phase 6** | ASIC synthesis exploration | 📋 Planned |

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        SMVDU-TITAN-X                            │
├─────────────────────────────────────────────────────────────────┤
│  CPU Cluster (Rocket / BOOM / CVA6)                             │
│  ├── L1 Instruction Cache + L1 Data Cache (per core)           │
│  ├── MMU + TLB                                                  │
│  └── RV64GC ISA                                                 │
│                          ↕                                      │
│              ┌─── TileLink NoC ───┐                            │
│                          ↕                                      │
│  Shared Resources: L2 Cache │ DDR │ DMA │ PLIC │ CLINT        │
│                          ↕                                      │
│  Peripherals: UART │ SPI │ I2C │ GPIO │ Ethernet │ PCIe       │
│                          ↕                                      │
│  Accelerators: AI Engine │ DSP │ Crypto │ Video               │
└─────────────────────────────────────────────────────────────────┘
```

---

## Software Stack

```
Applications
     │
Linux Userspace (BusyBox / Buildroot)
     │
Linux Kernel (RISC-V, riscv64)
     │
OpenSBI (Machine-mode runtime)
     │
U-Boot (Bootloader)
     │
SMVDU-TITAN-X Hardware
```

---

## Quick Start

```bash
# Clone with all submodules
git clone --recursive https://github.com/your-org/smvdu-titan-x.git
cd smvdu-titan-x

# Install system dependencies (Ubuntu 22.04/24.04)
sudo bash scripts/setup/install_deps.sh

# Install RISC-V toolchain
bash scripts/setup/setup_riscv_toolchain.sh

# Build Phase 1 firmware
cd software/firmware/hello_uart && make

# Set up Chipyard
bash scripts/setup/setup_chipyard.sh

# Run simulation
bash scripts/sim/run_verilator.sh
```

---

## Open-Source Dependencies

| Project | Purpose |
|---------|---------|
| [Chipyard](https://chipyard.readthedocs.io/) | SoC generation framework |
| [Rocket-Chip](https://github.com/chipsalliance/rocket-chip) | RISC-V processor generator |
| [BOOM](https://boom-core.org/) | Out-of-order RISC-V core |
| [CVA6](https://github.com/openhwgroup/cva6) | Application-class RISC-V core |
| [LiteX](https://github.com/enjoy-digital/litex) | FPGA rapid prototyping |
| [OpenSBI](https://github.com/riscv-software-src/opensbi) | M-mode runtime firmware |
| [Verilator](https://verilator.org/) | RTL simulation |
| [cocotb](https://www.cocotb.org/) | Python verification framework |
| [OpenROAD](https://theopenroadproject.org/) | ASIC place-and-route |

---

## License

SMVDU-TITAN-X is licensed under [Apache 2.0](https://github.com/your-org/smvdu-titan-x/blob/main/LICENSE).
