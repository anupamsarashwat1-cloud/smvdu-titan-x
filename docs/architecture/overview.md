# Architecture Overview

## Introduction

SMVDU-TITAN-X is designed around a **three-tier architecture**:

1. **CPU Cluster** — RISC-V cores with per-core L1 caches
2. **Shared Subsystem** — L2 cache, DDR controller, interrupt controllers
3. **Peripheral & Accelerator Ring** — MMIO-mapped devices and custom IP

The interconnect fabric is **TileLink** throughout the coherent zone, with AXI4/APB bridges at the peripheral boundary.

---

## Block Diagram

```
┌───────────────────────────────────────────────────────────────────┐
│                         SMVDU-TITAN-X SoC                         │
│                                                                   │
│  ┌────────────────────────────────────────────────────────────┐  │
│  │                      CPU Cluster                            │  │
│  │  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌────────┐  │  │
│  │  │  Core 0   │  │  Core 1   │  │  Core 2   │  │ Core 3 │  │  │
│  │  │ RV64GC    │  │ RV64GC    │  │ RV64GC    │  │ RV64GC │  │  │
│  │  │ L1-I 32KB │  │ L1-I 32KB │  │ L1-I 32KB │  │L1-I 32K│  │  │
│  │  │ L1-D 32KB │  │ L1-D 32KB │  │ L1-D 32KB │  │L1-D 32K│  │  │
│  │  └─────┬─────┘  └─────┬─────┘  └─────┬─────┘  └────┬───┘  │  │
│  │        └──────────────┴──────────────┴──────────────┘       │  │
│  └───────────────────────┬────────────────────────────────────┘  │
│                           │ TileLink L1-to-L2                     │
│  ┌────────────────────────▼───────────────────────────────────┐  │
│  │                  Shared L2 Cache (512 KB)                   │  │
│  │                   (InclusiveCache)                          │  │
│  └────────────────────────┬───────────────────────────────────┘  │
│                           │ TileLink L2-to-DRAM                   │
│  ┌────────────────────────▼───────────────────────────────────┐  │
│  │              System Bus (TileLink / AXI4)                   │  │
│  │  ┌──────────┐  ┌──────────┐  ┌─────────┐  ┌────────────┐  │  │
│  │  │   DDR    │  │  DMA 0   │  │  PLIC   │  │   CLINT    │  │  │
│  │  │CtrlInterface│  │ Engine   │  │(0x0C000)│  │ (0x02000) │  │  │
│  │  └──────────┘  └──────────┘  └─────────┘  └────────────┘  │  │
│  └────────────────────────┬───────────────────────────────────┘  │
│                           │ AXI4/APB Bridge                       │
│  ┌────────────────────────▼───────────────────────────────────┐  │
│  │                   Peripheral Bus                             │  │
│  │  UART│SPI│I2C│GPIO│Timer│Ethernet│PCIe│USB│HDMI/MIPI      │  │
│  └────────────────────────┬───────────────────────────────────┘  │
│                           │                                       │
│  ┌────────────────────────▼───────────────────────────────────┐  │
│  │                 Accelerator Subsystem                        │  │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │  │
│  │  │ AI Engine│  │DSP Engine│  │  Crypto  │  │  Video   │  │  │
│  │  │(Systolic)│  │          │  │AES/SHA/  │  │   DMA    │  │  │
│  │  │          │  │          │  │ECDSA/TRNG│  │          │  │  │
│  │  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │  │
│  └────────────────────────────────────────────────────────────┘  │
└───────────────────────────────────────────────────────────────────┘
```

---

## Design Principles

### 1. Reuse, Don't Reinvent
- Use **Rocket Core** (proven Linux-capable RISC-V) from Chipyard
- Use **TileLink** from Rocket-Chip (proven coherent interconnect)
- Use **OpenSBI** for M-mode runtime (RISC-V SBI standard)
- Focus engineering on **integration, accelerators, and optimization**

### 2. FPGA-First Development
- All RTL must synthesize and function on FPGA before ASIC exploration
- LiteX provides rapid iteration; Chipyard provides production quality
- Constraint files and timing reports are CI artifacts

### 3. Modular Accelerator Architecture
- Accelerators connect via **TileLink slave ports** on the system bus
- Each accelerator has a **defined MMIO region** in the memory map
- Software drivers follow Linux kernel DMA/interrupt frameworks

### 4. Linux Compatibility
- Boot sequence follows RISC-V Privileged ISA Spec
- CLINT and PLIC addresses match OpenSBI/Linux expectations
- Device tree (DTS) describes all hardware to Linux

---

## CPU Core Options

### Phase 1–2: Rocket Core (Default)
- **In-order**, 5-stage pipeline
- RV64IMAFDC (full `gc` profile)
- Proven Linux-compatible
- Fastest Chipyard simulation

### Phase 3+: BOOM (Optional)
- **Out-of-order** 2–4 wide superscalar
- Higher IPC for workloads
- Larger FPGA footprint

### Alternative: CVA6 (Ariane)
- Application-class OoO core
- Good for Vivado-native FPGA flows
- PULP Platform ecosystem

---

## Interconnect

See [Interconnect](interconnect.md) for TileLink protocol details.

## Memory Map

See [Memory Map](memory_map.md) for complete address space definition.

## Accelerators

See [Accelerators](accelerators.md) for AI/DSP/Crypto subsystem design.
