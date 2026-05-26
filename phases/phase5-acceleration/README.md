# SMVDU-TITAN-X — Phase 5: Acceleration Engine

[![Build Status](https://img.shields.io/badge/status-planned-yellow.svg)](#overview)
[![Architecture](https://img.shields.io/badge/ISA-RV64GC-blue.svg)](#overview)
[![Accelerator](https://img.shields.io/badge/Engine-AI_Systolic_/_Crypto-darkgreen.svg)](#overview)

Phase 5 represents the peak computational capability of the SMVDU-TITAN-X processor, targeted for ASIC and advanced FPGA systems. It integrates custom **AI/ML Systolic Array Coprocessors** via the Rocket Custom Coprocessor (RoCC) interface and dedicated **Cryptographic Hardware Accelerators** (AES-256, SHA-3, TRNG).

---

## Architecture Overview

![Titan-X Phase 5 Microarchitecture Block Diagram](docs/titan_x_phase5_architecture.png)

```mermaid
graph TD
    subgraph TitanX_SoC [Titan-X SoC Top Level]
        direction LR
        subgraph CoreComplex [Rocket Core Complex]
            Core[RV64GC CPU] <--> RoCC[RoCC Interface]
            RoCC <--> SystolicArray[AI Systolic Array 8x8 INT8]
        end

        subgraph Interconnect [TileLink Coherent Interconnect]
            TL_Bus((TileLink))
        end

        Core <--> TL_Bus

        subgraph Security [Security Subsystem]
            Crypto[Crypto Engine AES/SHA/TRNG @ 0x65000000]
        end

        subgraph MemorySubsystem [High-Speed Memory]
            HBM[HBM2 Memory Controller @ 0x80000000]
        end

        TL_Bus <--> Security
        TL_Bus <--> HBM
    end

    sys_clk[sys_clk] --> TitanX_SoC
    sys_rst_n[sys_rst_n] --> TitanX_SoC
    TitanX_SoC <--> hbm_interface[HBM2 Memory Interface]
```

---

## Directory Structure

```
smvdu-titan-x-phase5/
├── README.md                   # Phase overview & status
├── RESULTS.md                  # Verification plan & metrics
├── STRUCTURE.md                # Submodule folder explanation
├── docs/
│   ├── block_diagram.md        # Architectural schematics
│   └── design_spec.md          # Interface descriptions
├── config/
│   └── TitanXPhase5Config.scala # Chipyard configuration recipe (RoCC Custom Accelerator)
└── verification/
    └── testbench/
        └── tb_titan_x_phase5.sv # SystemVerilog top testbench
```
