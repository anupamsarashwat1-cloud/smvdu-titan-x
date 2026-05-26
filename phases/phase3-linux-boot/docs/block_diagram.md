# SMVDU-TITAN-X — Phase 3: Architectural Block Diagram

This document contains the structural block diagrams for the SMVDU-TITAN-X Phase 3 SoC.

---

## 1. SoC Block Diagram

The block diagram below represents the system hierarchy of Phase 3, highlighting the shared L2 cache and external memory controllers:

```mermaid
graph TB
    subgraph ChipBoundary [Titan-X SoC Top Level]
        subgraph CoreComplex [Quad-Core Rocket SMP]
            Core0[Core 0]
            Core1[Core 1]
            Core2[Core 2]
            Core3[Core 3]
            L2[Inclusive Shared L2 Cache 512KB]

            Core0 <--> L2
            Core1 <--> L2
            Core2 <--> L2
            Core3 <--> L2
        end

        subgraph Interconnect [TileLink Coherent Interconnect]
            SystemBus[TileLink System Bus]
            ControlBus[TileLink Control Bus]
            SystemBus <--> ControlBus
        end

        L2 <--> SystemBus

        subgraph Peripherals [MMIO Peripherals]
            UART[SiFive UART @ 0x10020000]
            BootROM[BootROM 10KB @ 0x00010000]
            CLINT[CLINT Timer @ 0x02000000]
            PLIC[PLIC Interrupts @ 0x0C000000]
        end

        ControlBus <--> UART
        ControlBus <--> CLINT
        ControlBus <--> PLIC
        SystemBus <--> BootROM

        subgraph MemorySubsystem [Memory & High-Speed I/O]
            LiteDRAM[DDR3/4 DRAM Controller @ 0x80000000]
            LiteETH[Gigabit Ethernet MAC @ 0x55000000]
            SPI_SD[SD Card Reader SPI @ 0x54020000]
        end

        SystemBus <--> LiteDRAM
        SystemBus <--> LiteETH
        SystemBus <--> SPI_SD
    end

    sys_clk[sys_clk] --> ChipBoundary
    sys_rst_n[sys_rst_n] --> ChipBoundary
    ChipBoundary --> uart_tx[uart0_tx]
    uart_rx[uart0_rx] --> ChipBoundary
    ChipBoundary <--> ddr_bus[DDR Bus]
    ChipBoundary <--> eth_pins[Ethernet RJ45]
    ChipBoundary <--> sd_pins[SD Card]
```
