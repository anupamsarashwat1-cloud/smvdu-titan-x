# Step 11: Floorplanning Script for SMVDU-TITAN-X SoC (SCL 180nm)
# Defines core bounds, nested placement partitions, I/O pin placements, and hard macro positions.

# 1. Main Core bounds (State level)
# Core Area: (0, 0) to (1000, 1000) microns. Aspect ratio: 1.0. Utilization: 0.6.
initialize_floorplan -core_utilization 0.6 -aspect_ratio 1.0 -core_margins 20 20 20 20

# 2. Virtual Subdivisions (Subsystem Quadrants)
# Creates a 15µm physical keep-out halo between subdivisions for visual microscopic borders.
create_physical_region -name "cpu_complex_group" -rect {80 520 450 920} -halo 15
create_physical_region -name "memory_l2_group" -rect {550 520 920 920} -halo 15
create_physical_region -name "high_speed_io_group" -rect {80 80 450 450} -halo 15
create_physical_region -name "peripherals_group" -rect {550 80 920 450} -halo 15

# 3. Nested Districts (Submodules inside Compute Subsystem Quadrant)
# Assigns individual submodules to nested physical regions with their own 10µm halos.
create_physical_region -name "secure_boot_group" -rect {100 540 250 700} -parent "cpu_complex_group" -halo 10
create_physical_region -name "cpu_power_group" -rect {280 540 430 700} -parent "cpu_complex_group" -halo 10
create_physical_region -name "cpu_core_group" -rect {100 730 430 900} -parent "cpu_complex_group" -halo 10

# 4. Hard Macro Placement
# Places the hard SRAM macro block u_sram inside the Memory Subsystem quadrant.
place_cell -cell "u_sram" -coordinate {580.0 550.0} -orientation "N" -fixed

# 5. I/O Pin Placement
# Assigns high-speed and low-speed signal groups to opposite boundaries to optimize routing paths.
assign_pins -pins {sys_clk sys_rst_n jtag_*} -side "LEFT"
assign_pins -pins {ddr_*} -side "TOP"
assign_pins -pins {pcie_* mipi_* hdmi_*} -side "RIGHT"
assign_pins -pins {usb_* qspi_* uart_* spi_* i2c_* can_* gpio_* led} -side "BOTTOM"
