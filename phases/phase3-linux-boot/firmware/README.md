# SMVDU-TITAN-X — Phase 3: Software and Linux Boot Configuration

This directory outlines the customized software configurations and Device Tree (DTS) parameters required to boot the Linux supervisor kernel in Symmetric Multiprocessing (SMP) mode on the Quad-Core SMVDU-TITAN-X SoC.

---

## 1. Unified Software Stack Mappings

The boot flow executes as follows:
```
[Power-On Reset]
      │
      ▼
[10KB BootROM]  → Executes bootstrap and jumps to SPI Flash/DDR
      │
      ▼
[OpenSBI]      → Machine-Mode runtime (Hart initialization & SBI traps)
      │
      ▼
[U-Boot]       → Supervisor-Mode bootloader (Initializes SD card storage)
      │
      ▼
[Linux Kernel] → Boots multi-user environment and mounts BusyBox rootfs
```

---

## 2. Devicetree (DTS) Specifications

To boot the Linux kernel, the generated Device Tree Blob (DTB) must specify:
*   **CPUs**: 4 coherent harts with `device_type = "cpu"`, `compatible = "riscv"`, and `riscv,isa = "rv64imafdc"`.
*   **PLIC**: Platform-Level Interrupt Controller mapped at `0x0C00_0000`.
*   **CLINT**: Core-Local Interrupt Controller mapped at `0x0200_0000` with 4 timer interrupt channels.
*   **UART**: Mapped at `0x1002_0000` (SiFive UART default).
*   **LiteETH**: Gigabit Ethernet MAC mapped at `0x5500_0000`.
*   **DRAM Memory**: Reg mapped to DRAM base address: `<0x80000000 0x80000000>` (2 GB size).

---

## 3. Kernel and Rootfs Compilation

### Step A: U-Boot Board Config
Compile U-Boot Board configuration targeting the `smvdu_titan_x` layout:
```bash
make smvdu_titan_x_defconfig
make CROSS_COMPILE=riscv64-unknown-elf- -j$(nproc)
```

### Step B: Linux Kernel 6.x
Compile the kernel targeting the `defconfig` parameters:
```bash
cd software/linux_src
make ARCH=riscv smvdu_titan_x_defconfig
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-elf- Image -j$(nproc)
```

### Step C: BusyBox Rootfs
Configure and build BusyBox:
```bash
cd software/buildroot_src
make busybox-menuconfig
make CROSS_COMPILE=riscv64-unknown-elf- -j$(nproc)
```
