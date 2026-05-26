# SMVDU-TITAN-X — Phase 2: Boot ROM and Bootloader Firmware

This directory contains the stubs and source code for the Phase 2 first-stage bootloader and OpenSBI platform build integrations.

---

## Folders & Files

*   `bootrom/`: Contains the first-stage BootROM assembly code.
    *   [`main.S`](bootrom/main.S): Handles early reset vectors, sets the program counter, initializes the early CPU hart state, and jumps execution directly to the DDR memory space (`0x8000_0000`).
    *   [`Makefile`](bootrom/Makefile): Compiles the assembly BootROM code to raw hexadecimal format ready for Chisel generator BRAM initialization.
*   `README.md`: This file.

---

## OpenSBI Integration

The official platform-specific configuration headers for the **OpenSBI** runtime are maintained in your orchestrator codebase at [`software/opensbi/platform/smvdu_titan_x/platform.h`](../../../software/opensbi/platform/smvdu_titan_x/platform.h).

To compile OpenSBI for SMVDU-TITAN-X:
1.  Initialize the OpenSBI upstream submodule:
    ```bash
    git submodule update --init --recursive software/opensbi_src
    ```
2.  Symlink our platform directory:
    ```bash
    ln -s $(pwd)/../../../software/opensbi/platform/smvdu_titan_x $(pwd)/../../../software/opensbi_src/platform/smvdu_titan_x
    ```
3.  Compile:
    ```bash
    make -C ../../../software/opensbi_src PLATFORM=smvdu_titan_x CROSS_COMPILE=riscv64-unknown-elf-
    ```
