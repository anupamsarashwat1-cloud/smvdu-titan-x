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
.equ UART0_BASE,        0x54000000
.equ UART_TX_DATA,      0x00        # TX Data register
.equ UART_RX_DATA,      0x04        # RX Data register
.equ UART_TX_CTRL,      0x08        # TX Control
.equ UART_RX_CTRL,      0x0C        # RX Control
.equ UART_STATUS,       0x10        # Status register
.equ UART_BAUD_DIV,     0x18        # Baud rate divisor
.equ UART_STATUS_TXFULL, 0x00000001 # TX FIFO full bit

.equ GPIO_BASE,         0x54010000
.equ GPIO_OUTPUT,       0x00        # GPIO output register
.equ GPIO_OE,           0x04        # GPIO output enable

.equ TIMER_BASE,        0x54040000
.equ MTIME_BASE,        0x02000000  # CLINT mtime
.equ MTIMECMP_BASE,     0x02004000  # CLINT mtimecmp

# ─── Baud Rate Divisor ───────────────────────────────────────────────────────
# UART baud rate divisor = sys_clk / baud_rate - 1
# For 100 MHz clock and 115200 baud: 100000000 / 115200 - 1 = 867
.equ BAUD_DIV,          867

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

    # ── Enable LED[0] (power-on indicator) ───────────────────────────────
    li      t0, GPIO_BASE
    li      t1, 0xF             # LEDs on GPIO[3:0]
    sw      t1, GPIO_OE(t0)     # Set as outputs
    li      t1, 0x1             # LED[0] ON
    sw      t1, GPIO_OUTPUT(t0)

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

    # ── Main loop: heartbeat on LEDs ─────────────────────────────────────
.Lmain_loop:
    # Toggle LED[1] as heartbeat
    li      t0, GPIO_BASE
    lw      t1, GPIO_OUTPUT(t0)
    xori    t1, t1, 0x2         # Toggle bit 1
    sw      t1, GPIO_OUTPUT(t0)

    # Delay loop (~0.5s at 100 MHz)
    li      t2, 50000000
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
    sw      t1, UART_BAUD_DIV(t0)
    # Enable TX (bit 0) and RX (bit 0) in control registers
    li      t1, 0x1
    sw      t1, UART_TX_CTRL(t0)
    sw      t1, UART_RX_CTRL(t0)
    ret

# ─────────────────────────────────────────────────────────────────────────────
# uart_putc — Send single character in a0
# ─────────────────────────────────────────────────────────────────────────────
    .type uart_putc, @function
uart_putc:
    li      t0, UART0_BASE
.Lwait_tx:
    lw      t1, UART_STATUS(t0)
    andi    t1, t1, UART_STATUS_TXFULL
    bnez    t1, .Lwait_tx       # Wait while TX FIFO full
    sw      a0, UART_TX_DATA(t0)
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
    .string "\r\n"
    .string "  ╔═══════════════════════════════════════╗\r\n"
    .string "  ║        SMVDU-TITAN-X  v0.1.0          ║\r\n"
    .string "  ║   RISC-V RV64GC Open-Source SoC       ║\r\n"
    .string "  ╚═══════════════════════════════════════╝\r\n"
    .string "\r\n\0"

msg_phase1:
    .string "  [PHASE 1] Bare-Metal Bring-Up\r\n\0"

msg_core:
    .string "  Core:  Rocket RV64GC (Single Core)\r\n\0"

msg_freq:
    .string "  Clock: 100 MHz\r\n\0"

msg_ready:
    .string "  UART0 initialized at 115200 baud\r\n"
    .string "  LED heartbeat active\r\n"
    .string "\r\n  SMVDU-TITAN-X ready!\r\n\0"

# ─────────────────────────────────────────────────────────────────────────────
# BSS Section
# ─────────────────────────────────────────────────────────────────────────────
    .section .bss
    .align 3
_bss_start:
    .space 4096
_bss_end:

# ─────────────────────────────────────────────────────────────────────────────
# Stack (at top of BRAM — 8KB stack)
# ─────────────────────────────────────────────────────────────────────────────
    .section .stack, "aw", @nobits
    .align 3
    .globl _stack_bottom
_stack_bottom:
    .space 8192
    .globl _stack_top
_stack_top:
