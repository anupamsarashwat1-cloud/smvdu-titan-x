# SMVDU-TITAN-X — Phase 4: Repository Structure

This file provides an explanation of the layout and planned modules within the Phase 4 standalone repository.

---

## Directory Layout

```
smvdu-titan-x-phase4/
├── README.md                   # Submodule overview
├── RESULTS.md                  # High-speed I/O loopback logs
├── STRUCTURE.md                # This file
│
├── docs/
│   ├── block_diagram.md        # Mermaid design diagrams
│   └── design_spec.md          # Architectural specifications
│
├── config/
│   └── TitanXPhase4Config.scala # Phase 4 Dual-Core Chipyard config
│
└── verification/
    └── testbench/
        └── tb_titan_x_phase4.sv # SystemVerilog testbench for PCIe/USB
```
