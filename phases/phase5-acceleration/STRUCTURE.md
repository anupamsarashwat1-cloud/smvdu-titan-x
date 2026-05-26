# SMVDU-TITAN-X — Phase 5: Repository Structure

This file provides an explanation of the layout and planned modules within the Phase 5 standalone repository.

---

## Directory Layout

```
smvdu-titan-x-phase5/
├── README.md                   # Submodule overview
├── RESULTS.md                  # Co-processor throughput reports
├── STRUCTURE.md                # This file
│
├── docs/
│   ├── block_diagram.md        # Mermaid design diagrams
│   └── design_spec.md          # Architectural specifications
│
├── config/
│   └── TitanXPhase5Config.scala # Phase 5 RoCC Accel Chipyard config
│
└── verification/
    └── testbench/
        └── tb_titan_x_phase5.sv # SystemVerilog testbench for RoCC/HBM
```
