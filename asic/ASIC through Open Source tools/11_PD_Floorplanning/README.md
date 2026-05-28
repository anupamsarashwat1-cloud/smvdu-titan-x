# Step 11: Physical Floorplanning

## 1. Overview
Floorplanning is the first physical implementation step, establishing the core and die boundaries, creating layout regions for the 4 physical partitions, placing hard macros, and assigning external I/O pins. The **TITAN-X SoC** uses a square **1000µm x 1000µm die** with a core boundary of **960µm x 960µm**.

## 2. Floorplan Specifications
- **Die Area**: 1,000,000 µm² (1.0 mm²)
- **Core Area**: 921,600 µm² (0.92 mm²)
- **Margins**: 20 µm on all four sides.
- **Utilization Target**: 60%
- **Core Rows**: 114 rows (Row height = 8.4 µm based on OSU018 PDK).

## 3. Floorplan Strategy
1. **Subsystem Quadrants**:
   - **`cpu_complex_group`** (Upper-Left)
   - **`memory_l2_group`** (Upper-Right)
   - **`high_speed_io_group`** (Lower-Left)
   - **`peripherals_group`** (Lower-Right)
   - Each quadrant is isolated by a **15µm physical keep-out halo** to prevent cross-block noise and route overlaps.
2. **Nested Districts**: Within the CPU complex, nested regions are created for high-activity submodules (`secure_boot_group`, `cpu_power_group`, `cpu_core_group`) with 10µm halos to keep timing-critical gates tightly clustered.
3. **Macro Placement**: The `u_sram` hard macro (280µm x 210µm) is placed at `(580, 550)µm` in the Memory quadrant, orientations Standard (North), surrounded by a **25µm routing halo**.
4. **I/O Pin Placement**: Pin assignments are optimized to minimize crossing routing lines:
   - **LEFT Edge**: Clock and reset pads (`sys_clk`, `sys_rst_n`, JTAG) at 120µm pitch.
   - **TOP Edge**: DDR memory interface pads (65 pads) at 13µm pitch.
   - **RIGHT Edge**: High-speed communication pads (PCIe, MIPI, HDMI) at 22µm pitch.
   - **BOTTOM Edge**: Low-speed peripherals and GPIOs (72 pads) at 18µm pitch.

## 4. Output Files
- **`Output_Files/floorplan_summary.rpt`**: Detailed die/core sizes, macro coordinates, and region rectangles.
- **`Output_Files/io_placement.rpt`**: Coordinates and edge assignments for all 144 external pins.
- **`Output_Files/floorplan.def`**: Standard Design Exchange Format representation of the floorplanned layout.
- **`Output_Files/floorplan.log`**: Standard tool execution log.
