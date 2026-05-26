# SMVDU-TITAN-X — Phase 1: Bare-Metal Firmware

This directory contains the baseline bare-metal firmware used to validate the generated Rocket RTL.

---

## Included Programs

### 1. `hello_uart/`
The principal bring-up code. It writes a complete text-banner character-by-character to the UART transmit FIFO.
*   **Memory Origin**: DRAM base address `0x8000_0000`
*   **Linker Section Alignment**: All sections (`.text`, `.data`, `.tohost`) are strictly aligned to 64-byte boundaries (`.align 64`) to avoid TileLink cache protocol violations when SimDRAM executes memory blocks.
*   **Compilation**:
    ```bash
    cd hello_uart
    make
    ```

### 2. `exit_test/`
A quick execution check. It writes an exit code status to the HTIF `tohost` channel mapped at address `0x8000_1000`. The simulator recognizes this event, terminates execution with status code 0, and writes `*** PASSED ***` to standard output.
*   **Compilation**:
    ```bash
    cd exit_test
    make
    ```

---

## Toolchain Setup
To compile RISC-V assembly files, ensure you have the `riscv64-unknown-elf-gcc` cross-compiler on your environment path:
```bash
export PATH=$PATH:/home/anupam-sarashwat/.local/bin
```
