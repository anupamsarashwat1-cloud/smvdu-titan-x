# SMVDU-TITAN-X Memory Map

## Revision History

| Rev | Date | Author | Description |
|-----|------|--------|-------------|
| 0.1 | 2025-05-26 | Project Team | Initial Phase 1 memory map |
| 0.2 | 2026-05-26 | SMVDU-TITAN-X | Updated with validated Chipyard Phase 1 addresses |

---

## Overview

The SMVDU-TITAN-X memory map is divided into three main regions:

1. **Low Memory** (`0x0000_0000` – `0x3FFF_FFFF`) — ROM, debug, CLINT, PLIC
2. **On-Chip SRAM** (`0x0800_0000` – `0x0BFF_FFFF`) — Fast scratchpad / BRAM
3. **Peripheral Space** (`0x5400_0000` – `0x57FF_FFFF`) — MMIO peripherals
4. **DDR Main Memory** (`0x8000_0000` – `0xFFFF_FFFF`) — External DRAM

---

## Phase 1 Memory Map

### System Regions

| Region | Base Address | End Address | Size | Description |
|--------|-------------|-------------|------|-------------|
| **Debug ROM** | `0x0000_0000` | `0x0000_0FFF` | 4 KB | RISC-V debug module ROM |
| **Boot ROM** | `0x0000_1000` | `0x0000_FFFF` | 60 KB | Masked ROM (OpenSBI entry) |
| **CLINT** | `0x0200_0000` | `0x020B_FFFF` | 768 KB | Core-Local Interrupt Controller |
| **On-Chip SRAM** | `0x0800_0000` | `0x0BFF_FFFF` | 64 MB | BRAM/SRAM scratchpad |
| **PLIC** | `0x0C00_0000` | `0x0FFF_FFFF` | 64 MB | Platform-Level Interrupt Controller |

### Peripheral MMIO Regions

> **Phase 1 Note:** Chipyard uses SiFive UART (not 16550). Address `0x1002_0000`
> validated in simulation. Future phases will add peripherals at `0x5400_0000`.

| Peripheral | Base Address | End Address | Size | IRQ | Status | Description |
|------------|-------------|-------------|------|-----|--------|-------------|
| **UART 0** | `0x1002_0000` | `0x1002_0FFF` | 4 KB | 1 | ✅ **Phase 1 Validated** | SiFive UART (Chipyard default) |
| **CLINT** | `0x0200_0000` | `0x020B_FFFF` | 768 KB | — | ✅ **Phase 1 Validated** | mtime/mtimecmp |
| **PLIC** | `0x0C00_0000` | `0x0FFF_FFFF` | 64 MB | — | Phase 2 | Platform interrupt controller |
| **GPIO** | `0x5401_0000` | `0x5401_0FFF` | 4 KB | 3 | Phase 2 | 32-bit GPIO controller |
| **SPI 0** | `0x5402_0000` | `0x5402_0FFF` | 4 KB | 4 | Phase 2 | SPI master (SD card/flash) |
| **SPI 1** | `0x5402_1000` | `0x5402_1FFF` | 4 KB | 5 | Phase 3 | SPI master (reserved) |
| **I2C 0** | `0x5403_0000` | `0x5403_0FFF` | 4 KB | 6 | Phase 3 | I2C master |
| **Timer 0** | `0x5404_0000` | `0x5404_0FFF` | 4 KB | — | Phase 2 | 64-bit CLINT-mapped timer |
| **PWM** | `0x5405_0000` | `0x5405_0FFF` | 4 KB | 7 | Phase 3 | PWM controller |

### Phase 4+ Peripheral Extensions (Reserved)

| Peripheral | Base Address | Size | Description |
|------------|-------------|------|-------------|
| **Ethernet MAC** | `0x5500_0000` | 64 KB | GbE MAC (Phase 4) |
| **USB** | `0x5600_0000` | 64 KB | USB 2.0 controller (Phase 4) |
| **PCIe Config** | `0x5700_0000` | 4 MB | PCIe configuration space (Phase 4) |
| **HDMI/MIPI** | `0x5800_0000` | 256 KB | Display subsystem (Phase 4) |

### Accelerator Regions (Phase 5, Reserved)

| Accelerator | Base Address | Size | Description |
|-------------|-------------|------|-------------|
| **AI Engine** | `0x6000_0000` | 64 MB | Systolic array + weight memory |
| **DSP Engine** | `0x6400_0000` | 16 MB | DSP accelerator MMIO |
| **Crypto Engine** | `0x6500_0000` | 4 MB | AES/SHA/ECDSA/TRNG |
| **Video DMA** | `0x6600_0000` | 4 MB | Video frame buffer DMA |

### Main Memory (DDR)

| Region | Base Address | End Address | Size | Description |
|--------|-------------|-------------|------|-------------|
| **DDR Main** | `0x8000_0000` | `0xFFFF_FFFF` | 2 GB | External DDR4/LPDDR4 |

---

## Memory Map (Verilog Parameters)

See [`titan_x_top.v`](../titan_x_top.v) for Verilog parameter definitions.

See [`platform.h`](../../../software/opensbi/platform/smvdu_titan_x/platform.h) for OpenSBI platform definitions.

---

## Boot Sequence Address Flow

### Phase 1 (Simulation — Validated ✅)
```
Verilator loads ELF directly into DRAM
     │
     ▼
0x8000_0000  ← _start (hello_uart.elf / exit_test.elf)
     │        Rocket core fetches first instruction
     ▼
0x1002_0000  ← SiFive UART init (BAUD_DIV, TXCTRL, RXCTRL)
     │
     ▼
0x8000_xxxx  ← uart_puts (print boot banner)
     │
     ▼
0x8000_1000  ← tohost = 1 (HTIF exit → $finish)
```

### Phase 3+ (FPGA with Boot ROM)
```
Power-On Reset
     │
     ▼
0x0000_1000  ← Boot ROM (OpenSBI / first-stage)
     │
     ▼
0x8020_0000  ← OpenSBI runtime in DDR
     │
     ▼
0x8020_0000+ ← U-Boot → Linux kernel
```

---

## RISC-V Platform Compliance

- **CLINT** at `0x0200_0000` — compatible with `mtime`/`mtimecmp` (RISC-V Privileged ISA Spec)
- **PLIC** at `0x0C00_0000` — compatible with SiFive PLIC v1.0 / OpenSBI expectations  
- **UART** at `0x1002_0000` — SiFive UART (Phase 1, Chipyard default); 16550-compatible UART planned at `0x5400_0000` for Phase 2
- **HTIF tohost** at `0x8000_1000` — simulation exit mechanism (Verilator/Spike)

---

## Notes

- All addresses are 32-bit physical addresses (PA[31:0])
- 64-bit virtual addresses are managed by the MMU
- FPGA BRAM is mapped to the SRAM region for Phase 1
- DDR is added in Phase 2 via LiteDRAM or vendor DDR IP
- IRQ numbers are PLIC-relative (1-indexed)
