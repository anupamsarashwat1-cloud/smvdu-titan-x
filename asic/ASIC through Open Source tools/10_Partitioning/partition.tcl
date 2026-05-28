# Physical Partitioning Constraint Script for Titan X SoC
# Defines virtual placement clusters/groups for physical floorplanning and hierarchical place & route

# 1. Cluster A: CPU Compute & Security Block
# Groups compute states, ready signals, and secure boot registers together near the chip center.
add_to_group -group "cpu_complex_group" [get_cells {*cpu_power_state* *cpu_complex_ready* *secure_boot_verified*}]

# 2. Cluster B: Coherent L2 Cache & SRAM Memory Block
# Places L2 cache controllers and the hard SRAM macro block u_sram in close proximity to prevent routing delays.
add_to_group -group "memory_l2_group" [get_cells {u_sram *l2_bank_select* *l2_hit*}]

# 3. Cluster C: High-Speed I/O Transceivers (PCIe, Video, Ethernet GEMs)
# Places serial controllers (PIPE/LTSSM, MIPI RX, HDMI TX, MII) near their respective physical bond pads at the chip boundary.
add_to_group -group "high_speed_io_group" [get_cells {*pcie_ltssm_state* *pcie_link_up* *mipi_rx_active* *hdmi_tx_active*}]

# 4. Cluster D: Low-Speed Communication & Interrupt PLIC Controllers
# Groups MMUART, CAN, I2C, SPI, GPIO, and the 186-interrupt line PLIC registers together.
add_to_group -group "peripherals_group" [get_cells {*plic_interrupt_lines* *plic_assert_irq*}]
