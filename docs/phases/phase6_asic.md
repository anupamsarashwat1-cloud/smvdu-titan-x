# Phase 6 — ASIC CAD Tool Synthesis and Physical Design Flow

The ultimate target for the high-level Chisel/Verilog digital designs of all five SMVDU-TITAN-X processor phases is physical semiconductor integration. 

---

## 1. Cadence ASIC Design Flow

To transition the synthesizable RTL modules (`titan_x_top.v`) into physical silicon layouts (GDSII format), we integrate industry-standard Cadence tools:

```
                  ┌───────────────────────────────┐
                  │   Synthesizable Verilog RTL   │
                  │        (titan_x_top.v)        │
                  └───────────────┬───────────────┘
                                  │
                                  ▼
                  ┌───────────────────────────────┐
                  │   Logical Synthesis (Genus)   │  ◄──  PDK .lib Models & SDC Constraints
                  │     Generates Gate netlist    │
                  └───────────────┬───────────────┘
                                  │
                                  ▼
                  ┌───────────────────────────────┐
                  │  Physical Synthesis (Innovus) │  ◄──  Physical LEF Models & CTS
                  │     Floorplan, PNR, GDSII     │
                  └───────────────┬───────────────┘
                                  │
                                  ▼
                  ┌───────────────────────────────┐
                  │ Functional Simulation(Xcelium)│  ◄──  Gate-Level Simulation (GLS)
                  │     with SDF back-annotation  │
                  └───────────────────────────────┘
```

---

## 2. ASIC Flow Directory Structure

All CAD-related automation scripts and constraint files are placed under the `asic/` directory:

```text
asic/
├── cadence/
│   ├── synthesis_genus.tcl     # Cadence Genus logical synthesis script
│   ├── physical_innovus.tcl    # Cadence Innovus place-and-route script
│   └── titan_x_constraints.sdc # Synopsys Design Constraints (SDC) timing file
├── outputs/
│   ├── titan_x_netlist.v       # Generated structural gate-level netlist
│   └── titan_x_layout.gds      # Physical stream tapeout-ready GDSII file
└── reports/
    ├── titan_x_timing.rpt      # Synthesis timing analysis reports
    ├── titan_x_area.rpt        # Cell area and utilization summaries
    └── titan_x_power.rpt       # Dynamic and leakage power dissipation reports
```

---

## 3. Logical Synthesis (Cadence Genus)

The Cadence Genus logical synthesis tool reads the hardware description files, elaborates modules, and maps abstract gates to physical foundry standard cells.

### Execution Command
To execute logical synthesis, launch Genus in the `asic/cadence/` directory:

```bash
genus -files synthesis_genus.tcl
```

---

## 4. Physical Design (Cadence Innovus)

The Cadence Innovus physical implementation tool imports the synthesized netlist and physical layout libraries (LEFs) to floorplan the core complex, route signals, and construct clock distribution trees.

### Execution Command
To launch physical place-and-route, run Innovus in the `asic/cadence/` directory:

```bash
innovus -files physical_innovus.tcl
```
