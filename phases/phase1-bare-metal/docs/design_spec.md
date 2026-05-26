# SMVDU-TITAN-X — Phase 1: Microarchitectural and Design Specification

This document details the configuration, parameters, and signal interfaces for the Phase 1 SoC architecture of SMVDU-TITAN-X.

---

## 1. Core Specification

The processor core is generated using the open-source UC Berkeley Rocket Chip generator inside the Chipyard framework.

| Parameter | Configuration |
|---|---|
| **Core Architecture** | RISC-V RV64GC (IMA-F-D-C) |
| **Pipeline Stages** | 5-stage in-order integer pipeline |
| **Floating-Point Unit** | Single & double precision hardware support |
| **MMU Support** | Sv39 Virtual Memory |
| **L1 Instruction Cache** | 32 KB, 4-way set-associative |
| **L1 Data Cache** | 32 KB, 4-way set-associative |
| **Branch Predictor** | BHT (Branch History Table) + RAS (Return Address Stack) |
| **Multiplier / Divider** | Hardware pipelined multiplier + iterative divider |

---

## 2. SoC System Configuration

Phase 1 integrates a lean, hardware-validated configuration targeting simulation and early FPGA deployment.

### System Peripherals
*   **SiFive UART**: Operating at MMIO base `0x1002_0000`, containing:
    *   Transmit Data Register (`txdata`): `0x00`
    *   Receive Data Register (`rxdata`): `0x04`
    *   Transmit Control Register (`txctrl`): `0x08`
    *   Receive Control Register (`rxctrl`): `0x0C`
    *   Baud Rate Divisor Register (`div`): `0x18`
*   **BootROM**: 10KB localized at `0x0001_0000` containing standard boot strap code pointing the execution program counter (`PC`) to `0x8000_0000` (DRAM start).
*   **CLINT**: Core-Local Interrupt Controller mapped at `0x0200_0000` handling software and timer interrupts (`mtime`, `mtimecmp`).

---

## 3. Top-Level External Interfaces

The top-level verilog interface (`titan_x_top.v`) provides clear logical boundaries for system integration:

*   **`sys_clk`** (Input): System clock input (100 MHz reference).
*   **`sys_rst_n`** (Input): Active-low asynchronous master reset.
*   **`uart0_rx`** (Input) / **`uart0_tx`** (Output): Serial terminal control pins.
*   **`gpio[31:0]`** (Inout): General-purpose external pins.
*   **`led[3:0]`** (Output): Board-level diagnostic LEDs showing system state.
