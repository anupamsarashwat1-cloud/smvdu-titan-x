# Hardware RTL

This directory contains all RTL source files for the SMVDU-TITAN-X SoC.

## Directory Structure

```
rtl/
├── core/          # CPU core wrappers and configuration
├── interconnect/  # TileLink NoC, AXI bridges, APB bridges
├── memory/        # Cache subsystems, DDR controller interfaces
├── peripherals/   # UART, SPI, I2C, GPIO, Ethernet, USB, PCIe
├── accelerators/  # AI, DSP, Crypto, Video engines
└── top/           # Top-level SoC integration and memory map
```

## Design Language

- **Primary**: Chisel (Scala) via Chipyard
- **Wrappers**: Verilog/SystemVerilog for third-party IP integration
- **Simulation**: Verilator-compatible output

## Coding Guidelines

1. All parameters must be configurable — no hardcoded constants
2. Synchronous reset, active-high unless noted
3. Clock domain crossings must be documented and verified
4. All modules must have a testbench in `verification/`
