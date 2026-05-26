# Prototyping on FPGA Development Boards

To validate the physical performance and pipeline integrity of the SMVDU-TITAN-X designs, we support rapid prototyping on Xilinx FPGA target platforms.

---

## 1. Supported Hardware Targets

*   **Xilinx Artix-7 (Arty-A7)**: Recommended for Phase 1 (Bare-Metal Core) and Phase 2 (Boot Infrastructure) low-speed testing.
*   **Xilinx Kintex-7 (KC705)**: Recommended for Phase 3 (Quad-Core coherent Linux Boot) with DDR3 memory and Ethernet MAC testing.

---

## 2. FPGA Rapid Prototyping (LiteX Target Flow)

We utilize the open-source **LiteX** SoC builder framework to wrap standard cores and generate optimized memory controllers and PHY blocks.

### Step 1: Initialize target builder
Initialize LiteX build constraints targeting the Arty-A7 board:

```bash
cd fpga/litex_targets/arty_a7/
# Initialize build and download constraints
python3 arty.py --build
```

### Step 2: Synthesis and Bitstream Generation
LiteX auto-generates Vivado constraints, builds synthesizable wrappers, and invokes `vivado` in batch mode to run logical synthesis, placement, routing, and bitstream generation.

---

## 3. Programming the FPGA Board

Connect your target board via JTAG USB interface to the host and download the bitstream:

```bash
# Load generated bitstream to target board
python3 arty.py --load
```

Connect a serial terminal client (e.g., `picocom` or `minicom`) at a baud rate of `115200` to monitor output:

```bash
picocom -b 115200 /dev/ttyUSB1
```
