/* SMVDU-TITAN-X Phase 1 Linker Script
 *
 * Memory layout for bare-metal firmware running in DRAM starting at 0x80000000.
 * Pads every loadable section size to 64 bytes (cache line aligned) to prevent
 * unaligned/partial writes (PutPartial TileLink transactions) during host loading.
 *
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (c) 2025 SMVDU-TITAN-X Contributors
 */

OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
    . = 0x80000000;

    /* ── Boot code: placed at start of DRAM ───────────────────────────── */
    .text.init : {
        KEEP(*(.text.init))
        . = ALIGN(64);
    }

    /* ── Host-Target Interface (HTIF) section ─────────────────────────── */
    . = ALIGN(0x1000);
    .tohost : {
        *(.tohost)
        . = ALIGN(64);
    }

    /* ── Code: placed in DRAM (read-execute) ──────────────────────────── */
    . = ALIGN(0x1000);
    .text : {
        *(.text .text.*)
        . = ALIGN(64);
    }

    /* ── Read-only data: placed in DRAM ───────────────────────────────── */
    .rodata : {
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
        . = ALIGN(64);
    }

    /* ── Initialized data: placed in DRAM ─────────────────────────────── */
    .data : {
        _data_start = .;
        *(.data .data.*)
        *(.sdata .sdata.*)
        _data_end = .;
        . = ALIGN(64);
    }

    /* ── Uninitialized data (BSS) ─────────────────────────────────────── */
    .bss : {
        _bss_start = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
        *(COMMON)
        _bss_end = .;
        . = ALIGN(64);
    }

    /* ── Stack (8KB) ──────────────────────────────────────────────────── */
    .stack : {
        _stack_bottom = .;
        . = . + 8K;
        _stack_top = .;
        . = ALIGN(64);
    }

    /* ── Discard unwanted sections ────────────────────────────────────── */
    /DISCARD/ : {
        *(.comment)
        *(.note.*)
        *(.eh_frame)
        *(.riscv.attributes)
    }
}

PROVIDE(_sram_start = 0x80000000);
PROVIDE(_sram_end   = 0x90000000);
