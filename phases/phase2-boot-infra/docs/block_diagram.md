# SMVDU-TITAN-X — Phase 2: Architectural Block Diagram

This document contains the structural block diagrams for the SMVDU-TITAN-X Phase 2 SoC.

---

## 1. SoC Block Diagram

The block diagram below represents the system hierarchy of Phase 2, highlighting the addition of SPI and GPIO controllers:

```mermaid
graph TB
    subgraph ChipBoundary [Titan-X SoC Top Level]
        subgraph CoreComplex [Rocket Core Complex]
            Core[RV64GC Rocket Core]
            L1I[32KB L1 Instruction Cache]
            L1D[32KB L1 Data Cache]
            MMU[RISC-V MMU SV39]

            Core <--> L1I
            Core <--> L1D
            Core <--> MMU
        end

        subgraph Interconnect [TileLink Interconnect]
            SystemBus[TileLink System Bus]
            ControlBus[TileLink Control Bus]
            SystemBus <--> ControlBus
        end

        L1I <--> SystemBus
        L1D <--> SystemBus

        subgraph Peripherals [MMIO Peripherals]
            UART[SiFive UART @ 0x10020000]
            BootROM[BootROM 10KB @ 0x00010000]
            SPI[SPI Flash Controller @ 0x54020000]
            GPIO[GPIO Controller @ 0x54010000]
        end

        ControlBus <--> UART
        ControlBus <--> GPIO
        ControlBus <--> SPI
        SystemBus <--> BootROM

        subgraph MemorySubsystem [Memory Hierarchy]
            L2[Inclusive Shared L2 Cache 512KB]
            DRAMSim[DDR Controller]
        end

        SystemBus <--> L2
        L2 <--> DRAMSim
    end

    sys_clk[sys_clk] --> ChipBoundary
    sys_rst_n[sys_rst_n] --> ChipBoundary
    ChipBoundary --> uart_tx[uart0_tx]
    uart_rx[uart0_rx] --> ChipBoundary
    ChipBoundary <--> gpio_pins[gpio_pins]
    ChipBoundary <--> spi_pins[spi_pins]
```
