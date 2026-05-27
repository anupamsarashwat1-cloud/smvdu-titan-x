#!/bin/bash
# =========================================================================
# SMVDU-TITAN-X Final Integrated SoC RTL Simulation Compilation Script
#
# Compiles the golden synthesizable Verilog and verification testbench 
# using Icarus Verilog and executes it to produce GTKWave VCD waveforms.
# =========================================================================

# Exit on error
set -e

echo "================================================================"
echo "   SMVDU-TITAN-X Final Integrated SoC RTL Simulation Runner   "
echo "================================================================"

# Check if iverilog is installed
if ! command -v iverilog &> /dev/null; then
    echo "[Error] Icarus Verilog (iverilog) is not installed."
    echo "To install: sudo apt-get install iverilog"
    exit 1
fi

echo "[1/3] Compiling synthesizable RTL and SystemVerilog Testbench..."
# Compile using Icarus Verilog with SystemVerilog support (-g2012)
iverilog -g2012 -o titan_x_sim titan_x_final_top.v tb_titan_x_final.sv

echo "[2/3] Executing RTL simulation..."
# Run the compiled simulator binary
./titan_x_sim

echo "[3/3] Simulation finished successfully!"
echo "Waveform file generated: titan_x_final_waveform.vcd"
echo ""
echo "To view the waveforms in GTKWave, run:"
echo "  gtkwave titan_x_final_waveform.vcd &"
echo "================================================================"
