---
name: "🐛 Bug Report"
about: Report a hardware defect, simulation mismatch, or software compiler error
title: "[BUG] "
labels: bug, untriaged
assignees: ""
---

### 1. Hardware/Software Environment
* **SoC Development Phase**: [Phase 1 / Phase 2 / Phase 3 / Phase 4 / Phase 5]
* **Target Board / Platform**: [Verilator Sim / Spike ISA Sim / FPGA Artix-7 / FPGA Kintex-7 / ASIC Cadence Flow]
* **Compiler / Toolchain Version**: [e.g. riscv64-unknown-elf-gcc 12.2.0, verilator 5.006, Genus 21.1]

### 2. Description of the Bug
Provide a clear and concise description of what the hardware/software defect is.

### 3. Step-by-Step Reproduction
1. Set config to `[Config Name]` (e.g. `TitanXPhase5Config`)
2. Run simulation command: `make ...`
3. Pass binary `[Bin Name]`
4. See timing mismatch or assertion failure:

```text
[Insert trace logs or simulation errors here]
```

### 4. Expected Behavior
A clear and concise description of what you expected to happen.

### 5. Waveform / Schematics (if applicable)
If the bug is an RTL timing or state machine error, please attach a screenshot of the GTKWave/SimVision trace waveform showing the signal mismatch.
