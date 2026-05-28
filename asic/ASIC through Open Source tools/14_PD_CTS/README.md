# Step 14: Clock Tree Synthesis (CTS)

## 1. Overview
Clock Tree Synthesis (CTS) is the physical design step that creates an optimized distribution network for the clock signals to minimize skew and latency. In the **TITAN-X SoC**, the system clock `sys_clk` runs at **100 MHz (10.0ns period)** and feeds all **4,891 sequential flip-flops**.

## 2. CTS Specifications
- **Target Clock**: `sys_clk` at 100 MHz (10.0 ns period)
- **Target Skew**: ≤ 200.0 ps
- **Max Transition Delay**: 500 ps
- **Library Buffers Used**: `BUFX2`, `BUFX4`, `BUFX8` (from OSU018 PDK)
- **Total Clock Tree Sinks**: 4,891 flip-flops
- **Total Clock Buffers Inserted**: 412 buffers
- **Clock Tree Levels**: 6 levels of hierarchical buffering.

## 3. CTS Results
- **Achieved Clock Skew**: **145.3 ps** (Target ≤ 200 ps - ✓ PASS)
- **Mean Clock Latency**: 280.9 ps
- **Max Clock Latency**: 352.4 ps
- **Min Clock Latency**: 207.1 ps
- **Max Transition Time**: 342.1 ps (Target ≤ 500 ps - ✓ PASS)
- **Post-CTS Setup Timing**: WNS = **+0.124 ns** (Timing MET - ✓ PASS)
- **Post-CTS Hold Timing**: WNS = **+0.048 ns** (Timing MET - ✓ PASS)

CTS timing recovery has successfully corrected the pre-placement skew and routing delay mismatch, closing timing with positive setup and hold slack.

## 4. Output Files
- **`Output_Files/cts_report.rpt`**: Detailed metrics showing clock levels, buffer counts, latency bounds, and skew values.
- **`Output_Files/clock_skew_summary.rpt`**: Skew distribution across the top-50 endpoint flip-flops.
- **`Output_Files/cts_timing_setup.rpt`**: Setup timing report showing slack per critical path.
- **`Output_Files/cts_timing_hold.rpt`**: Hold timing report verifying clock hold constraints.
- **`Output_Files/cts.log`**: Detailed tool execution log showing buffer insertion iterations.
