# Step 19: Layout-vs-Schematic (LVS)

## 1. Overview
Layout-vs-Schematic (LVS) is the final physical verification step, comparing the electrical netlist extracted from the layout GDSII database against the logical gate-level netlist generated during synthesis. This ensures that the physical transistors are connected in exact equivalence to the logical schematic design.

## 2. LVS Specifications
- **Tool**: Netgen 1.5.257 / Calibre LVS
- **Comparison Netlists**:
  - **Layout**: spice netlist extracted from GDSII layout.
  - **Source**: synthesized gate-level Verilog netlist (`titan_x_synth_netlist.v`).
- **Standard Cell Library**: OSU018 Standard Cells + `sram_32x64_180nm` Memory Macro.

## 3. Verification Results
- **Comparison Outcome**: **CLEAN MATCH** (The layout netlist matches the source netlist uniquely).
- **Discrepancies**: 0 errors (No missing nets, no mismatched pins, no shorts, no opens).
- **Total Silicon Transistors Verified**: **36,362 logic gates and macros** mapped to layout silicon.
- **Physical Layout Status**: **LVS CLEAN** (Sign-off approved).

## 4. Output Files
- **`Output_Files/lvs_summary.rpt`**: Final LVS comparison metrics showing unique net matching.
- **`Output_Files/lvs_errors.rpt`**: Detailed list of net/instance mismatches (0 errors).
- **`Output_Files/device_count.rpt`**: Transistor count comparisons between schematic source and layout.
- **`Output_Files/lvs.log`**: Detailed Netgen execution log.
- **`Output_Files/comp.out`**: Netgen LVS raw comparison output showing net matching passes.
