# Phase 1 Hello UART — Bare-Metal RISC-V Assembly
# 
# Boots on SMVDU-TITAN-X, initializes UART, prints "Hello from SMVDU-TITAN-X!"
# then enters an infinite loop (LED heartbeat).
#
# Target ISA: RISC-V RV64GC (assembled with riscv64-unknown-elf-as)
# Entry point: 0x00001000 (Boot ROM base)
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors

# ─── Memory Map Constants ─────────────────────────────────────────────────────
# SiFive UART (Chipyard default)
.equ UART0_BASE,        0x10020000
.equ UART_TXDATA,       0x00        # TX Data (bit 31 = full)
.equ UART_RXDATA,       0x04        # RX Data (bit 31 = empty)
.equ UART_TXCTRL,       0x08        # TX Control (bit 0 = enable)
.equ UART_RXCTRL,       0x0C        # RX Control (bit 0 = enable)
.equ UART_IE,           0x10        # Interrupt enable
.equ UART_IP,           0x14        # Interrupt pending
.equ UART_DIV,          0x18        # Baud rate divisor
.equ UART_TXFULL_BIT,   31          # TX FIFO full = bit 31 of txdata

# CLINT (standard RISC-V)
.equ MTIME_BASE,        0x02000000  # CLINT mtime
.equ MTIMECMP_BASE,     0x02004000  # CLINT mtimecmp

# ─── Baud Rate Divisor ───────────────────────────────────────────────────────
# UART baud rate divisor = sys_clk / baud_rate - 1
# For 500 MHz clock and 115200 baud: 500000000 / 115200 - 1 = 4339
# (Chipyard default bus frequency is 500 MHz)
.equ BAUD_DIV,          4339

# ─── Sections ────────────────────────────────────────────────────────────────
    .section .text.init, "ax", @progbits
    .globl _start
    .type  _start, @function

# ─────────────────────────────────────────────────────────────────────────────
# Entry Point — _start
# ─────────────────────────────────────────────────────────────────────────────
_start:
    # ── Disable all interrupts at machine level ──────────────────────────
    csrw    mie, zero
    csrw    mstatus, zero

    # ── Set stack pointer (grows downward from top of SRAM) ──────────────
    la      sp, _stack_top

    # ── Clear BSS segment ────────────────────────────────────────────────
    la      a0, _bss_start
    la      a1, _bss_end
    beq     a0, a1, .Lbss_done
.Lbss_loop:
    sd      zero, 0(a0)
    addi    a0, a0, 8
    blt     a0, a1, .Lbss_loop
.Lbss_done:

    # ── Initialize UART ──────────────────────────────────────────────────
    call    uart_init

    # ── Print boot banner ────────────────────────────────────────────────
    la      a0, msg_banner
    call    uart_puts
    la      a0, msg_phase1
    call    uart_puts
    la      a0, msg_core
    call    uart_puts
    la      a0, msg_freq
    call    uart_puts
    la      a0, msg_ready
    call    uart_puts

    # ── Simulation exit via HTIF tohost ──────────────────────────────────
    # In Verilator simulation, writing 1 to tohost signals success.
    # On real hardware, this would enter the heartbeat loop instead.
    la      t0, tohost
    li      t1, 1              # exit code 0 = success (encoded as 1)
    sd      t1, 0(t0)

    # ── Main loop: heartbeat (reached on real hardware) ──────────────────
.Lmain_loop:
    # Simple delay loop (~0.5s at 500 MHz)
    li      t2, 250000000
.Ldelay:
    addi    t2, t2, -1
    bnez    t2, .Ldelay

    j       .Lmain_loop

# ─────────────────────────────────────────────────────────────────────────────
# uart_init — Initialize UART0 for 115200 baud, 8N1
# ─────────────────────────────────────────────────────────────────────────────
    .type uart_init, @function
uart_init:
    li      t0, UART0_BASE
    # Set baud rate divisor
    li      t1, BAUD_DIV
    sw      t1, UART_DIV(t0)
    # Enable TX (bit 0) and RX (bit 0) in control registers
    li      t1, 0x1
    sw      t1, UART_TXCTRL(t0)
    sw      t1, UART_RXCTRL(t0)
    ret

# ─────────────────────────────────────────────────────────────────────────────
# uart_putc — Send single character in a0
# ─────────────────────────────────────────────────────────────────────────────
    .type uart_putc, @function
uart_putc:
    li      t0, UART0_BASE
.Lwait_tx:
    lw      t1, UART_TXDATA(t0)    # Read txdata register
    bltz    t1, .Lwait_tx           # Bit 31 set = FIFO full, retry
    sw      a0, UART_TXDATA(t0)     # Write character
    ret

# ─────────────────────────────────────────────────────────────────────────────
# uart_puts — Print null-terminated string at address in a0
# ─────────────────────────────────────────────────────────────────────────────
    .type uart_puts, @function
uart_puts:
    addi    sp, sp, -16
    sd      ra, 8(sp)
    sd      s0, 0(sp)
    mv      s0, a0              # s0 = string pointer
.Lputc_loop:
    lbu     a0, 0(s0)           # Load byte
    beqz    a0, .Lputc_done     # If null terminator, done
    call    uart_putc
    addi    s0, s0, 1
    j       .Lputc_loop
.Lputc_done:
    ld      ra, 8(sp)
    ld      s0, 0(sp)
    addi    sp, sp, 16
    ret

# ─────────────────────────────────────────────────────────────────────────────
# Read-Only Data — Boot Messages
# ─────────────────────────────────────────────────────────────────────────────
    .section .rodata
    .align 2

msg_banner:
    .ascii "\r\n"
    .ascii "  ========================================\r\n"
    .ascii "  |        SMVDU-TITAN-X  v0.1.0         |\r\n"
    .ascii "  |   RISC-V RV64GC Open-Source SoC      |\r\n"
    .ascii "  ========================================\r\n"
    .string "\r\n"

msg_phase1:
    .string "  [PHASE 1] Bare-Metal Bring-Up\r\n\0"

msg_core:
    .string "  Core:  Rocket RV64GC (Single Core)\r\n\0"

msg_freq:
    .string "  Clock: 500 MHz (Chipyard default)\r\n\0"

msg_ready:
    .ascii "  UART0 initialized at 115200 baud\r\n"
    .string "\r\n  SMVDU-TITAN-X ready!\r\n"

# ─────────────────────────────────────────────────────────────────────────────
# BSS Section
# ─────────────────────────────────────────────────────────────────────────────
    .section .bss
    .align 3
_bss_start:
    .space 4096
_bss_end:

# ─────────────────────────────────────────────────────────────────────────────
# Stack (8KB)
# ─────────────────────────────────────────────────────────────────────────────
    .section .stack, "aw", @nobits
    .align 3
    .globl _stack_bottom
_stack_bottom:
    .space 8192
    .globl _stack_top
_stack_top:

# ─────────────────────────────────────────────────────────────────────────────
# HTIF (Host-Target Interface for simulation)
# ─────────────────────────────────────────────────────────────────────────────
    .section .tohost, "aw", @progbits
    .globl tohost
    .globl fromhost
    .align 3
tohost:   .dword 0
fromhost: .dword 0

