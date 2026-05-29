# Step 16: Parasitic Extraction (PEX)

## 1. Overview
Parasitic Extraction (PEX) translates the physical metal layout shapes (wires, vias, and adjacent spacing) into electrical models comprising resistance (R), ground capacitance (C), and coupling capacitance (Cc). This is crucial for back-annotating physical delays into Static Timing Analysis.

## 2. Extraction Specifications
- **Technology Node**: OSU018 180nm
- **Extraction Engine**: StarRC / OpenRCX (PEX corner: typical `tt_1v8_25c`)
- **Total Nets Extracted**: 19,236 nets
- **P PDK Sheet Resistance Values**:
  - **Metal1**: 0.08 Ω/sq
  - **Metal2 - Metal4**: 0.05 Ω/sq
  - **Metal5 - Metal6**: 0.03 Ω/sq
- **P PDK Capacitance Values**:
  - **M1-to-Substrate**: 35 aF/µm²
  - **Coupling Capacitance (Cc)**: 45 aF/µm (typical adjacent wire coupling)

## 3. Extraction Metrics
- **Total Mesh Resistance**: 4,467,286.2 Ω
- **Total Ground Capacitance (C)**: 661.265 pF
- **Total Coupling Capacitance (Cc)**: 107.469 pF
- **Worst RC Net Delay**: 111.82 ps (Net: `u_cpu_core/u_pipeline/pc_reg[14]`, high fan-out)
- **Average RC Net Delay**: 13.402 ps
- **Coupling Ratio**: 13.97% (ratio of Cc / (C + Cc), which is extremely good and safe from signal crosstalk noise).

## 4. Output Files
- **`Output_Files/extraction_summary.rpt`**: Analysis of total resistance, ground capacitance, and coupling capacitance.
- **`Output_Files/parasitics_stats.rpt`**: Top-10 worst RC net delays and logic nets statistics.
- **`Output_Files/titan_x_top.spef`**: Standard Parasitic Exchange Format (SPEF) file containing the back-annotation parasitics.
- **`Output_Files/extract.log`**: Detailed tool execution log.