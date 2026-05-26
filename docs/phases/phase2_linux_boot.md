# Phase 2: Linux Boot

## Objective

Boot the full Linux software stack (OpenSBI → U-Boot → Linux Kernel → BusyBox) on the SMVDU-TITAN-X, targeting both simulation (QEMU) and FPGA.

**Success Criteria:**  
✅ OpenSBI initializes and transfers control to U-Boot  
✅ U-Boot loads Linux kernel from SD card or memory  
✅ Linux kernel boots to BusyBox shell over UART console  
✅ Basic commands (`ls`, `cat /proc/cpuinfo`) work

---

## Additional Hardware (vs Phase 1)

| Addition | Details |
|----------|---------|
| DDR Controller | LiteDRAM or vendor DRAM IP |
| DDR Memory | 512 MB DDR4 minimum |
| SRAM (boot) | Kept for initial OpenSBI load |

---

## Software Stack

```
BusyBox Shell
     │
Linux Kernel (riscv64, defconfig + titan_x customizations)
     │
OpenSBI (v1.x, generic or smvdu_titan_x platform)
     │
U-Boot (RISC-V port)
     │
SMVDU-TITAN-X Hardware
```

---

## Step-by-Step

### 1. Build RISC-V Linux Toolchain

```bash
# The Linux kernel requires a glibc-based toolchain (not elf/newlib)
# Install riscv64-linux-gnu from Ubuntu packages:
sudo apt-get install gcc-riscv64-linux-gnu

# Or use Buildroot's built-in toolchain
```

### 2. Build OpenSBI

```bash
cd software/opensbi
# Initialize the submodule
git submodule update --init

# Build for SMVDU-TITAN-X platform (custom) or generic (quick start)
# Generic first:
make CROSS_COMPILE=riscv64-unknown-elf- PLATFORM=generic FW_PAYLOAD=n

# With TITAN-X platform (after implementing platform.c):
# make CROSS_COMPILE=riscv64-unknown-elf- \
#      PLATFORM=smvdu_titan_x \
#      FW_PAYLOAD_PATH=../uboot/u-boot.bin
```

### 3. Build U-Boot

```bash
cd software/uboot
git submodule update --init

export ARCH=riscv
export CROSS_COMPILE=riscv64-linux-gnu-

# Use QEMU RISC-V virt config to start
make qemu-riscv64_smode_defconfig
make -j$(nproc)

# Output: u-boot.bin, u-boot.elf
```

### 4. Build Linux Kernel

```bash
cd software/linux
git submodule update --init

export ARCH=riscv
export CROSS_COMPILE=riscv64-linux-gnu-

# Start from TITAN-X defconfig
cp arch/riscv/configs/titan_x_defconfig .config
# Or use: make defconfig

make -j$(nproc)

# Output: arch/riscv/boot/Image
```

### 5. Build BusyBox rootfs with Buildroot

```bash
cd software/buildroot
make titan_x_defconfig
make -j$(nproc)

# Output: output/images/rootfs.cpio.gz
```

### 6. Test in QEMU First

```bash
# Validate full stack in QEMU before FPGA
qemu-system-riscv64 \
    -machine virt \
    -cpu rv64 \
    -m 512M \
    -nographic \
    -bios software/opensbi/build/platform/generic/firmware/fw_jump.elf \
    -kernel software/linux/arch/riscv/boot/Image \
    -append "root=/dev/ram rw console=ttyS0" \
    -initrd software/buildroot/output/images/rootfs.cpio.gz
```

### 7. Deploy to FPGA

- Integrate DDR controller (LiteDRAM or Vivado MIG)
- Load OpenSBI + kernel image to DDR via JTAG or SD card
- Connect serial terminal at 115200 baud
- Power on → observe boot sequence

---

## Device Tree

A minimal device tree for Phase 2 must describe:

```dts
/dts-v1/;

/ {
    #address-cells = <1>;
    #size-cells = <1>;
    compatible = "smvdu,titan-x";
    model = "SMVDU TITAN-X";

    cpus {
        #address-cells = <1>;
        #size-cells = <0>;
        cpu@0 {
            device_type = "cpu";
            reg = <0>;
            status = "okay";
            compatible = "riscv";
            riscv,isa = "rv64imafdc";
            mmu-type = "riscv,sv39";
        };
    };

    memory@80000000 {
        device_type = "memory";
        reg = <0x80000000 0x20000000>; /* 512 MB */
    };

    clint@2000000 {
        compatible = "riscv,clint0";
        interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7>;
        reg = <0x02000000 0x000c0000>;
    };

    plic@c000000 {
        compatible = "sifive,plic-1.0.0";
        reg = <0x0c000000 0x04000000>;
        #interrupt-cells = <1>;
        riscv,ndev = <32>;
    };

    uart@54000000 {
        compatible = "sifive,uart0";
        reg = <0x54000000 0x1000>;
        interrupts = <1>;
        clocks = <&clkc 0>;
    };
};
```

---

## Expected Boot Log

```
OpenSBI v1.x
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name       : SMVDU TITAN-X
...

U-Boot 2024.xx ...

Linux version 6.x.x (riscv64-linux-gnu-gcc ...)
...

Please press Enter to activate this console.

/ # uname -a
Linux titan-x 6.x.x #1 SMP Mon May 26 ... riscv64 GNU/Linux

/ # cat /proc/cpuinfo
processor       : 0
hart            : 0
isa             : rv64imafdc
mmu             : sv39
```

---

## References

- [OpenSBI Documentation](https://github.com/riscv-software-src/opensbi/blob/master/docs/)
- [U-Boot RISC-V](https://docs.u-boot.org/en/latest/board/sifive/)
- [Linux RISC-V boot](https://docs.kernel.org/riscv/boot.html)
- [Chipyard Linux Boot](https://chipyard.readthedocs.io/en/stable/Prototyping/index.html)
