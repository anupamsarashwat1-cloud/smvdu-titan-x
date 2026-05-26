# SMVDU-TITAN-X — Phase 5: Architectural Block Diagram

This document contains the structural block diagrams for the SMVDU-TITAN-X Phase 5 SoC.

---

## 1. SoC Block Diagram

The block diagram below represents the system hierarchy of Phase 5, highlighting the custom RoCC coprocessor and security block:

```mermaid
graph TB
    subgraph ChipBoundary [Titan-X SoC Top Level]
        subgraph CoreComplex [Rocket Core Complex]
            Core[RV64GC Rocket Core]
            RoCC[RoCC Coprocessor Interface]
            SystolicArray[AI Systolic Array 8x8 INT8]

            Core <--> RoCC
            RoCC <--> SystolicArray
        end

        subgraph Interconnect [TileLink Coherent Interconnect]
            SystemBus[TileLink System Bus]
            ControlBus[TileLink Control Bus]
            SystemBus <--> ControlBus
        end

        Core <--> SystemBus

        subgraph Security [Security Subsystem]
            Crypto[Crypto Engine AES/SHA/TRNG @ 0x65000000]
        end

        subgraph MemorySubsystem [High-Speed Memory]
            HBM[HBM2 Memory Controller @ 0x80000000]
        end

        SystemBus <--> Security
        SystemBus <--> HBM
    end

    sys_clk[sys_clk] --> ChipBoundary
    sys_rst_n[sys_rst_n] --> ChipBoundary
    ChipBoundary <--> hbm_bus[HBM2 Bus]
```
