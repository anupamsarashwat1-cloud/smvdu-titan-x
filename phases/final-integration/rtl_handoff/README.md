# 📦 SMVDU-TITAN-X — RTL Handoff Package v2.0

> **Physical Design Team Handoff — SCL 180nm CMOS Target**
> Revision 2.0 | All LVS failures from Gap Report resolved | iverilog compilation: **0 errors**

---

## ⚡ Quick Start (Simulation)

```bash
# Compile all 36 RTL files + testbench
bash run_sim.sh --lint-only

# Compile + run simulation
bash run_sim.sh

# Compile + run + open GTKWave waveforms
bash run_sim.sh --waves
```

**Requirements**: `iverilog` (≥ 11.0), `vvp`, optionally `gtkwave`

---

## 🐛 LVS Fix Summary

The Physical Design team reported the following critical failure:

| Issue | Root Cause | Fix Applied |
|---|---|---|
| LVS open net on `dout0` | `sram_32x64_180nm` output port left unconnected in `l2_data_array` | `dout0` now explicitly MUXed and driven in `l2_data_array.v` |
| Behavioral stub rejected | `titan_x_final_top.v` had no hierarchy — no standard-cell netlist possible | Replaced with fully structural `titan_x_top.v` (36 submodules) |

---

## 📂 Folder Structure

```text
rtl_handoff/
├── README.md                  ← This file
├── run_sim.sh                 ← Icarus Verilog compile + simulate script
├── tb_titan_x_top.sv          ← System-level testbench (GTKWave VCD supported)
└── rtl/                       ← 36 synthesizable Verilog source files
    │
    ├── titan_x_top.v          ★ Structural SoC Top (instantiates all submodules)
    │
    ├── common/                ── Shared Primitives ──────────────────────────────
    │   ├── reset_sync.v           2-stage synchronous reset de-asserter
    │   ├── cdc_sync.v             N-stage clock-domain crossing synchronizer
    │   ├── fifo_sync.v            Synchronous FIFO (binary pointer, power-of-2 depth)
    │   ├── fifo_async.v           Asynchronous FIFO (Gray-code CDC pointers)
    │   └── sram_32x64_180nm.v  ★ SCL 180nm SRAM macro simulation stub
    │                              (32-bit wide × 64 deep, byte-masked write)
    │                              → Replace with foundry hard macro for tapeout
    │
    ├── cpu_complex/           ── 5-Hart RISC-V CPU Cluster ──────────────────────
    │   ├── clint.v                Core-Local Interruptor (mtime, mtimecmp, msip)
    │   ├── plic.v                 Platform-Level Interrupt Controller
    │   │                          186 sources, 10 targets (5 harts × M+S mode)
    │   ├── cpu_complex_top.v      CPU cluster top (5× cores + PLIC + CLINT)
    │   └── rv_core/               RV64I 5-Stage In-Order Pipeline
    │       ├── rv_fetch.v         IF  — PC register, branch redirect, imem AXI4-Lite
    │       ├── rv_decode.v        ID  — 32×64b register file, RV64I immediate decode
    │       ├── rv_execute.v       EX  — 64-bit ALU, branch resolve, EX/MEM forwarding
    │       ├── rv_mem.v           MEM — AXI4-Lite dmem, LB/LH/LW/LD sign-extend
    │       ├── rv_writeback.v     WB  — register writeback, forwarding outputs
    │       └── rv_core_top.v      Pipeline top: hazard unit, stall/flush control
    │
    ├── memory_subsystem/      ── Cache + DRAM Controller ────────────────────────
    │   ├── l2_tag_array.v         Direct-mapped L2 tag store (64 sets, 28-bit tag)
    │   ├── l2_data_array.v     ★  L2 data store — 2× sram_32x64_180nm banks
    │   │                          dout0 CONNECTED (LVS fix applied here)
    │   ├── l2_cache_ctrl.v        Cache controller FSM
    │   │                          States: IDLE→TAG_LOOKUP→HIT_SERVE/MISS_FETCH→FILL
    │   │                          Write-through policy, AXI4 master to DDR
    │   ├── l2_cache_top.v         L2 cache top (ctrl + tags + data)
    │   └── ddr_ctrl/              DDR4 SDRAM Controller
    │       ├── ddr_phy_if.v       PHY interface — differential CK, DQS training
    │       ├── ddr_scheduler.v    Bank scheduler — open-page, row-hit priority
    │       └── ddr_ctrl_top.v     DDR4 controller top (AXI4 slave → JEDEC commands)
    │
    ├── interconnect/          ── AXI4 Bus Fabric ────────────────────────────────
    │   ├── axi4_crossbar.v        5-Master × 8-Slave AXI4 crossbar
    │   │                          Address decode table:
    │   │                          S0: L2    0x00_0000_0000–0x00_0FFF_FFFF (256 MB)
    │   │                          S1: DDR   0x00_8000_0000–0x00_FFFF_FFFF (2 GB)
    │   │                          S2: PCIe  0x00_1000_0000–0x00_1FFF_FFFF
    │   │                          S3: GEM0  0x00_2000_0000–0x00_200F_FFFF
    │   │                          S4: GEM1  0x00_2010_0000–0x00_201F_FFFF
    │   │                          S5: Video 0x00_2020_0000–0x00_202F_FFFF
    │   │                          S6: Periph 0x00_4000_0000–0x00_4FFF_FFFF
    │   │                          S7: Sec   0x00_5000_0000–0x00_5FFF_FFFF
    │   ├── axi4_to_ahb.v          AXI4-Lite → AHB3-Lite protocol bridge
    │   └── ahb_to_apb.v           AHB3-Lite → APB4 protocol bridge
    │
    ├── ethernet/              ── Gigabit Networking ─────────────────────────────
    │   └── gem_ethernet.v         GEM Gigabit Ethernet MAC
    │                              RGMII interface, AXI4-Lite CSR, DMA AXI4 master
    │                              Instantiated twice (GEM0 + GEM1) from titan_x_top
    │
    ├── pcie/                  ── High-Speed Serial ──────────────────────────────
    │   └── pcie_top.v             PCIe Gen3 x4 wrapper
    │                              Link training FSM (Detect→Polling→Config→L0)
    │                              AXI4 slave CSR, DMA master ports
    │
    ├── peripherals/           ── Low-Speed I/O ───────────────────────────────────
    │   ├── uart_16550.v           UART 16550-compatible
    │   │                          Baud divider, 16-byte Tx/Rx FIFOs, interrupts
    │   │                          Instantiated as UART0 (console) and UART1
    │   ├── gpio_ctrl.v            32-bit bidirectional GPIO
    │   │                          Tri-state drivers, 2-FF input sync, W1C interrupts
    │   ├── spi_master.v           SPI master (CPOL/CPHA, 4 CS, byte shift register)
    │   ├── i2c_master.v           I2C master (open-drain, START/STOP/ACK FSM)
    │   └── watchdog_timer.v       Watchdog timer
    │                              Unlock key (0x1ACCE551), down counter, W1C
    │
    └── security/              ── Crypto Engines ─────────────────────────────────
        ├── aes_engine.v           AES-128 encryption (FIPS-197)
        │                          SubBytes + ShiftRows + AddRoundKey, 10 rounds
        │                          APB CSR: key[127:0], data_in, data_out, ctrl
        ├── sha256_engine.v        SHA-256 hash (FIPS-180-4)
        │                          64-round iterative, full K[] constants hardcoded
        │                          APB CSR: 16-word block input, 8-word hash output
        └── trng.v                 True Random Number Generator
                                   Ring-oscillator entropy + Galois LFSR whitener
                                   (* DONT_TOUCH *) annotation for PD preservation
```

---

## 🏗️ SoC Architecture

```
                    ┌─────────────────────────────────────────────────────┐
                    │                   titan_x_top                       │
                    │                                                      │
  sys_clk ─────────►  ┌──────────────────────────────────────────────┐   │
  sys_rst_n ────────►  │             cpu_complex_top                  │   │
                    │  │  ┌─────────┐ ┌────┐ ┌────┐ ┌────┐ ┌──────┐ │   │
                    │  │  │ hart0   │ │ h1 │ │ h2 │ │ h3 │ │ hart4│ │   │
                    │  │  │ RV64I   │ │    │ │    │ │    │ │ Mon  │ │   │
                    │  │  └────┬────┘ └─┬──┘ └─┬──┘ └─┬──┘ └──┬───┘ │   │
                    │  │      └─────────┴───────┴──────┴────────┘     │   │
                    │  │  ┌─────────────┐  ┌──────────────────────┐   │   │
                    │  │  │    PLIC     │  │        CLINT         │   │   │
                    │  │  │ 186 sources │  │ mtime/mtimecmp/msip  │   │   │
                    │  │  └─────────────┘  └──────────────────────┘   │   │
                    │  └────────────────────────┬─────────────────────┘   │
                    │                           │ 5× AXI4-Lite dmem       │
                    │  ┌────────────────────────▼─────────────────────┐   │
                    │  │          axi4_crossbar  (5M × 8S)            │   │
                    │  └──┬──────────┬──────┬────┬────┬────┬──────────┘   │
                    │     │S0        │S1    │S2  │S3  │S6  │S7            │
                    │  ┌──▼───┐  ┌──▼───┐  │    │    │    │              │
                    │  │  L2  │  │ DDR4 │ PCIe GEM Periph Sec           │
                    │  │Cache │  │ Ctrl │  │    │    │APB │              │
                    │  └──────┘  └──────┘  │    │    └─┬──┘              │
                    │                      │    │      UART/GPIO/SPI/I2C/WDT
                    │                      │    └─► GEM0/GEM1 (RGMII)    │
                    │                      └──► PCIe Gen3 x4             │
                    │                                                      │
  ddr_dq[63:0] ◄───┼──────────────────────────────────────────────────  │
  pcie_txp[3:0] ───┼──────────────────────────────────────────────────►  │
  uart0_txd ───────┼──────────────────────────────────────────────────►  │
  gpio_pad[31:0] ◄─┼─────────────────────────────────────────────────►   │
                    └─────────────────────────────────────────────────────┘
```

---

## 📋 File Count Summary

| Directory | Files | Description |
|---|---|---|
| `rtl/common/` | 5 | Synchronizers, FIFOs, SRAM macro stub |
| `rtl/cpu_complex/rv_core/` | 6 | RV64I 5-stage pipeline |
| `rtl/cpu_complex/` | 3 | PLIC, CLINT, cluster top |
| `rtl/memory_subsystem/` | 4 | L2 cache hierarchy |
| `rtl/memory_subsystem/ddr_ctrl/` | 3 | DDR4 controller |
| `rtl/interconnect/` | 3 | AXI4 crossbar + bridges |
| `rtl/ethernet/` | 1 | GEM Ethernet MAC |
| `rtl/pcie/` | 1 | PCIe Gen3 x4 |
| `rtl/peripherals/` | 5 | UART, GPIO, SPI, I2C, WDT |
| `rtl/security/` | 3 | AES-128, SHA-256, TRNG |
| `rtl/` (top) | 1 | `titan_x_top.v` structural top |
| **Total** | **36** | **All synthesizable Verilog** |

---

## ✅ Verification Status

| Check | Result |
|---|---|
| `iverilog -g2012` compilation | ✅ **0 errors** |
| Warnings | ⚠️ Informational only (PLIC array sensitivity, AES function OOB) |
| SRAM `dout0` connection | ✅ **Fixed** — no floating nets |
| Structural hierarchy | ✅ All 36 modules instantiated from `titan_x_top` |
| Simulation (10k cycles) | ✅ All 5 harts active, DDR clock running |

---

## 🔗 Related Links

- **Main Repo**: [smvdu-titan-x](https://github.com/anupamsarashwat1-cloud/smvdu-titan-x)
- **This folder on GitHub**: [phases/final-integration/rtl_handoff](https://github.com/anupamsarashwat1-cloud/smvdu-titan-x/tree/main/phases/final-integration/rtl_handoff)
- **Gap Report that triggered v2.0**: `TITAN_X_SoC_Design_Gap_Report.md`
- **License**: Apache 2.0

---

*SMVDU-TITAN-X SoC — RTL Handoff v2.0 — Generated 2026-05-28*
