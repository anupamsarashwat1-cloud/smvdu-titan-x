# Running your First SoC Simulation

To verify the hardware correctness of the SMVDU-TITAN-X designs before synthesis, you can execute Verilator simulation sweeps.

---

## 1. Building the Verilator Simulator

To generate a C++ cycle-accurate simulation model for a custom configuration, utilize Chipyard's simulator build flow:

```bash
# Navigate to Verilator simulation workspace
cd hardware/chipyard/sims/verilator/

# Build Verilator model targeting Phase 1 config (Single-Core Rocket)
make CONFIG=TitanXPhase1Config
```

This compiles Chisel sources to FIRRTL, runs logical optimizations, generates Verilog code, and compiles it via Verilator to a structural binary executable inside the `verilator/` directory.

---

## 2. Compiling Bare-Metal Firmware

Compile standard firmware test suites using the RISC-V cross-compilers:

```bash
cd software/firmware/hello_uart/
# Compile to hello_uart.bin / hello_uart.elf
make
```

---

## 3. Running the Simulation

Execute the compiled simulator model, passing the firmware hex target as input:

```bash
cd hardware/chipyard/sims/verilator/
./simulator-chipyard-TitanXPhase1Config +loadmem=../../../software/firmware/hello_uart/hello_uart.hex
```

The simulation will execute bare-metal assembly steps cycle-by-cycle, displaying UART register output to the host console.
