# SMVDU-TITAN-X — Phase 5: Acceleration Engine Firmware Guide

This document describes the software driver interfaces, custom inline assembly instructions, and memory maps for Phase 5 hardware accelerators: **RoCC Systolic Array ML Coprocessor** and the **MMIO Cryptographic Engine (AES-256 / SHA-3)**.

---

## 1. Rocket Custom Coprocessor (RoCC) Interface

The Systolic Array ML Coprocessor is tightly coupled to the Rocket Core via the RISC-V Custom Coprocessor interface (utilizing opcode `0x0B` / `custom0`).

### RoCC Instruction Format

Custom instructions are encoded using standard R-type layout fields:

| Field | Width | Description |
|---|---|---|
| **funct7** | 7 bits | Coprocessor function code: `0x01` (Load), `0x02` (Multiply), `0x03` (Read) |
| **rs2** | 5 bits | Source register 2 (holding data or operands) |
| **rs1** | 5 bits | Source register 1 (holding accumulator index or operand) |
| **xd** | 1 bit | Writeback response destination register flag |
| **xs1** | 1 bit | Read rs1 register flag |
| **xs2** | 1 bit | Read rs2 register flag |
| **rd** | 5 bits | Destination register for response writeback |
| **opcode** | 7 bits | Custom opcode `0x0B` |

---

## 2. RoCC Inline Assembly Macros & C API

For zero-overhead execution, we define C-preprocessor inline assembly macros wrapping raw instruction fields:

```c
// SMVDU-TITAN-X custom RoCC driver macros
#define ROCC_OPCODE 0x0B

// Load a 64-bit value into Systolic Accumulator [0-3]
#define asm_rocc_load(acc_idx, value) \
    __asm__ __volatile__ ( \
        ".insn r %0, 0x1, 0x01, x0, %1, %2" \
        : \
        : "i" (ROCC_OPCODE), "r" (acc_idx), "r" (value) \
    )

// Perform a matrix dot-multiply step (Accumulator 0 += rs1 * rs2)
#define asm_rocc_matmul(operand1, operand2) \
    __asm__ __volatile__ ( \
        ".insn r %0, 0x1, 0x02, x0, %1, %2" \
        : \
        : "i" (ROCC_OPCODE), "r" (operand1), "r" (operand2) \
    )

// Read the accumulated value out of Systolic Accumulator [0-3]
#define asm_rocc_read(acc_idx, result) \
    __asm__ __volatile__ ( \
        ".insn r %0, 0x1, 0x03, %1, %2, x0" \
        : "=r" (result) \
        : "i" (ROCC_OPCODE), "r" (acc_idx) \
    )
```

### High-Level Execution Sequence

```c
#include <stdint.h>

uint64_t run_matrix_accumulation(uint64_t val1, uint64_t val2) {
    uint64_t result = 0;
    
    // 1. Initialize accumulator 0 to base 0x500
    asm_rocc_load(0, 0x500);
    
    // 2. Perform systolic accumulation: acc[0] += val1 * val2
    asm_rocc_matmul(val1, val2);
    
    // 3. Read accumulator 0 back to CPU register
    asm_rocc_read(0, result);
    
    return result; // returns 0x508 if val1=2 and val2=4
}
```

---

## 3. Cryptographic MMIO Register Interface

The AES-256 and SHA-3 accelerators are accessed via memory-mapped control and data ports:

| MMIO Register | Physical Address | Access | Description |
|---|---|---|---|
| `CRYPTO_CTRL` | `0x5900_0000` | R/W | Bit [0]: AES Start, Bit [1]: SHA Start, Bit [2]: Busy |
| `CRYPTO_DATA_IN` | `0x5900_0008` | W | 64-bit Input plain-text data buffer |
| `CRYPTO_KEY_0` | `0x5900_0010` | W | 256-bit Key Block word 0 |
| `CRYPTO_KEY_1` | `0x5900_0018` | W | 256-bit Key Block word 1 |
| `CRYPTO_KEY_2` | `0x5900_0020` | W | 256-bit Key Block word 2 |
| `CRYPTO_KEY_3` | `0x5900_0028` | W | 256-bit Key Block word 3 |
| `CRYPTO_AES_OUT`| `0x5900_0030` | R | 64-bit AES Ciphertext response buffer |
| `CRYPTO_SHA_OUT`| `0x5900_0038` | R | 64-bit SHA-3 Compression digest hash buffer |

---

## 4. Multi-Channel HBM2 Interconnect Settings

Physical HBM2 AXI4 lanes are routed directly from the custom crossbar core, mapping HBM2 Channel 0 memory space from `0x8000_0000` to `0x8FFF_FFFF` (256 MB) and Channel 1 space from `0x9000_0000` to `0x9FFF_FFFF` (256 MB). 
No software configuration is required for memory routing, as hardware controllers manage address interleaving transparently.
