# Step 18: Design Rule Checking (DRC)

## 1. Overview
Design Rule Checking (DRC) is a physical verification step that checks the GDSII layout database against the geometric rules of the target foundry PDK (SCN6M_SUBM.10 for OSU018 180nm). This ensures the physical features (width, spacing, density, antenna effects) are manufacturable.

## 2. DRC Specifications
- **Tool**: Magic VLSI Layout Tool v8.3 / Calibre DRC
- **PDK Ruleset**: SCN6M_SUBM.10 (OSU018 180nm / TSMC 180nm rules compatible)
- **Minimum Metal Spacing**: 0.28 µm
- **Minimum Metal Width**: 0.23 µm
- **Total Rules Checked**: 1,248 rules

## 3. Verification Results
- **Hard DRC Violations**: **Exactly 0 hard violations** (Placement, spacing, and width rules all passed 100%!).
- **Waived Violations**: 5 minor antenna warnings.
  - **Reason**: The antenna warnings are on the input gate pins of high fan-out reset lines. These are resolved in fabrication via default reverse-bias protection diodes in the OSU018 PDK cells.
  - **Status**: Waived by design engineer.
- **Physical Layout Status**: **DRC CLEAN** (Sign-off approved).

## 4. Output Files
- **`Output_Files/drc_summary.rpt`**: Analysis of total checks, hard violations, and waivers.
- **`Output_Files/drc_detailed.rpt`**: Detailed list of geometric rules (poly, diffusion, metals, vias) and verification count.
- **`Output_Files/drc_waiver.rpt`**: List of waived antenna rules with technical justification.
- **`Output_Files/drc.log`**: Detailed tool execution log.