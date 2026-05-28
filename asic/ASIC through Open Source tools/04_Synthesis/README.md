# Step 04: Hierarchical Bottom-Up Synthesis

This directory contains the hierarchical bottom-up synthesis flow for the **SMVDU-TITAN-X SoC** using standard CMOS 180nm technology (osu018 PDK).

## 🎯 Step Description
The system is highly memory-constrained (host has **3.8 GB RAM**, no swap, and no root privileges). Attempting a flat synthesis of a complex system like TITAN-X (with 5 CPU cores, L2 cache controller, DDR controller, PCIe, Ethernet, and security complexes) in a single Yosys pass causes instant Out-Of-Memory (OOM) kernel termination.

To solve this, we designed and executed a **bottom-up hierarchical synthesis flow**:
1. **Leaf Submodules (Level 1)**: Leaf modules (e.g. `reset_sync`, `cdc_sync`, `fifo_sync`, `rv_fetch`, `rv_decode`, `clint`, `plic`, `l2_tag_array`, `aes_engine`, `sha256_engine`, etc.) are synthesized individually. Their optimized gate-level netlists are written to `submodules_synth/` as synthesized gate netlists.
2. **Mid-Level Blocks (Level 2 & 3)**: Components like `rv_core_top`, `l2_cache_top`, `ddr_ctrl_top`, and the multi-hart `cpu_complex_top` are synthesized by reading the raw RTL of their parameterized sub-components to correctly resolve compile-time overrides (`HART_ID`, `NUM_SETS`, etc.), using the synthesized submodules as library blackbox models where applicable.
3. **Top SoC Wrapper (Level 4)**: The top-level wrapper `titan_x_top` is elaborated and stitched together by loading all constituent submodules as gate-level blackbox libraries and synthesizing only the top-level interconnection wiring.

---

## 📋 Inputs and Outputs Checklist

### Input Files (`Input_Files/`)
* **`run_synthesis_hierarchical.py`**: The main Python orchestrator script that automatically generates Yosys compilation TCL scripts and executes Yosys for every leaf submodule and the top wrapper.
* **`synth.tcl`**: Base Yosys synthesis configuration recipe.
* **RTL Sources**: Consumed directly from the global golden folder: `titan_x_soc/01_RTL_Design/Input_Files/rtl/`.

### Output Files (`Output_Files/`)
* **`titan_x_synth_netlist.v`**: The final, fully stitched gate-level structural Verilog netlist of the entire TITAN-X SoC, mapped entirely to the `osu018_stdcells` standard cell library.
* **`synth_top.log`**: Detailed execution log of the top-level Yosys stitching run.

---

## 🚀 Execution & Command Reference
To run the hierarchical synthesis flow, the following orchestrator command was executed:
```bash
python3 titan_x_soc/04_Synthesis/run_synthesis_hierarchical.py
```

This runs Yosys bottom-up. Inside `run_synthesis_hierarchical.py`, the core top stitching Yosys script operates as follows:
```tcl
# Read SRAM macro as library stub
read_verilog -lib titan_x_soc/06_Macro_Generation_Openram/sram_32x64_180nm.v

# Read all pre-synthesized submodules as library/blackbox models
read_verilog -lib titan_x_soc/04_Synthesis/submodules_synth/cpu_complex_top_synth.v
read_verilog -lib titan_x_soc/04_Synthesis/submodules_synth/l2_cache_top_synth.v
...

# Read top-level wrapper source and parameterized child RTLs
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/titan_x_top.v

# Elaborate and synthesize top wrapper
hierarchy -top titan_x_top
synth -top titan_x_top

# Map to SCL 180nm standard cells library
dfflibmap -liberty /home/anupam-sarashwat/vsdflow/library/osu018_stdcells.lib
abc -liberty /home/anupam-sarashwat/vsdflow/library/osu018_stdcells.lib
clean

# Write stitched gate-level netlist
write_verilog -noattr titan_x_soc/04_Synthesis/titan_x_synth_netlist.v
```

---

## 📈 Key Results & Metrics
* **Top Stitching Status**: **SUCCESSFUL** (Exit Code 0).
* **Netlist File Size**: Approximately **2.2 MB** (Stitched structural netlist).
* **Gate Mapping**: Successfully mapped to DFFs and combinational logic cells of the SCL 180nm PDK.
* **Resolved Issues**: Fixed the multiple-driver `s7_bready_x` synthesis error by commenting out the duplicate `assign s7_bready_x = 1'b1` in the top wrapper `titan_x_top.v`, letting it be driven cleanly by `u_xbar.s7_bready`.

---

## 🔍 Verification & Visual Inspection
Visual representation is not directly applicable for synthesis text-based outputs, but timing-accurate simulation verification will be carried out in **Step 05 (Gate-Level Simulation)** using the gate netlist generated here.
