# exit_test — Minimal bare-metal RISC-V test
# Immediately writes tohost=1 (HTIF success) and halts.
# Used to validate Verilator RTL exit path in < 100K cycles.
#
# SPDX-License-Identifier: Apache-2.0

    .section .text.init, "ax", @progbits
    .globl _start
_start:
    csrw    mie, zero
    csrw    mstatus, zero

    # Write tohost = 1 (success)
    la      t0, tohost
    li      t1, 1
    sd      t1, 0(t0)

    # Spin forever (tohost write should have triggered exit)
1:  j       1b

    .section .tohost, "aw", @progbits
    .globl tohost
    .globl fromhost
    .align 3
tohost:   .dword 0
fromhost: .dword 0
