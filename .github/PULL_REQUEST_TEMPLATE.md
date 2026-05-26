## 🚀 Pull Request Template

### Description
Provide a comprehensive description of the architectural modifications, RTL modules, or software enhancements integrated by this PR. 

### Type of Change
- [ ] **Bug Fix**: Non-breaking fix to a simulation or hardware defect.
- [ ] **New Feature**: Synthesizable architectural module or custom instruction set extension.
- [ ] **Documentation**: MkDocs, relative block diagrams, or software guides.
- [ ] **ASIC CAD Flow**: Changes to synthesis SDC, PNR script, or library configurations.

---

## 🛠️ Verification & ASIC CAD Checklists

### 1. Functional Verification
- [ ] **RTL Linting**: Checked clean of multi-driven nets, latch inference, or implicit wire declarations via Verilator (`verilator --lint-only`).
- [ ] **ISA Compliance Tests**: Passed standard RISC-V compliance suite (`rv64ui`/`rv64um` tests) in Spike/Verilator.
- [ ] **Coherence Validation**: Multi-hart memory sweeps complete with zero cache-line lockups.

### 2. Physical Design & Timing (ASIC flow)
- [ ] **Logical Synthesis**: Completed via Cadence Genus (zero unresolved modules).
- **Setup Timing Slack**: `[Insert Value]` (Must be >= 0.000 ns)
- **Hold Timing Slack**: `[Insert Value]` (Must be >= 0.000 ns)
- [ ] **Physical Verification**: Place-and-route completed via Cadence Innovus.
- **DRC Errors count**: `[Insert Value]` (Must be 0)
- **LVS Mismatch count**: `[Insert Value]` (Must be 0)

---

### Screenshots / Waveforms (if applicable)
Please attach GTKWave trace waveforms or Cadence Innovus physical layout stream captures displaying the correctness of the layout.
