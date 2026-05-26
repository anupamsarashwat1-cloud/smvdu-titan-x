# SMVDU-TITAN-X — Phase 1: Results and Validation Reports

This document tracks the official simulation and compliance validation results for Phase 1. All tests have been executed on the synthesizable RTL using Verilator and Spike.

---

## 1. Fast Smoke Test (`exit_test`)

The `exit_test` is a minimal 24-byte assembly test designed to verify that the processor boots from the baseline DRAM address `0x8000_0000`, executes instruction blocks, and communicates back with the simulation host using the Host-Target Interface (HTIF) `tohost` channel.

### Execution Log (Verilator RTL)
```
[INFO]  Config:   TitanXPhase1Config
[INFO]  Firmware: software/firmware/exit_test/exit_test.elf
[INFO]  Timeout:  10000000 cycles
━━━ Activating Chipyard environment ━━━
━━━ Checking simulator binary ━━━
[INFO]  Simulator: hardware/chipyard/sims/verilator/simulator-chipyard.harness-TitanXPhase1Config
━━━ Checking firmware ━━━
[INFO]  Firmware size:
   text    data     bss     dec     hex filename
     24       0       0      24      18 software/firmware/exit_test/exit_test.elf
━━━ Running simulation ━━━
make[1]: Entering directory 'hardware/chipyard/sims/verilator'
./simulator-chipyard.harness-TitanXPhase1Config +max-cycles-10000000 +verbose +rf-trace-off +permissive +permissive-off software/firmware/exit_test/exit_test.elf 2>&1 | tee output/chipyard.harness.TestHarness.TitanXPhase1Config/exit_test.log
Using SimDRAM 2048MB.
DRAMSim2: Configured:
  System:  2048 MB (16384 tcks)
  Device:  DRAMSim2 DDR3 2GB
  Timing:  1000 ps (1 ns) clock cycle
[SimDRAM] Load BIN/ELF file: software/firmware/exit_test/exit_test.elf
*** PASSED *** after 99392 cycles
make[1]: Leaving directory 'hardware/chipyard/sims/verilator'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ✓ Simulation PASSED
  Time:    11s
  Log:     hardware/chipyard/sims/verilator/output/chipyard.harness.TestHarness.TitanXPhase1Config/exit_test.log
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 2. Boot Console Test (`hello_uart`)

`hello_uart` validates the SiFive UART peripheral mapped at `0x1002_0000`. The firmware writes a boot banner character-by-character to the transmitter register, checking the queue status (full bit) to prevent overwriting.

### Boot Console Output
```
=========================================
      SMVDU-TITAN-X Microprocessor
=========================================
  Phase 1: Bare-Metal Bring-Up Complete!
  Core:    RISC-V RV64GC Rocket Core
  Freq:    500 MHz (Simulation Model)
  UART:    Active @ 0x10020000
  HTIF:    Validated @ 0x80001000
=========================================
System Boot BANNER completed successfully!
Exiting simulation via HTIF tohost.
```

---

## 3. ISA Compliance Tests

The ISA suite checks the processor against the official RISC-V user-level standard vectors.

### A. Spike Functional Simulator (62/62 PASS)
Functional ISA tests verify instruction behavior in the golden simulator:
*   **rv64ui (User-Level Integer - 49 tests)**: `add`, `addi`, `and`, `beq`, `bge`, `bgeu`, `blt`, `bltu`, `bne`, `jal`, `jalr`, `lb`, `lbu`, `lh`, `lhu`, `lui`, `lw`, `lwu`, `ld`, `or`, `ori`, `sb`, `sh`, `sw`, `sd`, `sll`, `slli`, `slliw`, `sllw`, `slt`, `slti`, `sltiu`, `sltu`, `sra`, `srai`, `sraiw`, `sraw`, `srl`, `srli`, `srliw`, `srlw`, `sub`, `subw`, `xor`, `xori`, `addiw`, `addw`, `auipc`.
*   **rv64um (Multiply/Divide Extension - 13 tests)**: `mul`, `mulh`, `mulhsu`, `mulhu`, `mulw`, `div`, `divu`, `divuw`, `divw`, `rem`, `remu`, `remuw`, `remw`.

```
=== PASS=62 FAIL=0 ===
```

### B. Verilator RTL Simulator (10/10 PASS)
Tests mapped directly into the synthesizable Verilator model to verify instruction pipeline decoding and write-back paths:
```
  ✓ PASS  rv64ui-p-add
  ✓ PASS  rv64ui-p-and
  ✓ PASS  rv64ui-p-beq
  ✓ PASS  rv64ui-p-jal
  ✓ PASS  rv64ui-p-lw
  ✓ PASS  rv64ui-p-sw
  ✓ PASS  rv64ui-p-lui
  ✓ PASS  rv64um-p-mul
  ✓ PASS  rv64um-p-div
  ✓ PASS  rv64um-p-rem

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Total:  10
  Passed: 10
  Failed: 0
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
