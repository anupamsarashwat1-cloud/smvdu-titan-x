# Physical Memory Map Specification

The SMVDU-TITAN-X multicore processor SoC features a unified **39-bit physical address space**, allocating distinct MMIO coordinates for standard peripherals, control registers, and high-speed memory subsystems.

---

## 1. Complete Memory Address Allocation

The standard MMIO layout of the integrated processor is detailed below:

| Peripheral | Base Address | Address Size | Description |
| :--- | :--- | :--- | :--- |
| **BootROM** | `0x0001_0000` | 64 KB | Hard-coded first-stage bootloader (FSBL) |
| **CLINT (Timers)** | `0x0200_0000` | 64 KB | Core Local Interruptor (software & timer interrupts) |
| **PLIC (Interrupts)** | `0x0C00_0000` | 16 MB | Platform Level Interrupt Controller (peripheral interrupts) |
| **SiFive UART** | `0x1002_0000` | 4 KB | 8-N-1 Serial communication port |
| **SPI Flash Config** | `0x1003_0000` | 4 KB | SPI configuration registers |
| **SPI Flash Memory** | `0x2000_0000` | 256 MB | Memory-mapped SPI Flash storage window |
| **GPIO Controller** | `0x5401_0000` | 4 KB | 32-bit General Purpose Input/Output registers |
| **SD Card SPI** | `0x5402_0000` | 4 KB | SPI controller for SD card storage |
| **LiteETH MAC** | `0x5500_0000` | 64 KB | Gigabit Ethernet MAC control buffers |
| **USB 2.0 OTG** | `0x5600_0000` | 64 KB | USB 2.0 transceiver registers & DMA descriptor space |
| **PCIe Gen2 Config** | `0x5700_0000` | 64 KB | PCIe configuration registers & LTSSM status |
| **HDMI Display DMA**| `0x5800_0000` | 16 MB | HDMI timing controls & 16 MB video frame buffer |
| **Crypto Accelerator**| `0x5900_0000` | 4 KB | AES-256 / SHA-3 registers |
| **PCIe OB Window** | `0x6000_0000` | 256 MB | Direct outbound PCIe translation window |
| **LiteDRAM / HBM2** | `0x8000_0000` | 2 GB | DDR3/4 DRAM or Multi-Channel HBM2 address space |

---

## 2. Platform Level Interrupt Controller (PLIC)

Low-speed MMIO peripherals assert interrupts routed to Rocket CPU cores through the PLIC:

*   **Interrupt Source 1**: SiFive UART TX/RX activity.
*   **Interrupt Source 2**: GPIO pin transition trigger.
*   **Interrupt Source 3**: SPI Flash state transfer.
*   **Interrupt Source 4**: Gigabit Ethernet frame received/transmitted.
*   **Interrupt Source 5**: USB transceiver active interrupt.
*   **Interrupt Source 6**: PCIe controller DMA transfer complete.
*   **Interrupt Source 7**: Cryptographic AES/SHA compression completed.
