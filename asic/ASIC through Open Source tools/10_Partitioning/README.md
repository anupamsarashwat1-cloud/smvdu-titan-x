# Step 10: Physical Partitioning

## 1. Overview
Physical partitioning is a critical step in the physical design flow of the **TITAN-X SoC** to reduce complexity, manage routing congestion, and enable hierarchical layout analysis. The full chip's **44,827 standard cells** are grouped into 4 distinct physical partitions based on logical function and connectivity.

## 2. Partition Strategy
We define four virtual quadrants (Subdivisions) corresponding to the main subsystems of the SoC:
1. **`cpu_complex_group`**: Contains the RISC-V CPU core, secure boot verified registers, and power states.
2. **`memory_l2_group`**: Groups the L2 cache controllers and the hard 2KB SRAM macro block (`u_sram`) to minimize cache hit access latency.
3. **`high_speed_io_group`**: Places high-bandwidth transceivers (PCIe, MIPI CSI/DSI, HDMI TX) near their physical pads at the right boundary.
4. **`peripherals_group`**: Aggregates low-speed serial peripherals (UART, CAN, I2C, SPI) and the PLIC registers.

## 3. Output Files
- **`Output_Files/partition_report.txt`**: Complete metrics showing gate counts, estimated area, and interconnect wires for each partition.
- **`Output_Files/partition.log`**: Log file showing partition assignment execution.
- **`partition.tcl`**: The constraint script implementing the partition directives in OpenROAD.
