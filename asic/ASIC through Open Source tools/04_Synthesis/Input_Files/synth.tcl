# Step 04: Synthesis Script for SMVDU-TITAN-X SoC (OSU018 180nm)

# 1. Read Verilog design files (Hierarchical Submodules)
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/common/sram_32x64_180nm.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/common/reset_sync.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/common/cdc_sync.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/common/fifo_sync.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/common/fifo_async.v

read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/rv_core/rv_fetch.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/rv_core/rv_decode.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/rv_core/rv_execute.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/rv_core/rv_mem.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/rv_core/rv_writeback.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/rv_core/rv_core_top.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/clint.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/plic.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/cpu_complex/cpu_complex_top.v

read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/memory_subsystem/l2_tag_array.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/memory_subsystem/l2_data_array.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/memory_subsystem/l2_cache_ctrl.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/memory_subsystem/l2_cache_top.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/memory_subsystem/ddr_ctrl/ddr_phy_if.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/memory_subsystem/ddr_ctrl/ddr_scheduler.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/memory_subsystem/ddr_ctrl/ddr_ctrl_top.v

read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/interconnect/axi4_crossbar.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/interconnect/axi4_to_ahb.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/interconnect/ahb_to_apb.v

read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/pcie/pcie_top.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/ethernet/gem_ethernet.v

read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/peripherals/uart_16550.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/peripherals/gpio_ctrl.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/peripherals/spi_master.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/peripherals/i2c_master.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/peripherals/watchdog_timer.v

read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/security/aes_engine.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/security/sha256_engine.v
read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/security/trng.v

read_verilog titan_x_soc/01_RTL_Design/Input_Files/rtl/titan_x_top.v

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

# 7. Write mapped gate-level Verilog netlist
write_verilog -noattr titan_x_soc/04_Synthesis/titan_x_synth_netlist.v

# 8. Print design statistics
stat -liberty /home/anupam-sarashwat/vsdflow/library/osu018_stdcells.lib