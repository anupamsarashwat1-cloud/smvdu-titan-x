# Phase 5 — Systolic Array & Cryptographic Accelerators

Phase 5 represents the peak computational capability of the SMVDU-TITAN-X processor, integrating dedicated coprocessor units and high-speed memory architectures.

---

## 1. Accelerator Architectures

*   **Processor Core**: Single Huge RV64GC Rocket Core.
*   **RoCC Systolic Array ML Coprocessor**:
    *   Tightly coupled to the CPU pipeline via the Rocket Custom Coprocessor (RoCC) interface.
    *   Executes high-performance 8x8 INT8 matrix dot-multiply accumulations.
    *   Integrates four 64-bit internal accumulation registers.
    *   Responsive to custom instructions dispatched on opcode `0x0B` (custom0).
*   **Multi-Channel HBM2 Interconnect**:
    *   AXI4-compliant multi-channel HBM2 physical layers.
    *   Maps Channel 0 memory space from `0x8000_0000` to `0x8FFF_FFFF` (256 MB) and Channel 1 space from `0x9000_0000` to `0x9FFF_FFFF` (256 MB) for terabyte-per-second memory bandwidth.
*   **Cryptographic Hardware Accelerator**:
    *   Memory-mapped at `0x5900_0000`.
    *   Integrates a high-throughput, synthesizable AES-256 block cipher engine.
    *   Includes a SHA-3 compression hashing engine.

---

## 2. Chipyard Configuration Trait

The coprocessor layout is registered inside the Chipyard package:

```scala
class WithSystolicMLCoprocessor extends Config((site, here, up) => {
  case BuildRoCC => Seq(
    (p: Parameters) => {
      val ml_coproc = LazyModule(new SystolicArrayCoprocessor(Opcode(0))(p))
      ml_coproc
    }
  )
})

class TitanXPhase5Config extends Config(
  new WithSystolicMLCoprocessor ++                                                     // Custom RoCC Systolic Array
  new freechips.rocketchip.subsystem.WithInclusiveCache ++                             // Coherent L2 Cache
  new chipyard.config.WithGPIO(address = 0x54010000, width = 32) ++                    // GPIO Controller
  new chipyard.config.WithSPIFlash(address = 0x10030000, fAddress = 0x20000000) ++     // SPI Flash Controller
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++                                 // Single RISC-V Rocket Core
  new chipyard.config.AbstractConfig                                                   // baseline system
)
```

---

## 3. Custom Assembly C API Driver

Zero-overhead execution is achieved using inline assembly macro wrappers:

```c
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
