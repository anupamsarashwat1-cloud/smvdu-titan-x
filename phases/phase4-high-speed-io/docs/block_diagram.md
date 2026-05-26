# SMVDU-TITAN-X — Phase 4: Architectural Block Diagram

This document contains the structural block diagrams for the SMVDU-TITAN-X Phase 4 SoC.

---

## 1. SoC Block Diagram

The block diagram below represents the system hierarchy of Phase 4, highlighting the PCIe, USB and HDMI controllers:

![Titan-X Phase 4 Microarchitecture Block Diagram](titan_x_phase4_architecture.png)

```mermaid
graph TB
    subgraph ChipBoundary [Titan-X SoC Top Level]
        subgraph CoreComplex [Dual-Core Rocket SMP]
            Core0[Core 0]
            Core1[Core 1]
            L2[Inclusive Shared L2 Cache 512KB]

            Core0 <--> L2
            Core1 <--> L2
        end

        subgraph Interconnect [TileLink Coherent Interconnect]
            SystemBus[TileLink System Bus]
            ControlBus[TileLink Control Bus]
            SystemBus <--> ControlBus
        end

        L2 <--> SystemBus

        subgraph HighSpeedIO [High-Speed Interfaces]
            PCIe[PCIe Gen2 x4 Controller @ 0x57000000]
            USB[USB 2.0 OTG Controller @ 0x56000000]
            HDMI[HDMI 1.4 Frame Buffer @ 0x58000000]
        end

        SystemBus <--> PCIe
        SystemBus <--> USB
        SystemBus <--> HDMI

        subgraph Peripherals [Standard Peripherals]
            UART[SiFive UART @ 0x10020000]
        end

        ControlBus <--> UART
    end

    sys_clk[sys_clk] --> ChipBoundary
    sys_rst_n[sys_rst_n] --> ChipBoundary
    ChipBoundary <--> pcie_lanes[PCIe Lanes]
    ChipBoundary <--> usb_pads[USB Pads]
    ChipBoundary --> hdmi_ports[HDMI Out]
```
