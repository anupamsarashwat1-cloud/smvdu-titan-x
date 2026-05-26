// SMVDU-TITAN-X OpenSBI Platform Configuration
//
// Platform: SMVDU-TITAN-X (RV64GC, Rocket Core)
// OpenSBI version: 1.x
//
// This file defines platform-specific settings for OpenSBI:
//   - Memory map constants matching hardware/rtl/top/memory_map.md
//   - CLINT and PLIC base addresses
//   - UART console configuration
//
// SPDX-License-Identifier: BSD-2-Clause
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

#ifndef __PLATFORM_H__
#define __PLATFORM_H__

/* ─── Clock ──────────────────────────────────────────────────────────────── */
#define TITAN_X_SYS_CLK_FREQ    100000000UL   /* 100 MHz */

/* ─── Memory Map ─────────────────────────────────────────────────────────── */
#define TITAN_X_BOOTROM_BASE    0x00001000UL
#define TITAN_X_BOOTROM_SIZE    0x0000F000UL   /* 60 KB */

#define TITAN_X_SRAM_BASE       0x08000000UL
#define TITAN_X_SRAM_SIZE       0x04000000UL   /* 64 MB */

#define TITAN_X_DDR_BASE        0x80000000UL
#define TITAN_X_DDR_SIZE        0x80000000UL   /* 2 GB */

/* ─── Core Local Interrupt Controller (CLINT) ────────────────────────────── */
/* Compatible with SiFive CLINT v1.0 / RISC-V ACLINT */
#define TITAN_X_CLINT_BASE      0x02000000UL
#define TITAN_X_CLINT_SIZE      0x000C0000UL   /* 768 KB */

#define TITAN_X_MTIME_OFFSET    0x0000BFF8UL
#define TITAN_X_MTIMECMP_OFFSET 0x00004000UL

/* ─── Platform-Level Interrupt Controller (PLIC) ─────────────────────────── */
/* Compatible with SiFive PLIC v1.0 */
#define TITAN_X_PLIC_BASE       0x0C000000UL
#define TITAN_X_PLIC_SIZE       0x04000000UL   /* 64 MB */
#define TITAN_X_PLIC_NUM_SRCS   32             /* Number of interrupt sources */

/* ─── UART (SiFive UART-compatible) ─────────────────────────────────────── */
#define TITAN_X_UART0_BASE      0x54000000UL
#define TITAN_X_UART0_BAUD      115200UL
#define TITAN_X_UART0_IRQ       1

/* ─── OpenSBI FDT Requirements ───────────────────────────────────────────── */
/* The devicetree (DTS) for OpenSBI must describe:                           */
/*   /cpus/cpu@0 with ISA string "rv64imafdc"                               */
/*   /memory with reg = <TITAN_X_DDR_BASE TITAN_X_DDR_SIZE>                 */
/*   /soc/clint with reg = <TITAN_X_CLINT_BASE TITAN_X_CLINT_SIZE>          */
/*   /soc/interrupt-controller with reg = <TITAN_X_PLIC_BASE>               */
/*   /soc/serial with reg = <TITAN_X_UART0_BASE>                            */

/* ─── CPU Configuration ──────────────────────────────────────────────────── */
#define TITAN_X_NUM_HARTS       1              /* Phase 1: single hart */
#define TITAN_X_HART_STACK_SIZE 8192           /* 8 KB per hart stack  */

/* ─── Boot Configuration ─────────────────────────────────────────────────── */
/* OpenSBI jumps here after initialization */
#define TITAN_X_UBOOT_LOAD_ADDR 0x80200000UL
#define TITAN_X_FDT_ADDR        0x82000000UL

#endif /* __PLATFORM_H__ */
