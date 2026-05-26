# SMVDU-TITAN-X — Phase 1: Changelog

All notable changes made to the SMVDU-TITAN-X Phase 1 repository will be documented in this file.

---

## [1.0.0] - 2026-05-26

### Added
*   **Submodule Architecture**: Divided the main repository into standalone development phases. Created `smvdu-titan-x-phase1` as a standalone git submodule.
*   **Chipyard SoC Configuration**: Created `TitanXPhase1Config.scala` defining a single RV64GC Rocket core with SiFive UART.
*   **Golden RTL Stub**: Integrated `rtl/top/titan_x_top.v` defining external boundaries.
*   **Bare-metal Firmware**:
    *   `hello_uart`: Full boot banner banner test.
    *   `exit_test`: Rapid simulation exit routine.
*   **Submodule Scripts**: Added `build_sim.sh`, `run_sim.sh`, and `run_tests.sh` to fully automate local building and testing workflows.
*   **Documentation Suite**: Written `README.md`, `RESULTS.md`, `STRUCTURE.md`, `block_diagram.md`, and `design_spec.md`.

### Fixed
*   **PutPartial Assertion**: Aligned all firmware sections to 64-bytes to avoid TileLink protocol violations in DRAMSim2.
*   **Console Character Bug**: Replaced `.string` with `.ascii` in banner definitions to eliminate premature null-terminator bugs.
*   **tohost Exit Bug**: Corrected linker sections mapping `.tohost` address boundary enabling clean exit execution.
