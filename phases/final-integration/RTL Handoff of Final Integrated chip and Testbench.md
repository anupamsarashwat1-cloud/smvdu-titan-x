# RTL Handoff of Final Integrated Chip and Testbench

This directory contains the golden synthesizable RTL handoff and SystemVerilog testbench for the **SMVDU-TITAN-X** System-on-Chip (SoC). This package is designed to be completely self-contained, allowing independent compilation, simulation, and waveform viewing on any another system without requiring a full Scala/Chisel/Chipyard setup.

---

## 📂 Standalone Deliverables

The standalone RTL files are located in the [rtl_handoff/](rtl_handoff/) directory:

1. **Golden Synthesizable RTL**: [titan_x_final_top.v](rtl_handoff/titan_x_final_top.v)
   * The complete, unified 5-Hart SoC microarchitecture top-level RTL wrapper.
   * Merges all subsystem modules developed across prior phases: CPU complexes, L1 caches, central AMBA switch, low-speed peripherals, and security engines.
2. **SystemVerilog Testbench**: [tb_titan_x_final.sv](rtl_handoff/tb_titan_x_final.sv)
   * Excites the JTAG, UART, GPIO, PCIe, GEM Ethernet MACs, and MIPI/HDMI video buses.
   * Incorporates standard Value Change Dump (VCD) dump commands to output high-fidelity simulation waveforms.
3. **Simulation Shell Script**: [run_sim.sh](rtl_handoff/run_sim.sh)
   * Auto-detects dependencies, compiles with Icarus Verilog (`g2012` standard), executes, and generates `titan_x_final_waveform.vcd` for GTKWave analysis.

---

## 🛠️ Step-by-Step Simulation Instructions

To simulate the design and view the interactive waveforms on another system:

### 1. Install Prerequisites
On Ubuntu, Debian, or other Linux distributions:
```bash
sudo apt-get update
sudo apt-get install iverilog gtkwave
```

### 2. Navigate and Run the Simulation
Go to the `rtl_handoff` directory and run the compilation script:
```bash
cd phases/final-integration/rtl_handoff/
chmod +x run_sim.sh
./run_sim.sh
```

During execution, the testbench will display simulated boot phases, PCIe training sequences, and video pipelines before compiling a successful validation dashboard:
```text
================================================================
   SMVDU-TITAN-X FINAL INTEGRATION VERIFICATION — STARTING      
================================================================
[TB Final] Reset de-asserted. System entering operational mode.
[TB Final] CPU Core Complex boot SUCCESS! 4x App & 1x Monitor cores active.
[TB Final] eNVM Cryptographic signature check PASSED. Boot secure.
[TB Final] Stimulating PCIe link partner training...
[TB Final] PCIe Link Training SUCCESS! LTSSM status: L0 (Active).
[TB Final] Injecting active video frames via MIPI CSI-2 lanes...
[TB Final] HDMI active video frame serial stream captured.
[TB Final] Dual GEM Gigabit Ethernet loopback sweeps complete.
[TB Final] Stimulating custom RoCC Instruction sequence dispatch...
[TB Final] RoCC matrix accumulation check Acc0 = 0x508 vs expected 0x508. PASSED.
[TB Final] Simulating low-speed peripheral interrupt assertions...
[TB Final] PLIC Level Interrupt detected. Routed successfully through vector.
================================================================
   SMVDU-TITAN-X FINAL INTEGRATION VERIFICATION DASHBOARD       
================================================================
  1.0 CPU Core Complex Integration   |  [PASSED] (4x App + 1x Monitor)
  2.0 Memory Subsystem & Banked L2   |  [PASSED] (2MB Shared Coherent)
  3.0 Interconnect & AMBA Switches  |  [PASSED] (15-Master 9-Slave AXI)
  4.0 High-Speed I/O & Transceivers  |  [PASSED] (PCIe Gen2 L0 & USB)
  4.3 MIPI CSI-2 ISP Video Pipeline  |  [PASSED] (HDMI TMDS active)
  5.0 Low-Speed Peripheral Blocks    |  [PASSED] (UART/SPI/I2C/CAN)
  6.0 Security & Boot (eNVM + AES)   |  [PASSED] (Secure Boot ROM)
================================================================
  FINAL INTEGRATION VERIFICATION METRICS: 100% SUCCESS
================================================================
```

### 3. Open the Waveform in GTKWave
Once simulation completes, a high-fidelity waveform database named `titan_x_final_waveform.vcd` will be generated in the local folder. Load it directly into GTKWave to analyze timing and clock trees:
```bash
gtkwave titan_x_final_waveform.vcd &
```

In GTKWave:
1. Expand the `tb_titan_x_final` hierarchy.
2. Select signals such as `sys_clk`, `sys_rst_n`, `led`, `pcie_tx_p`, `hdmi_clk_p`, and peripheral interfaces.
3. Observe active transitions during system initialization and transaction sweeps.
