---
name: "🛡️ ASIC Physical Design Regression"
about: Report a logical synthesis constraint issue, timing violation (STA), or DRC/LVS failure
title: "[ASIC-PD] "
labels: asic, timing-violation, high-priority
assignees: ""
---

### 1. CAD Tool Flow Context
* **Synthesis Tool**: [Cadence Genus / Yosys / Other]
* **Place-and-Route Tool**: [Cadence Innovus / OpenRoad / Other]
* **Standard-Cell Library (PDK)**: [e.g. SCL 180nm, TSMC 28nm]

### 2. Physical design defect description
Select the defect type:
- [ ] **Setup Timing Violation**: Critical path negative slack.
- [ ] **Hold Timing Violation**: Timing race condition.
- [ ] **DRC Violation**: Antenna, spacing, metal density, or overlap errors.
- [ ] **LVS Mismatch**: Gate-level schematic does not match layout netlist.
- [ ] **Synthesis Error**: Latch inferred, multi-driven net, or unresolved pin binding.

### 3. Error Trace Logs
Paste the critical timing report, DRC violator summary, or LVS netlist mismatch report here:

```text
[Insert CAD output reports here]
```

### 4. Proposed Layout / RTL Adjustments
Describe what changes to the timing SDC constraints, placement halos, clock routing, or RTL structure are needed to resolve this physical design regression.
