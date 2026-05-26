# SMVDU-TITAN-X — Phase 1: Repository Structure

This file provides an explanation of the layout and files within the Phase 1 standalone repository.

---

## Directory Layout

```
smvdu-titan-x-phase1/
├── README.md                   # Phase overview & Quick start
├── RESULTS.md                  # Simulation & compliance test reports
├── STRUCTURE.md                # This file
│
├── docs/
│   ├── block_diagram.md        # Architectural block diagrams (Mermaid)
│   ├── memory_map.md           # Physical address mapping
│   ├── design_spec.md          # Parameters, configuration, and interfaces
│   └── changelog.md            # History of changes in Phase 1
│
├── config/
│   └── TitanXPhase1Config.scala # Chipyard SoC config mapping Rocket Core
│
├── rtl/
│   ├── core/                   # CPU core specific RTL references (Chipyard)
│   ├── peripherals/            # Peripheral device models
│   ├── top/
│   │   └── titan_x_top.v       # Top-level SoC integration stub
│   └── README.md               # Interface ports and signal descriptions
│
├── firmware/
│   ├── hello_uart/             # Hello World assembly boot firmware
│   │   ├── main.S              # Source code
│   │   ├── linker.ld           # Direct memory linking
│   │   └── Makefile            # Firmware compilation script
│   ├── exit_test/              # Quick smoke-test firmware (tohost-only)
│   │   ├── main.S
│   │   ├── linker.ld
│   │   └── Makefile
│   └── README.md               # Bare-metal firmware design overview
│
├── verification/
│   ├── testbench/
│   │   ├── tb_titan_x_phase1.sv # SystemVerilog testbench top
│   │   └── README.md
│   ├── cocotb/                 # Cocotb test stubs (for peripheral testing)
│   ├── isa_tests/
│   │   └── results/            # ISA compliance test execution results
│   └── formal/                 # Placeholder for future formal tools
│
├── synthesis/
│   ├── constraints/            # Synthesis pin constraints (FPGA)
│   │   ├── artix7.xdc
│   │   └── kintex7.xdc
│   ├── reports/                # Post-synthesis stubs
│   │   ├── timing_summary.rpt
│   │   ├── utilization.rpt
│   │   └── power_summary.rpt
│   └── bitstream/              # Gitignored build directory for programming files
│
└── scripts/
    ├── build_sim.sh            # Compiles the Verilator simulation model
    ├── run_sim.sh              # Runs hello_uart or exit_test in simulator
    └── run_tests.sh            # Auto-runner for the entire ISA suite
```

---

## File Details

### Configuration (`config/`)
*   `TitanXPhase1Config.scala`: The Scala generator recipe. Defines a single-core RV64GC Rocket Core operating with custom peripherals and a TileLink system bus.

### RTL (`rtl/`)
*   `rtl/top/titan_x_top.v`: Defines the top-level ports and clock trees. Serves as the golden verification boundary.

### Firmware (`firmware/`)
*   `firmware/hello_uart/`: Prints the boot banner character-by-character to verify the transmit FIFO queue.
*   `firmware/exit_test/`: A minimal smoke test designed to exit simulator environments in a few milliseconds.

### Scripts (`scripts/`)
*   `scripts/build_sim.sh`: Configures environment flags and compiles the C++ Verilator target in multicore modes (`-j$(nproc)`).
*   `scripts/run_sim.sh`: A shell driver wrapper to load binary formats and record log output into output files.
*   `scripts/run_tests.sh`: An automated test scheduler running test vectors and outputting a summary box.
