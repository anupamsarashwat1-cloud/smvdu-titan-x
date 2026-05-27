# SMVDU-TITAN-X — Final Integrated SoC Firmware & Boot Guide

This document describes the unified physical MMIO address space, the complete 186-source PLIC interrupt routing scheme, and the secure boot initialization sequence for the fully integrated **SMVDU-TITAN-X** processor.

---

## 1. Unified Physical MMIO Address Map

The fully populated 39-bit physical address map allocated for all CPU cores (4x Application + 1x Monitor) is structured as follows:

| Subsystem | Base Physical Address | Address Size | Description |
| :--- | :--- | :--- | :--- |
| **Secure Boot ROM** | `0x0001_0000` | 64 KB | Hard-coded first-stage bootloader (FSBL) & security keys |
| **eNVM Controller** | `0x0002_0000` | 128 KB | Embedded Non-Volatile Memory (eNVM) space |
| **CLINT (Timers)** | `0x0200_0000` | 64 KB | Core Local Interruptor (software & timer interrupts) |
| **PLIC (Interrupts)** | `0x0C00_0000` | 16 MB | Platform Level Interrupt Controller (186 global interrupts) |
| **5x MMUARTs** | `0x1002_0000` to `0x1002_4000` | 20 KB (4KB ea.) | Five multi-mode UART communication channels |
| **SPI Flash Config** | `0x1003_0000` | 4 KB | QSPI flash memory configuration registers |
| **QSPI Flash XIP** | `0x2000_0000` | 256 MB | Memory-mapped SPI Flash storage window (Execute-in-Place) |
| **GPIO Controller** | `0x5401_0000` | 4 KB | 32-bit general-purpose digital input/output pins |
| **SD Card SPI** | `0x5402_0000` | 4 KB | SPI controller for ext4/FAT partitioned storage cards |
| **Dual GEM MACs** | `0x5500_0000` to `0x5501_0000` | 128 KB (64KB ea.) | Gigabit Ethernet MAC controllers (GEM 0 & GEM 1) |
| **USB 2.0 OTG** | `0x5600_0000` | 64 KB | USB 2.0 transceiver registers & DMA descriptor space |
| **PCIe Gen2 Config** | `0x5700_0000` | 64 KB | PCIe configuration registers & LTSSM status |
| **HDMI Display DMA**| `0x5800_0000` | 16 MB | HDMI timing controls & 16 MB video frame buffer |
| **MIPI CSI-2 / ISP** | `0x5900_0000` | 64 KB | MIPI receiver settings, ISP parameters, and VDMA controls |
| **User Crypto-Processor**| `0x5A00_0000` | 4 KB | AES/SHA/ECDSA accelerators & True Random Number Generator |
| **PCIe OB Window** | `0x6000_0000` | 256 MB | Direct outbound PCIe Gen2 transaction window |
| **L2 Banked SRAM** | `0x7000_0000` | 2 MB | Mapped L2 Loosely Integrated Memory (LIM) scratchpad |
| **DDR4 Memory** | `0x8000_0000` | 2 GB | Physical DDR4 DRAM memory window |

---

## 2. PLIC Interrupt Routing Map (186 Sources)

The Platform Level Interrupt Controller (PLIC) coordinates asynchronous interrupts from peripheral sources, distributing them to harts.

### Selected High-Priority Interrupt Source IDs

| Source ID | Peripheral Source | Description |
| :--- | :--- | :--- |
| **1 - 5** | `MMUART [0-4]` | Transmit/Receive buffer triggers |
| **6** | `GPIO` | Digital pin state transitions |
| **7** | `SPI Flash` | QSPI transaction complete |
| **8** | `SD Card SPI` | MMC block transfer complete |
| **9** | `GEM 0 MAC` | GEM 0 frame receive / transmit complete |
| **10** | `GEM 1 MAC` | GEM 1 frame receive / transmit complete |
| **11** | `USB 2.0 OTG` | Transceiver state changes / packet completion |
| **12** | `PCIe Gen2` | PCIe DMA transfer finished |
| **13** | `MIPI CSI-2 / ISP` | Frame synchronization / ISP buffer overflow |
| **14** | `Crypto Engine` | AES cipher completed / SHA digest ready |
| **15** | `TRNG` | Random data entropy accumulation complete |
| **16 - 186** | `System / Low-Speed` | SPIs, I2Cs, CANs, Watchdogs, and custom external bus monitors |

---

## 3. Secure Boot & Initialization Sequence

The eNVM and Secure Boot ROM orchestrate processor bring-up:

1.  **Hardware Release**: Upon `sys_rst_n` de-assertion, the Monitor Hart (Hart 4) boot vector points to Secure Boot ROM (`0x0001_0000`).
2.  **Monitor Self-Check**: The Monitor Core runs cryptographic signature checks on the embedded 128KB eNVM partition, validating the integrity of the second-stage bootloader binary.
3.  **Boot Core Complex**: Upon successful validation, the Monitor Core writes to `CPU_CTRL_REG`, releasing the 4 Application Cores (Harts 0-3) and setting their program counters to `0x8000_0000` (DDR4 start).
4.  **OpenSBI & Linux SMP**: Coherent Application cores initialize the L2 cache banked SRAMs, launch OpenSBI platform services, and boot multi-core Linux kernel threads.

---

## 4. Video Pipeline ISP & MIPI Drivers

The synthesizable ISP core processes RAW pixel streams captured over the MIPI CSI-2 interface, converting them into R/G/B TMDS serial outputs for HDMI:

```c
#define ISP_BASE          (0x59000000)
#define MIPI_CTRL         ((volatile uint32_t*)(ISP_BASE + 0x00))
#define ISP_TIMINGS       ((volatile uint32_t*)(ISP_BASE + 0x04))
#define ISP_VDMA_ADDR     ((volatile uint32_t*)(ISP_BASE + 0x08))

void initialize_camera_stream(uint32_t *hdmi_frame_buffer) {
    // 1. Map Video DMA output base address directly to HDMI Frame Buffer memory
    *ISP_VDMA_ADDR = (uint32_t)hdmi_frame_buffer;
    
    // 2. Set camera pixel timing parameters
    *ISP_TIMINGS = (640 << 16) | 480; // VGA Resolution over MIPI
    
    // 3. Enable MIPI CSI-2 decoder & active ISP pipeline (debayer & color scalar)
    *MIPI_CTRL = 1;
}
```
