# SMVDU-TITAN-X — Final Integration Phase: Structure

This document details the layout of the **FINAL INTEGRATION PHASE** sandbox workspace directory inside the main repository.

---

## Directory Layout

```text
phases/final-integration/
├── README.md                   # Technical showcase overview
├── STRUCTURE.md                # This folder explanation file
├── RESULTS.md                  # Simulation runs & check-mark dashboard
│
├── docs/
│   └── titan_x_final_architecture.png # Premium microarchitecture block diagram
│
├── config/
│   └── TitanXFinalConfig.scala # Chipyard Scala system recipe (5 Cores SMP)
│
├── rtl/
│   └── top/
│       └── titan_x_final_top.v # Synthesizable top-level wrapper SoC
│
├── firmware/
│   └── README.md               # MMIO Address allocation & 186 PLIC Interrupt Map
│
└── verification/
    └── testbench/
        └── tb_titan_x_final.sv # SystemVerilog exhaustive stimulus testbench
```
