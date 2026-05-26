# Phase 1: Single-Core Bring-Up

## Objective

Boot bare-metal firmware on a single Rocket RV64GC core, validate UART output, GPIO, and SPI, and establish a working Verilator simulation flow.

**Success Criteria:**  
✅ Firmware boots and prints banner over UART  
✅ LED heartbeat visible on FPGA  
✅ Verilator simulation runs without RTL errors  
✅ Phase 1 firmware builds cleanly with RISC-V GCC

---

## Hardware Configuration

| Parameter | Value |
|-----------|-------|
| CPU | Rocket Core, RV64GC |
| Cores | 1 |
| Clock | 100 MHz (FPGA) |
| L1 I-Cache | 32 KB, 4-way |
| L1 D-Cache | 32 KB, 4-way |
| L2 Cache | None (Phase 1) |
| Memory | 64 MB BRAM/SRAM (no DDR) |
| Boot ROM | 60 KB at `0x0000_1000` |

---

## Memory Map (Phase 1)

| Region | Address | Size |
|--------|---------|------|
| Boot ROM | `0x0000_1000` | 60 KB |
| SRAM/BRAM | `0x0800_0000` | 64 MB |
| CLINT | `0x0200_0000` | 768 KB |
| PLIC | `0x0C00_0000` | 64 MB |
| UART 0 | `0x5400_0000` | 4 KB |
| GPIO | `0x5401_0000` | 4 KB |
| SPI 0 | `0x5402_0000` | 4 KB |
| Timer | `0x5404_0000` | 4 KB |

---

## Boot Sequence (Phase 1)

```
Power-On Reset
     │
     ▼
Boot ROM (0x0000_1000)
  └── Simple bootloader
     │
     ▼
SRAM Firmware (0x0800_0000)
  └── hello_uart/main.S
       ├── Initialize UART
       ├── Print boot banner
       └── LED heartbeat loop
```

---

## Firmware

The Phase 1 firmware is in [`software/firmware/hello_uart/`](../../../software/firmware/hello_uart/).

### Build

```bash
# Install toolchain first
bash scripts/setup/setup_riscv_toolchain.sh
source ~/.bashrc

# Build
cd software/firmware/hello_uart
make

# Output files
build/hello_uart.elf   # ELF binary
build/hello_uart.hex   # Intel HEX (for simulation memory loading)
build/hello_uart.bin   # Raw binary (for FPGA BRAM)
```

### Disassembly

```bash
make disasm
# View: build/hello_uart.dis
```

---

## Simulation

### Quick Simulation (RTL stub)

```bash
bash scripts/sim/run_verilator.sh
```

### With Chipyard (Full)

```bash
conda activate chipyard
cd hardware/chipyard/sims/verilator
make CONFIG=smvdu.titan.x.TitanXSimConfig
./simulator-smvdu.titan.x.TitanXSimConfig \
    +max-cycles=10000000 \
    +loadmem=../../../../software/firmware/hello_uart/build/hello_uart.hex
```

### Expected Output

```
  ╔═══════════════════════════════════════╗
  ║        SMVDU-TITAN-X  v0.1.0          ║
  ║   RISC-V RV64GC Open-Source SoC       ║
  ╚═══════════════════════════════════════╝

  [PHASE 1] Bare-Metal Bring-Up
  Core:  Rocket RV64GC (Single Core)
  Clock: 100 MHz
  UART0 initialized at 115200 baud
  LED heartbeat active

  SMVDU-TITAN-X ready!
```

---

## Verification Checklist

- [ ] `make` in `software/firmware/hello_uart/` succeeds
- [ ] `make disasm` produces correct RV64GC assembly
- [ ] Verilator lint passes on `hardware/rtl/top/titan_x_top.v`
- [ ] Verilator simulation runs with firmware HEX
- [ ] UART output matches expected boot banner
- [ ] GPIO LED heartbeat visible in simulation waveform

---

## Tools Reference

| Tool | Command |
|------|---------|
| Build firmware | `make -C software/firmware/hello_uart/` |
| Disassemble | `make -C software/firmware/hello_uart/ disasm` |
| Simulate | `bash scripts/sim/run_verilator.sh` |
| Lint RTL | `bash scripts/sim/run_verilator.sh --lint-only` |
| Spike sim | `spike --isa=rv64gc software/firmware/hello_uart/build/hello_uart.elf` |

---

## References

- [RISC-V Privileged ISA Spec v1.12](https://github.com/riscv/riscv-isa-manual)
- [Chipyard Documentation](https://chipyard.readthedocs.io/)
- [SiFive UART Spec](https://static.dev.sifive.com/FU540-C000-v1.0.pdf)
- [Rocket Core](https://github.com/chipsalliance/rocket-chip)
