/* exit_test linker script — minimal: just .text.init + .tohost */
OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY {
    DRAM (rwx) : ORIGIN = 0x80000000, LENGTH = 256M
}

SECTIONS {
    . = 0x80000000;
    .text.init : ALIGN(64) {
        *(.text.init)
    } > DRAM

    . = 0x80001000;
    .tohost : ALIGN(64) {
        *(.tohost)
    } > DRAM
}
