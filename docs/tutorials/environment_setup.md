# Environment Setup Tutorial

## Overview

This tutorial will set up your SMVDU-TITAN-X development environment from scratch on Ubuntu 22.04 or 24.04 LTS.

**Time required:** ~1–2 hours (mostly download/build time)

---

## System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| OS | Ubuntu 22.04 LTS | Ubuntu 24.04 LTS |
| CPU | 4 cores | 8+ cores |
| RAM | 16 GB | 32 GB |
| Disk | 100 GB free | 200 GB SSD |
| Internet | Required | Fast connection |

---

## Step 1: Clone the Repository

```bash
git clone --recursive https://github.com/your-org/smvdu-titan-x.git
cd smvdu-titan-x
```

!!! tip "Submodule Tip"
    The `--recursive` flag initializes all submodules. If you cloned without it:
    ```bash
    git submodule update --init --recursive
    ```

---

## Step 2: Install System Dependencies

```bash
sudo bash scripts/setup/install_deps.sh
```

This installs:

- Build tools (gcc, cmake, autoconf, etc.)
- Java 17 + SBT (for Chisel/Chipyard)
- Verilator (RTL simulator)
- Python 3 + pip packages (cocotb, LiteX)
- QEMU RISC-V (for software stack testing)
- GTKWave (waveform viewer)

---

## Step 3: Install RISC-V GCC Toolchain

```bash
bash scripts/setup/setup_riscv_toolchain.sh
source ~/.bashrc
```

Verify:

```bash
riscv64-unknown-elf-gcc --version
# riscv64-unknown-elf-gcc (GCC) 14.x.x ...
```

---

## Step 4: Build Phase 1 Firmware

```bash
cd software/firmware/hello_uart
make
make disasm   # Optional: view disassembly
```

Output:

```
  AS      main.S
  LD      build/hello_uart.elf

build/hello_uart.elf  :
section             size      addr
.text.init           ...  0x1000
.text                ...
...

  HEX     build/hello_uart.hex
  BIN     build/hello_uart.bin
```

---

## Step 5: Run Verilator Lint

```bash
bash scripts/sim/run_verilator.sh --lint-only
```

---

## Step 6: Set Up Chipyard (Longer Step)

```bash
bash scripts/setup/setup_chipyard.sh
```

!!! warning "Time Warning"
    Chipyard setup, including submodule initialization and conda environment creation, can take **30–60 minutes** depending on your internet speed and CPU.

After Chipyard is set up:

```bash
conda activate chipyard
cd hardware/chipyard
make -C sims/verilator CONFIG=smvdu.titan.x.TitanXSimConfig
```

---

## Step 7: (Optional) Set Up LiteX for Rapid FPGA Prototyping

```bash
bash scripts/setup/setup_litex.sh

# Test LiteX target
python3 fpga/litex_targets/arty_a7/titan_x_litex.py --help
```

---

## Step 8: View Documentation Locally

```bash
pip install mkdocs-material
mkdocs serve
# Open: http://127.0.0.1:8000
```

---

## Environment Variables Summary

After setup, your `~/.bashrc` should contain:

```bash
# RISC-V Toolchain
export RISCV="/opt/riscv"
export PATH="$RISCV/bin:$PATH"

# Chipyard (if installed)
# conda activate chipyard
```

---

## Troubleshooting

### "command not found: riscv64-unknown-elf-gcc"
```bash
source ~/.bashrc
# Or reload the shell:
exec bash
```

### Chipyard conda env not found
```bash
conda env list
# If chipyard env missing:
cd hardware/chipyard
conda env create -f environment.yml
```

### Verilator version too old
Chipyard requires Verilator ≥ 4.226. Install from source if needed:
```bash
# See: https://verilator.org/guide/latest/install.html
```

---

## Next Steps

- [Chipyard Setup](chipyard_setup.md) — Deep dive into Chipyard configuration
- [First Simulation](first_simulation.md) — Run your first RTL simulation
- [FPGA Deployment](fpga_deployment.md) — Program your FPGA board
