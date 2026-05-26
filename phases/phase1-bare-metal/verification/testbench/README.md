# SMVDU-TITAN-X — Phase 1: Verification Testbench

This folder contains the SystemVerilog testbench used to run simulation verification checks on the SoC.

---

## Files

*   [`tb_titan_x_phase1.sv`](tb_titan_x_phase1.sv): A standard SystemVerilog top-level wrapper testbench. It generates the primary oscillator clock signal (`sys_clk`), toggles system reset (`sys_rst_n`), monitors the UART TX line, and simulates serial data receipt.
