# System Interconnect — TileLink & AMBA Crossbars

The SMVDU-TITAN-X multicore processor SoC utilizes a highly modular system bus architecture to route transactions across coherent processor cores, high-speed memory controllers, and peripheral modules.

---

## 1. TileLink Interconnect Protocols

The primary system bus conforms to the open **TileLink** specification, featuring a highly robust, clean, and mathematically verified network-on-chip (NoC) design. The SoC incorporates three distinct TileLink channel levels:

*   **TileLink-C (Cached Coherence)**: Operates the L1-to-L2 memory boundary. It supports bidirectional transactions allowing hard harts to initiate snoops, checks, and cache block state transitions (e.g. invalidations, forwardings) to guarantee hardware-level coherence.
*   **TileLink-UH (Uncached High-performance)**: Interfaces high-bandwidth non-cached blocks (e.g. SPI Flash, GPIO). It supports burst operations, read-modify-write transactions, and multi-word sweeps.
*   **TileLink-UL (Uncached Light-weight)**: Routes lightweight control register accesses across MMIO peripheral registers (e.g. UART).

---

## 2. Crossbar Topologies

The interconnect framework utilizes dual-tier crossbar routers:

```
    ┌──────────────────────┐      ┌──────────────────────┐
    │  Rocket Core Harts   │      │  Co-processor / DMA  │
    └──────────┬───────────┘      └──────────┬───────────┘
               │                             │
    ┌──────────▼─────────────────────────────▼───────────┐
    │              TileLink System Bus (Coherent)        │
    └──────────┬─────────────────────────────┬───────────┘
               │                             │
    ┌──────────▼───────────┐      ┌──────────▼───────────┐
    │  DDR / HBM2 Memory   │      │   Periphery Bus      │
    │      Controller      │      └──────────┬───────────┘
    └──────────────────────┘                 │
                                  ┌──────────▼───────────┐
                                  │   UART / GPIO / SPI  │
                                  └──────────────────────┘
```

*   **System Bus (SBUS)**: A 64-bit wide coherent TileLink crossbar routing instructions and data between Rocket cores, L2 caches, and memory controllers.
*   **Periphery Bus (PBUS)**: A lightweight 32-bit wide bus isolated via clock dividers, routing uncached read/write registers to low-speed devices.

---

## 3. Bus Bridges & Protocol Converters

To interface with external open-source modules and industry CAD IP, the SoC incorporates protocol converters:

*   **TileLink-to-AXI4 Bridge**: Translates uncached TileLink burst transactions to standard 64-bit AXI4-compliant signals, interfacing high-speed DRAM blocks (LiteDRAM / HBM2).
*   **TileLink-to-APB Bridge**: Translates TileLink transactions into low-power Advanced Peripheral Bus (APB) commands to trigger registers inside GPIO or UART modules.
