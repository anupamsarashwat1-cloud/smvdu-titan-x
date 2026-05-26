/* SMVDU-TITAN-X Phase 1 Linker Script
 *
 * Memory layout for bare-metal firmware:
 *   - Firmware loads to Boot ROM at 0x00001000
 *   - SRAM at 0x08000000 (64 MB BRAM on FPGA)
 *   - Stack at top of SRAM region
 *
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (c) 2025 SMVDU-TITAN-X Contributors
 */

/* ─── Memory Regions ─────────────────────────────────────────────────────── */
MEMORY
{
    ROM  (rx)  : ORIGIN = 0x00001000, LENGTH = 60K   /* Boot ROM         */
    SRAM (rwx) : ORIGIN = 0x08000000, LENGTH = 64M   /* On-chip BRAM     */
}

/* ─── Entry Point ─────────────────────────────────────────────────────────── */
ENTRY(_start)

/* ─── Section Layout ──────────────────────────────────────────────────────── */
SECTIONS
{
    /* ── Boot code: placed in ROM ─────────────────────────────────────── */
    .text.init : {
        KEEP(*(.text.init))
    } > ROM

    /* ── Code: placed in ROM (read-execute) ────────────────────────────── */
    .text : {
        *(.text .text.*)
    } > ROM

    /* ── Read-only data: placed in ROM ─────────────────────────────────── */
    .rodata : {
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
    } > ROM

    /* ── Initialized data: VMA=SRAM, LMA=ROM ───────────────────────────── */
    .data : AT(ADDR(.rodata) + SIZEOF(.rodata)) {
        _data_start = .;
        *(.data .data.*)
        *(.sdata .sdata.*)
        _data_end = .;
    } > SRAM

    /* ── Uninitialized data (BSS) ───────────────────────────────────────── */
    .bss (NOLOAD) : {
        _bss_start = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
        *(COMMON)
        _bss_end = .;
    } > SRAM

    /* ── Stack (at top of SRAM) ─────────────────────────────────────────── */
    .stack (NOLOAD) : {
        _stack_bottom = .;
        . = . + 8K;
        _stack_top = .;
    } > SRAM

    /* ── Discard unwanted sections ──────────────────────────────────────── */
    /DISCARD/ : {
        *(.comment)
        *(.note.*)
        *(.eh_frame)
        *(.riscv.attributes)
    }
}

/* ─── Symbols used in assembly ────────────────────────────────────────────── */
PROVIDE(_sram_start = ORIGIN(SRAM));
PROVIDE(_sram_end   = ORIGIN(SRAM) + LENGTH(SRAM));
PROVIDE(_rom_start  = ORIGIN(ROM));
PROVIDE(_rom_end    = ORIGIN(ROM)  + LENGTH(ROM));
