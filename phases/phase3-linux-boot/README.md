# SMVDU-TITAN-X — Phase 3: Linux Boot

[![Build Status](https://img.shields.io/badge/status-validated-success.svg)](#overview)
[![Architecture](https://img.shields.io/badge/ISA-RV64GC-blue.svg)](#overview)
[![Linux Support](https://img.shields.io/badge/Linux-6.x-green.svg)](#overview)

Phase 3 targets a fully bootable Linux environment. It scales up the interconnect and clock trees to interface with external **DDR Memory Controllers** (LiteDRAM), **Ethernet MACs** (LiteETH), and **SD Card Storage** to boot standard Linux kernels.

---

## Architecture Overview

Below is the verified microarchitecture block diagram of the SMVDU-TITAN-X Phase 3 RISC-V SoC:

![SMVDU-TITAN-X Phase 3 SoC Architecture Overview](docs/titan_x_phase3_architecture.png)

---

## Core Topology and Bus Interconnect

```mermaid
graph TD
    subgraph TitanX_SoC [Titan-X SoC Top Level]
        direction LR
        subgraph CoreComplex [Quad-Core Rocket SMP]
            Core0[Core 0] <--> L2[Shared L2 Cache 512KB]
            Core1[Core 1] <--> L2
            Core2[Core 2] <--> L2
            Core3[Core 3] <--> L2
        end

        subgraph Interconnect [TileLink Coherent Interconnect]
            TL_Bus((TileLink))
        end

        L2 <--> TL_Bus

        subgraph MemorySubsystem [Memory Hierarchy]
            LiteDRAM[DDR3/4 Memory Controller @ 0x80000000]
            LiteETH[Gigabit Ethernet MAC @ 0x55000000]
            SPI_SD[SD Card Reader SPI @ 0x54020000]
        end

        TL_Bus <--> LiteDRAM
        TL_Bus <--> LiteETH
        TL_Bus <--> SPI_SD
    end

    sys_clk[sys_clk] --> TitanX_SoC
    sys_rst_n[sys_rst_n] --> TitanX_SoC
    TitanX_SoC <--> ddr_bus[DDR3/4 Bus]
    TitanX_SoC <--> eth_pins[Ethernet PHY RJ45]
    TitanX_SoC <--> sd_pins[SD Card Reader]
```

---

## Directory Structure

```
smvdu-titan-x-phase3/
├── README.md                   # Phase overview & status
├── RESULTS.md                  # Verification plan & metrics
├── STRUCTURE.md                # Submodule folder explanation
├── docs/
│   ├── block_diagram.md        # Architectural schematics
│   ├── memory_map.md           # Address assignments (DDR, Ethernet added)
│   └── design_spec.md          # Interface descriptions
├── config/
│   └── TitanXPhase3Config.scala # Chipyard configuration recipe (Quad-Core Rocket)
└── verification/
    └── testbench/
        └── tb_titan_x_phase3.sv # SystemVerilog top testbench
```
