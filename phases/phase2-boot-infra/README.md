# SMVDU-TITAN-X — Phase 2: Boot Infrastructure

[![Build Status](https://img.shields.io/badge/status-validated-success.svg)](#overview)
[![Architecture](https://img.shields.io/badge/ISA-RV64GC-blue.svg)](#overview)
[![Features](https://img.shields.io/badge/Boot ROM-OpenSBI-lightgrey.svg)](#overview)

Phase 2 builds upon the bare-metal foundation of Phase 1 to introduce a standardized boot sequence. It integrates an **SPI Flash Controller**, standard M-Mode boot firmware (**OpenSBI**), and a **GPIO controller**.

---

## Architecture Overview

Below is the verified microarchitecture block diagram of the SMVDU-TITAN-X Phase 2 RISC-V SoC:

![SMVDU-TITAN-X Phase 2 SoC Architecture Overview](docs/titan_x_phase2_architecture.png)

---

## Core Topology and Bus Interconnect

```mermaid
graph TD
    subgraph TitanX_SoC [Titan-X SoC Top Level]
        direction LR
        subgraph CoreComplex [Rocket Core Complex]
            Core[RV64GC CPU] <--> L1I[L1 I-Cache]
            Core <--> L1D[L1 D-Cache]
        end

        subgraph Interconnect [TileLink Interconnect]
            TL_Bus((TileLink))
        end

        L1I <--> TL_Bus
        L1D <--> TL_Bus

        subgraph MemorySubsystem [Boot & Memory]
            SPIFlash[SPI Flash Controller @ 0x10030000]
            BootROM[BootROM @ 0x00010000]
            DRAM[DDR3 / SRAM Controller]
        end

        subgraph Peripherals [MMIO Peripherals]
            UART[SiFive UART @ 0x10020000]
            GPIO[32-bit GPIO @ 0x54010000]
        end

        TL_Bus <--> SPIFlash
        TL_Bus <--> BootROM
        TL_Bus <--> DRAM
        TL_Bus <--> UART
        TL_Bus <--> GPIO
    end

    sys_clk[sys_clk] --> TitanX_SoC
    sys_rst_n[sys_rst_n] --> TitanX_SoC
    TitanX_SoC <--> gpio_pins[gpio_pins]
    TitanX_SoC <--> spi_pins[spi_pins]
```

---

## Directory Structure

```
smvdu-titan-x-phase2/
├── README.md                   # Phase overview & status
├── RESULTS.md                  # Verification plan & metrics
├── STRUCTURE.md                # Submodule folder explanation
├── docs/
│   ├── block_diagram.md        # Architectural schematics
│   ├── memory_map.md           # Address assignments (SPI, GPIO added)
│   └── design_spec.md          # Interface descriptions
├── rtl/
│   ├── peripherals/
│   │   └── titan_x_gpio.v      # GPIO Controller RTL stub
│   └── top/
│       └── titan_x_top.v       # Top Level SoC including SPI/GPIO
├── config/
│   └── TitanXPhase2Config.scala # Chipyard configuration recipe
├── firmware/
│   └── bootrom/                # OpenSBI and bootloader assembly stubs
└── verification/
    └── testbench/
        └── tb_titan_x_phase2.sv # SystemVerilog top testbench
```
