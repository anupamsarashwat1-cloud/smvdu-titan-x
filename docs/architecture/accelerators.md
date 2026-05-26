# Accelerator Subsystems — RoCC & Cryptography

To achieve high energy efficiency and performance in computational domains, the SMVDU-TITAN-X multicore processor SoC integrates highly optimized, custom hardware acceleration blocks.

---

## 1. RoCC Systolic Array Coprocessor

The RISC-V architecture supports custom instruction set extensions via the **Rocket Custom Coprocessor (RoCC)** interface. The integrated AI/ML accelerator is a custom systolic array engine:

```
                  ┌──────────────────────────────────────────────┐
                  │              Rocket Core CPU                 │
                  └──────┬────────────────────────────────▲──────┘
                         │                                │
                         │ Dispatches RoCC                │ Writeback Response
                         │ Command (Opcode 0x0B)          │ (rd, data)
                         ▼                                │
  ┌───────────────────────────────────────────────────────┴──────┐
  │                      RoCC Decoder Unit                       │
  └──────┬──────────────────────┬──────────────────────┬─────────┘
         │                      │                      │
         │ Load (funct=0x01)    │ MatMul (funct=0x02)  │ Read (funct=0x03)
         ▼                      ▼                      ▼
  ┌──────────────┐      ┌──────────────┐      ┌──────────────┐
  │ Accumulators │ ◄──  │ 8x8 Systolic │      │ Writeback    │
  │    [0-3]     │      │ Compute Core │ ───► │  Data Reg    │
  └──────────────┘      └──────────────┘      └──────────────┘
```

*   **Tightly Coupled Integration**: The coprocessor shares the L1 data cache and can perform direct memory accesses (DMA) to physical memory, bypassing core-level pipeline stalls.
*   **Instruction Set Extensions**: Responsive to custom instructions dispatched on opcode `0x0B`.
    *   `LOAD_ACC` (`funct7 = 0x01`): Loads a 64-bit value into a target systolic accumulator register (`[0-3]`).
    *   `MAT_MUL` (`funct7 = 0x02`): Triggers the 8x8 INT8 systolic multiplication engine, performing element dot-products and accumulating the result.
    *   `READ_ACC` (`funct7 = 0x03`): Reads the value out of a target accumulator register and returns it to the CPU's register file.

---

## 2. Memory-Mapped Cryptographic Core

For high-speed secure transactions, a dedicated cryptographic accelerator block is integrated in the MMIO peripheral space:

*   **AES-256 Block Cipher**: Features a synthesizable 14-cycle iterative encryption engine. It takes a 256-bit key (loaded in four 64-bit register blocks) and performs AES encryption with minimal area overhead.
*   **SHA-3 Compression Hashing Core**: Features a synthesizable hashing compressor, generating secure circular-shifted block digests.

---

## 3. High-Bandwidth Memory (HBM2) Integration

To feed computational accelerators with zero-overhead memory access speeds, Phase 5 integrates a multi-channel HBM2 AXI4 interface. The custom interconnect manages transparent address translation, allowing concurrent memory sweeps up to 1 Terabyte-per-second bandwidth.
