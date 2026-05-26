# SMVDU-TITAN-X — Phase 1: Architectural Block Diagram

This document contains the structural block diagrams for the SMVDU-TITAN-X Phase 1 bare-metal processor.

---

## 1. High-Level SoC Block Diagram

The block diagram below represents the exact system hierarchy of the custom generated RISC-V SoC:

```mermaid
graph TB
    subgraph ChipBoundary [Titan-X SoC Top Level]
        subgraph CoreComplex [Rocket Core Complex]
            Core[RV64GC Rocket Core]
            L1I[32KB L1 Instruction Cache]
            L1D[32KB L1 Data Cache]
            MMU[RISC-V MMU SV39]
            FPU[Double-Precision FPU]

            Core <--> L1I
            Core <--> L1D
            Core <--> MMU
            Core <--> FPU
        end

        subgraph Interconnect [Coherent interconnect]
            SystemBus[TileLink System Bus]
            ControlBus[TileLink Control Bus]
            SystemBus <--> ControlBus
        end

        L1I <--> SystemBus
        L1D <--> SystemBus

        subgraph Peripherals [MMIO Peripherals]
            UART[SiFive UART @ 0x10020000]
            BootROM[BootROM 10KB @ 0x00010000]
            CLINT[CLINT Timer/IPI @ 0x02000000]
            PLIC[PLIC Interrupts @ 0x0C000000]
        end

        ControlBus <--> UART
        ControlBus <--> CLINT
        ControlBus <--> PLIC
        SystemBus <--> BootROM

        subgraph MemorySubsystem [Memory Hierarchy]
            L2[Inclusive Shared L2 Cache 512KB]
            DRAMSim[SimDRAM 2GB DDR3]
            HTIF[HTIF Host-Target Interface]
        end

        SystemBus <--> L2
        L2 <--> DRAMSim
        SystemBus <--> HTIF
    end

    sys_clk[sys_clk 100MHz] --> ChipBoundary
    sys_rst_n[sys_rst_n] --> ChipBoundary
    ChipBoundary --> uart_tx[uart0_tx]
    uart_rx[uart0_rx] --> ChipBoundary
```

---

## 2. Bus Architecture and Address Domains

*   **TileLink-C (Coherent)**: Links L1 Instruction and Data caches to the shared L2 Cache. Manages hardware-enforced cache coherency.
*   **TileLink-UH (Uncached High-performance)**: Standard non-coherent bridge interfacing the BootROM and high-speed memory spaces.
*   **TileLink-UL (Uncached Light-weight)**: Feeds MMIO control buses for lower-speed registers such as UART, CLINT, and PLIC.
