# SMVDU-TITAN-X — Phase 3: Repository Structure

This file provides an explanation of the layout and planned modules within the Phase 3 standalone repository.

---

## Directory Layout

```
smvdu-titan-x-phase3/
├── README.md                   # Submodule overview
├── RESULTS.md                  # Linux boot logs & validation
├── STRUCTURE.md                # This file
│
├── docs/
│   ├── block_diagram.md        # Mermaid design diagrams
│   └── memory_map.md           # Address maps (Ethernet + DDR)
│
├── config/
│   └── TitanXPhase3Config.scala # Phase 3 Quad-Core Chipyard config
│
└── verification/
    └── testbench/
        └── tb_titan_x_phase3.sv # SystemVerilog testbench for DDR/Ethernet
```
