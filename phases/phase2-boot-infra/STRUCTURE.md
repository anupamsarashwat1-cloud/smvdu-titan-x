# SMVDU-TITAN-X — Phase 2: Repository Structure

This file provides an explanation of the layout and planned modules within the Phase 2 standalone repository.

---

## Directory Layout

```
smvdu-titan-x-phase2/
├── README.md                   # Submodule overview
├── RESULTS.md                  # Verification reports & test plans
├── STRUCTURE.md                # This file
│
├── docs/
│   ├── block_diagram.md        # Mermaid design diagrams
│   ├── memory_map.md           # Address maps (OpenSBI + SPI)
│   └── design_spec.md          # Architectural specifications
│
├── config/
│   └── TitanXPhase2Config.scala # Phase 2 Chipyard configuration
│
├── rtl/
│   ├── peripherals/
│   │   └── titan_x_gpio.v      # GPIO MMIO peripheral logic
│   └── top/
│       └── titan_x_top.v       # Top-level module with GPIO ports
│
├── firmware/
│   └── bootrom/
│       ├── main.S              # Early ROM boots to DRAM
│       └── Makefile
│
└── verification/
    └── testbench/
        └── tb_titan_x_phase2.sv # SystemVerilog testbench for GPIO/SPI
```
