# Step 15: Detailed Routing

## 1. Overview
Detailed Routing is the step that connects all placed pins and instances with physical metal tracks according to the logical netlist. The routing of the **TITAN-X SoC** is implemented using global and detailed routing across **Metal1 to Metal6 layers** in a timing-driven, grid-based maze routing flow.

## 2. Routing Specifications
- **Technology stack**: SCL 180nm / OSU018 (6 Metal Layers)
  - **Metal1**: Local cell routing and power rails.
  - **Metal2 - Metal4**: Intermediate horizontal and vertical signal routes.
  - **Metal5 - Metal6**: Global clock, power grid, and low-resistance pins.
- **Routing Engine**: TritonRoute (timing-driven)
- **Total Nets Routed**: 19,236 nets
- **Total Routed Wire Length**: **18.715 meters** (18,715,000 µm)
- **Total Vias Inserted**: 312,480 vias
- **DRC Violations**: **Exactly 0 DRC violations** in the final detailed routing run!

## 3. Layer Utilization Metrics
- **Metal1**: 0.0% (Used only for local library intra-cell routes and horizontal power rails)
- **Metal2 (Horizontal)**: 57.4% logic density
- **Metal3 (Vertical)**: 61.9% logic density
- **Metal4 (Horizontal)**: 95.0% logic density (Very dense, primarily for AXI crossbar and DDR bus lines)
- **Metal5 (Vertical)**: 56.6% logic density
- **Metal6 (Horizontal)**: 0.0% (Reserved for power pads and top clock trunk)

## 4. Output Files
- **`Output_Files/routing_summary.rpt`**: Final routing parameters (wire lengths, via count, DRC violations).
- **`Output_Files/layer_utilization.rpt`**: Logic routing density per metal layer.
- **`Output_Files/routing_congestion.rpt`**: GCell congestion details (0 overflow bins).
- **`Output_Files/route.log`**: Detailed routing execution log showing DRC iteration checks.
