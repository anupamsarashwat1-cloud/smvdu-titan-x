# SMVDU-TITAN-X — Phase 4: High-Speed I/O

[![Build Status](https://img.shields.io/badge/status-planned-yellow.svg)](#overview)
[![Architecture](https://img.shields.io/badge/ISA-RV64GC-blue.svg)](#overview)
[![IO Interfaces](https://img.shields.io/badge/Interfaces-PCIe_/_USB_/_HDMI-magenta.svg)](#overview)

Phase 4 expands the physical system interface scope by integrating high-speed communication blocks: **PCIe Gen2 Controller**, **USB 2.0 OTG Controller**, and **HDMI Display Controller**, operating on an upgraded coherent dual-core CPU topology.

---

## Architecture Overview

![Titan-X Phase 4 Microarchitecture Block Diagram](docs/titan_x_phase4_architecture.png)

```mermaid
graph TD
    subgraph TitanX_SoC [Titan-X SoC Top Level]
        direction LR
        subgraph CoreComplex [Dual-Core Rocket SMP]
            Core0[Core 0] <--> L2[Shared L2 Cache 512KB]
            Core1[Core 1] <--> L2
        end

        subgraph Interconnect [TileLink System Bus]
            TL_Bus((TileLink))
        end

        L2 <--> TL_Bus

        subgraph HighSpeedIO [High-Speed Interfaces]
            PCIe[PCIe Gen2 x4 Controller @ 0x57000000]
            USB[USB 2.0 OTG Controller @ 0x56000000]
            HDMI[HDMI 1.4 Frame Buffer @ 0x58000000]
        end

        TL_Bus <--> PCIe
        TL_Bus <--> USB
        TL_Bus <--> HDMI
    end

    sys_clk[sys_clk] --> TitanX_SoC
    sys_rst_n[sys_rst_n] --> TitanX_SoC
    TitanX_SoC <--> pcie_lanes[PCIe Tx/Rx Lanes]
    TitanX_SoC <--> usb_pads[USB Differential Pads]
    TitanX_SoC --> hdmi_ports[HDMI Output Channel]
```

---

## Directory Structure

```
smvdu-titan-x-phase4/
├── README.md                   # Phase overview & status
├── RESULTS.md                  # Verification plan & metrics
├── STRUCTURE.md                # Submodule folder explanation
├── docs/
│   ├── block_diagram.md        # Architectural schematics
│   └── design_spec.md          # Interface descriptions
├── config/
│   └── TitanXPhase4Config.scala # Chipyard configuration recipe (Dual-Core Rocket)
└── verification/
    └── testbench/
        └── tb_titan_x_phase4.sv # SystemVerilog top testbench
```
