# Step 12: Power Planning

## 1. Overview
Power planning establishes a robust Power Delivery Network (PDN) to distribute VDD (3.3V) and VSS (0V) evenly across the **TITAN-X SoC** layout, preventing physical damage from electromigration and ensuring minimal voltage drop (IR drop). For SCL 180nm, with a peak chip-level estimated power of **~850mW**, a solid 2-D metal grid structure is implemented.

## 2. Power Delivery Network Specifications
- **Voltage rails**: VDD = 3.3 V, VSS = 0.0 V.
- **Global Power Rings**: Metal5 / Metal6 continuous power rings (10.0µm width, 2.0µm spacing) surrounding the entire core to serve as the primary current supply spine.
- **Power Stripes**:
  - Horizontal Metal3 stripes (5.0µm width, 50.0µm pitch).
  - Vertical Metal4 stripes (5.0µm width, 50.0µm pitch).
  - Orthogonal intersections are via-connected at all crossings to form a highly dense 2-D mesh.
- **Standard Cell Rails**: Metal1 rails running horizontally along every cell row (0.48µm width) to directly interface with cell VDD/GND pins.
- **Macro Rings**: Local Metal3/Metal4 guard rings (3.0µm width, 1.5µm spacing) routed around the `u_sram` hard macro and connected to the global power mesh.
- **Partition Guard Rings**: Metal3 double-guard VDD/VSS rings (3.0µm width) routed directly along all 4 virtual partition boundaries to serve as physical shielding and structural microscopical borders.

## 3. Output Files
- **`Output_Files/power_network_summary.rpt`**: Analysis of PDN wire width, pitch, and sheet resistance specs.
- **`Output_Files/ir_drop_analysis.rpt`**: Estimated static and dynamic IR drop per quadrant. Achieves worst-case IR drop of **18.4 mV** (< 1% of VDD = 3.3V, well within the 5% target limit of 165mV).
- **`Output_Files/power_rail_drc.rpt`**: PDN clearance checks and electromigration safety margins (all PASS).
- **`Output_Files/powerplan.log`**: Log file showing OpenROAD-style execution.
