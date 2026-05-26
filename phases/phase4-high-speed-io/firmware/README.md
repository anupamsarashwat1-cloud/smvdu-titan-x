# SMVDU-TITAN-X — Phase 4: High-Speed I/O Firmware Reference Guide

This document describes the software driver initialization, register maps, and operating guidelines for high-speed interfaces in Phase 4: **PCIe Gen2 x4 Controller**, **USB 2.0 OTG Controller**, and **HDMI 1.4 Frame Buffer Transmitter**.

---

## 1. MMIO Memory Allocation Map

High-speed peripherals are memory-mapped in the system bus space:

| Subsystem | Base Physical Address | Address Size | Description |
|---|---|---|---|
| **PCIe Controller Config** | `0x5700_0000` | 64 KB | PCIe configuration registers & LTSSM control |
| **PCIe Outbound Window** | `0x6000_0000` | 256 MB | Direct mapping to outbound PCIe lanes |
| **USB 2.0 OTG Controller** | `0x5600_0000` | 64 KB | Controller core, DMA, and endpoint buffers |
| **HDMI DMA Frame Buffer** | `0x5800_0000` | 16 MB | Video frame buffer base & timing controls |

---

## 2. PCIe Gen2 x4 Controller Setup

The PCIe block contains configuration headers and a Link Training and Status State Machine (LTSSM) controller. 

### Register Layout

| Offset | Register Name | Access Type | Description |
|---|---|---|---|
| `0x00` | `PCIE_CTRL_REG` | R/W | Bit [0]: Enable Link, Bit [1]: Reset LTSSM, Bit [2]: Gen2 (5 GT/s) Speed Select |
| `0x04` | `PCIE_STATUS_REG` | R | Bit [2:0]: LTSSM State (0: Detect, 1: Polling, 2: Config, 3: L0), Bit [3]: Link Up |
| `0x08` | `PCIE_OB_ADDR_TRANS`| R/W | Outbound Address Translation base configuration |

### Initialization C-Driver Routine

```c
#define PCIE_CTRL_REG      ((volatile uint32_t*)(0x57000000 + 0x00))
#define PCIE_STATUS_REG    ((volatile uint32_t*)(0x57000000 + 0x04))

int pcie_initialize_link(void) {
    // 1. Reset the PCIe controller & LTSSM state machine
    *PCIE_CTRL_REG = (1 << 1); 
    for(volatile int i=0; i<1000; i++); // simple delay stub
    
    // 2. Enable LTSSM link training at Gen2 speed
    *PCIE_CTRL_REG = (1 << 0) | (1 << 2); 
    
    // 3. Poll status register until LTSSM enters L0 state (Bit [3] == 1)
    uint32_t status;
    int timeout = 50000;
    while (timeout--) {
        status = *PCIE_STATUS_REG;
        if (status & (1 << 3)) {
            // Link is actively in L0 state
            return 0; // Success
        }
    }
    return -1; // Link Training Timeout
}
```

---

## 3. USB 2.0 OTG Controller Driver

The USB block manages host-to-device transactions utilizing a standard UTMI+ transceiver bus interface.

### Endpoint Initialization Sequence

1.  **Reset Controller**: Write `0x01` to `USB_RESET_REG`.
2.  **Configure Transceiver**: Select high-speed mode by setting Bit [5] in `USB_CFG_REG` (enables J/K state detection).
3.  **Setup DMA Buffers**: Configure input and output endpoint descriptor memory blocks to execute zero-overhead hardware packet transfers.
4.  **Poll Interrupts**: Handle setup tokens, handshake packets (ACK/NAK), and transfer-complete interrupts.

---

## 4. HDMI 1.4 Transmitter & DMA Frame Buffer

The HDMI Display Controller features a high-performance DMA reader that continuously sweeps the internal frame buffer memory and feeds an active TMDS serialization pipeline.

### Resolution & Timing Configuration

To output standard **640x480 @ 60Hz** video format, write the parameters to the HDMI control core:

```c
#define HDMI_FB_BASE       ((volatile uint32_t*)(0x58000000 + 0x00))
#define HDMI_HTIMINGS      ((volatile uint32_t*)(0x58000000 + 0x04))
#define HDMI_VTIMINGS      ((volatile uint32_t*)(0x58000000 + 0x08))
#define HDMI_CTRL          ((volatile uint32_t*)(0x58000000 + 0x0C))

void hdmi_start_display(uint32_t *frame_buffer) {
    // 1. Set Frame Buffer physical start address
    *HDMI_FB_BASE = (uint32_t)frame_buffer;
    
    // 2. Set horizontal timings: active=640, front_porch=16, sync=96, back_porch=48
    *HDMI_HTIMINGS = (640 << 16) | (16 << 12) | (96 << 6) | 48;
    
    // 3. Set vertical timings: active=480, front_porch=10, sync=2, back_porch=33
    *HDMI_VTIMINGS = (480 << 16) | (10 << 12) | (2 << 6) | 33;
    
    // 4. Enable display DMA core & output serialization
    *HDMI_CTRL = 1; 
}
```
