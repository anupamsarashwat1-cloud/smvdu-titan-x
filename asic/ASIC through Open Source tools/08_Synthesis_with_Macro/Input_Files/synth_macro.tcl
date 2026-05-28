# 1. Read Verilog design files
read_verilog -lib titan_x_soc/06_Macro_Generation_Openram/sram_32x64_180nm.v
read_verilog titan_x_soc/07_Macro_Integration/titan_x_macro_top.v

# 2. Elaborate design hierarchy
hierarchy -top titan_x_top

# 3. High-level synthesis and optimization
synth -top titan_x_top

# 4. Map flip-flops to the target standard cell library
dfflibmap -liberty /home/anupam-sarashwat/vsdflow/library/osu018_stdcells.lib

# 5. Map combinational logic to standard cells
abc -liberty /home/anupam-sarashwat/vsdflow/library/osu018_stdcells.lib

# 6. Clean up netlist
clean

# 7. Write mapped gate-level Verilog netlist (incorporating SRAM block as blackbox)
write_verilog -noattr titan_x_soc/08_Synthesis_with_Macro/titan_x_macro_synth_netlist.v

# 8. Print design statistics
stat -liberty /home/anupam-sarashwat/vsdflow/library/osu018_stdcells.lib
