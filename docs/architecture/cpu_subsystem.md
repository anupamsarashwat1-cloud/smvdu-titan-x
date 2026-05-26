# CPU Subsystem — Rocket Core Cluster

The core computational block of the SMVDU-TITAN-X multicore processor SoC utilizes the **Rocket Core**, a 64-bit, 5-stage in-order RISC-V scalar processor conforming to the **RV64GC** (RV64IMAFDC) Instruction Set Architecture.

---

## 1. Microarchitectural Parameters

The Rocket Core is configured for high efficiency and performance:

*   **Instruction Pipeline**: 5-stage in-order execution pipeline (Fetch, Decode, Execute, Memory, Writeback).
*   **Integer Unit**: Integrates a single-cycle hardware multiplier and a radix-4 iterative division unit.
*   **Floating-Point Unit**: Compliant with IEEE-754 single and double-precision floating-point specifications.
*   **Memory Management Unit (MMU)**: Supports the **Sv39 Virtual Memory** paging scheme, enabling standard hardware page table translations for Linux supervisor kernel threads.

---

## 2. Memory Hierarchy & Caches

To optimize data access bandwidth and prevent memory access stalls, the Rocket complex is integrated with private caches and shared coherent levels:

### L1 Caches (Private)
*   **L1 Instruction Cache (I-Cache)**: 32 KB capacity, 4-way set-associative, with Error Correcting Code (ECC) protection.
*   **L1 Data Cache (D-Cache)**: 32 KB capacity, 4-way set-associative, write-back structure with ECC.

### Shared L2 Cache
*   **Inclusive Shared L2 Cache**: A 512 KB TileLink-Coherent (TileLink-C) level managing hardware coherence protocols. It processes cache-line state transitions seamlessly across multiple private harts.

---

## 3. Branch Prediction

To maximize pipeline throughput, the Fetch stage incorporates a dual-tier hardware branch prediction engine:

*   **Branch Target Buffer (BTB)**: A 40-entry table predicting instruction target addresses.
*   **Branch Predictor (BHT)**: A highly accurate Gshare branch history table using global history registers to predict directional outcomes.
*   **Return Address Stack (RAS)**: A 6-entry stack predicting return targets for `JALR` instructions.
