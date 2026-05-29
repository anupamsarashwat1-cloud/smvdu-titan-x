# Step 06: SRAM Macro Generation using OpenRAM

This step manages the compilation of the high-density physical SRAM macro **sram_32x64_180nm** using the OpenRAM memory compiler. 

To support byte-level memory operations in our L2 cache subsystem, we have successfully generated a custom single-port SRAM macro that integrates a **4-bit byte-write mask (`wmask0`)** on the standard SCMOS 180nm (`scn4m_subm`) technology node.

---

## 📋 File Organization Checklist

### 📥 Input Files (`Input_Files/`)
* **[sram_32x64_180nm.py](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Input_Files/sram_32x64_180nm.py)**: OpenRAM configuration python script specifying word size (32 bits), words (64), write size (8 bits for byte masking), and technology variables.

### 📤 Output Files (`Output_Files/`)
* **[sram_32x64_180nm.v](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Output_Files/sram_32x64_180nm.v)**: Synthesizable/simulation behavioral verilog model detailing memory read/write logic with byte masks.
* **[sram_32x64_180nm.lef](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Output_Files/sram_32x64_180nm.lef)**: Physical LEF file defining block geometry, boundaries, and pin layout for place & route.
* **[sram_32x64_180nm.gds](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Output_Files/sram_32x64_180nm.gds)**: Final layout GDSII stream file containing physical mask geometries.
* **[sram_32x64_180nm_TT_5p0V_25C.lib](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Output_Files/sram_32x64_180nm_TT_5p0V_25C.lib)**: Liberty (.lib) timing model defining cell delays and pin capacitance at the nominal corner.
* **[sram_32x64_180nm.sp](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Output_Files/sram_32x64_180nm.sp)**: SPICE structural netlist.
* **[sram_32x64_180nm.lvs.sp](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Output_Files/sram_32x64_180nm.lvs.sp)**: LVS-specific SPICE netlist.
* **[sram_32x64_180nm.log](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Output_Files/sram_32x64_180nm.log)**: Execution log of the compiler.
* **[sram_32x64_180nm.html](file:///home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/Output_Files/sram_32x64_180nm.html)**: Interactive HTML datasheet.

---

## 🛠️ Execution Command

The SRAM compilation was driven by sourcing the local conda-forge environment path and executing OpenRAM's generator shell:

```bash
# Setup environment variables
export OPENRAM_HOME="/home/anupam-sarashwat/OpenRAM/compiler"
export OPENRAM_TECH="/home/anupam-sarashwat/OpenRAM/technology"
export PYTHONPATH=$OPENRAM_HOME

# Run compilation
/home/anupam-sarashwat/OpenRAM/openram_env/bin/python3 \
    /home/anupam-sarashwat/OpenRAM/sram_compiler.py \
    Input_Files/sram_32x64_180nm.py
```

---

## 📊 Compilation Results and Pin Metrics

### 1. Architectural Details
* **Total Capacity**: 2048 bits (256 Bytes)
* **Words**: 64
* **Word Size**: 32 bits
* **Write Mask Size**: 8 bits (yielding a 4-bit write strobe)
* **Clock Ports**: Single active-high port (`clk0`)
* **Technology Corner**: TT / 5.0V / 25C (Analytical delay models)

### 2. Physical Pin Definitions (Verified in LEF & Verilog)
The following ports have been fully generated and verified:

| Pin Name | Direction | Bit Width | Function |
| :--- | :--- | :---: | :--- |
| `clk0` | Input | 1 | Clock signal |
| `csb0` | Input | 1 | Active-low chip select |
| `web0` | Input | 1 | Active-low write control (Read when high, Write when low) |
| `wmask0` | Input | 4 | Byte write-mask (active-high per-byte write enable) |
| `addr0` | Input | 6 | 6-bit address line (maps to 64 words) |
| `din0` | Input | 32 | 32-bit input data bus |
| `dout0` | Output | 32 | 32-bit output data bus |

---

## 🚀 Impact on Downstream Flow
By incorporating the 4-bit `wmask0` port, we have successfully resolved the port mismatch error that previously blocked hierarchical synthesis. The physical boundaries defined in the LEF file align perfectly with standard cell rows in the 180nm node, enabling clean LVS comparison and routing without dangling logical nets.