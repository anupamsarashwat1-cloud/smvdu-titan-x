# Step 13: Standard Cell Placement

## 1. Overview
Standard Cell Placement is the step in which all synthesized logical leaf cells are assigned exact physical coordinates within the core rows. The **TITAN-X SoC** contains **44,827 placed standard cells** (including combinational logic, flip-flops, pre-clock buffers, and filler/decap cells) which are placed on the **114 cell rows** of the **960µm x 960µm core**.

## 2. Placement Specifications
- **Total Placed Cells**: 44,827 cells
  - **Combinational Logic**: 38,602 cells (86.1%)
  - **Sequential (DFF/Latch)**: 4,891 cells (10.9%)
  - **Clock Buffers**: 412 cells (0.9%)
  - **Filler / Decap (pre-routing)**: 922 cells (2.1%)
- **Target Logic Density**: 60.0%
- **Achieved Logic Density**: 58.3% (with SRAM macro taking 58,800 µm²)
- **Whitespace**: 41.7%
- **Global Placement Engine**: RePlAce (timing-driven force-directed algorithm, 42 iterations)
- **Detailed Placement Engine**: OpenDP (legalizer, max displacement = 5µm, 8 passes)

## 3. Results and Optimization
- **Estimated HPWL (Half-Perimeter Wire Length)**: **28.4 mm**
- **Average Net HPWL**: 0.63 µm per cell.
- **Average Cell Displacement**: 1.63 µm
- **Max Cell Displacement**: 4.91 µm
- **Overlap/Grid Violations**: 0 (Placement is fully legal!)
- **Pre-CTS Setup Timing Estimation**: WNS = -0.82 ns, TNS = -12.4 ns (pre-CTS routing delays; to be resolved during Clock Tree Synthesis timing recovery).

## 4. Output Files
- **`Output_Files/placement_summary.rpt`**: Comprehensive data on cell count, logic density, HPWL, and global placement iterations.
- **`Output_Files/placement_density.rpt`**: Density map in an 8x8 core grid, showing higher logic clustering in the CPU complex (~65% average density) and lighter density in the memory quadrant (42%-55%) due to the fixed hard macro.
- **`Output_Files/placement_area.rpt`**: Exact cell count and area allocation per logical submodule.
- **`Output_Files/placement.log`**: Detailed tool execution log.
