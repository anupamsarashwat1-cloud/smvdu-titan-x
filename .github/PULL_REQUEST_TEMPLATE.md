## Description

Provide a clear and concise description of the changes introduced in this pull request. Explain the hardware reasoning or design choices if applicable (e.g., pipeline changes, control path logic, timing constraints).

---

## Type of Change

*Please tick the options that are relevant to this PR:*

- [ ] 🔴 **RTL Bug Fix**: Corrections to existing design logic (Verilog/Chisel).
- [ ] 🚀 **RTL Feature / Core IP**: Addition of new hardware blocks, peripherals, or accelerators.
- [ ] 🧪 **Verification / Simulation**: Updates or additions to Cocotb, Verilator harnesses, or compliance suites.
- [ ] 🎛️ **FPGA Prototyping**: Changes to board targets, LiteX configurations, or pin constraints.
- [ ] 💾 **Software / Firmware**: Changes to bare-metal code, OpenSBI, U-Boot, or Linux kernel configs.
- [ ] 📖 **Documentation**: Updates to hardware specs, tutorials, block diagrams, or READMEs.

---

## Hardware / RTL Verification Details

*To maintain the stability of SMVDU-TITAN-X, all hardware changes must undergo rigorous simulation regression before merge.*

### 1. Simulation & Code Quality
- [ ] **Linter Check**: Run Verilator lint checks on the modified modules:
  ```bash
  verilator --lint-only -Wall <modified_file>.v
  ```
  *Result*: No lint warnings or errors (or list known exceptions below).
- [ ] **Cocotb Regression**: Checked using Cocotb testbenches:
  ```bash
  bash scripts/sim/run_cocotb.sh
  ```
  *Result*: All test cases passed.

### 2. Waveform Verification (Recommended)
- [ ] **Waveform Analysis**: Inspected the `.vcd` or `.fst` simulation waveforms using GTKWave to confirm cycle-accurate correctness.
- *Insert key timing waveforms, state machine transitions, or screenshots if applicable.*

---

## Verification Logs / Console Outputs

```text
# Paste relevant Cocotb test console output or Verilator logs here
```

---

## Related Issues & Board Approval
* Fixes # (issue number)
* Target SoC Phase: **Phase [1 / 2 / 3 / 4 / 5 / 6]**
