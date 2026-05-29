# Step 08: Logic Synthesis with Memory Macro

This directory contains the logic synthesis flow incorporating the OpenRAM memory macros for the **SMVDU-TITAN-X SoC** design.

## 🎯 Step Description
In structural ASIC design, physical memory macros (like SRAMs) are treated as **hard blackboxes**. During synthesis:
1. **Blackbox Elaboration**: Yosys reads the behavioral interface of the memory macro (`sram_32x64_180nm.v`) as a read-only library block (`read_verilog -lib`).
2. **Logic Mapping**: Standard cells and logic blocks (the L2 Cache controller, CPU core, PLIC, PCIe, etc.) are fully synthesized and mapped to standard cells (`AND`, `OR`, `DFFSR`) of the OSU018 180nm CMOS PDK.
3. **Macro Boundary Retention**: The synthesis compiler preserves the exact port directions and boundaries of the `sram_32x64_180nm` memory macros without attempts to split them into random gate registers, ensuring that their GDSII physical layouts can be integrated cleanly in the floorplanning step.

---

## 📋 Inputs and Outputs Checklist

### Input Files (`Input_Files/`)
* **`titan_x_dft_netlist.v`**: Gate-level netlist containing synthesizable logic gates and structured blackbox instantiations of `sram_32x64_180nm`.
* **`synth_macro.tcl`**: Yosys synthesis configuration command script.

### Output Files (`Output_Files/`)
* **`titan_x_macro_synth_netlist.v`**: The completed structural Verilog netlist incorporating both the mapped logic standard gates and the intact SRAM macro blackbox blocks, ready for layout.
* **`synth_top.log`**: Standard output log of the elaboration stitching run.

---

## 🚀 Execution Command
```bash
yosys -s titan_x_soc/08_Synthesis_with_Macro/synth_macro.tcl > titan_x_soc/08_Synthesis_with_Macro/synth_macro.log 2>&1
```

---

## 📈 Key Results & Metrics
* **Synthesis Status**: **SUCCESSFUL** (Exit Code 0).
* **Hard Blackbox Macro Mapping**: Successfully retained `sram_32x64_180nm` instances `u_sram_bank0` and `u_sram_bank1` as hard blocks, with all 160+ signal pins mapped correctly to their functional standard-cell driver nets.