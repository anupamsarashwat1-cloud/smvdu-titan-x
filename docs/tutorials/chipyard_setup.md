# Chipyard Environment Initialization

The SMVDU-TITAN-X multicore SoC designs utilize the **Chipyard Framework** to build, compile, and configure high-level processor clusters.

---

## 1. Prerequisites

Before setting up Chipyard, ensure your development host satisfies the operating system requirements:

*   **Operating System**: Ubuntu 20.04 LTS / 22.04 LTS or compatible Linux distribution.
*   **Hardware Requirements**:
    *   Minimum 16 GB RAM (32 GB recommended for complex multicore Verilator simulations).
    *   100 GB available disk space.

---

## 2. Setting Up Chipyard

Initialize Chipyard inside the `hardware/` directory of the SMVDU-TITAN-X repository:

```bash
cd hardware/
# Clone submodules if not already cloned
git submodule update --init --recursive

# Run installation script to configure conda packages and tools
./chipyard/scripts/bootstrap.sh
```

---

## 3. Launching the Conda Environment

Chipyard utilizes pre-configured conda lockfiles to manage Scala, SBT, and C++ compilers:

```bash
# Activate conda package managers
source ./chipyard/.conda-env/bin/activate
```

---

## 4. Compiling the RISC-V GNU Toolchain

To compile software binaries, build the standard `riscv64-unknown-elf-gcc` cross-compilers:

```bash
cd chipyard/
# Compile toolchain (takes approx 30-40 mins)
./scripts/build-toolchains.sh riscv-tools
```
