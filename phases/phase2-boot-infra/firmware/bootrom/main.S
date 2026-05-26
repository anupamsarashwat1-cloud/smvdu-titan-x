# SMVDU-TITAN-X — Phase 2 BootROM Bootstrap Code
#
# M-Mode entry point on power-on reset. Sets stack, handles core id traps,
# and jumps execution immediately to the DDR DRAM base (0x80000000).
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors

.section .text.start
.global _start

_start:
    # 1. Disable interrupts and clear status registers
    csrw mie, zero
    csrw mip, zero

    # 2. Obtain current Hart ID
    csrr a0, mhartid
    
    # Only Hart 0 proceeds; other cores wait for soft interrupts (SMP boot)
    bnez a0, .smp_wait

    # 3. Establish early stack pointer (top of SRAM/scratchpad)
    li sp, 0x08000000 + 0x00010000 # 64KB early stack offset

    # 4. Jump execution to the main DRAM boot area
    li t0, 0x80000000             # DDR Main base address
    jr t0

.smp_wait:
    # Core loop for secondary cores in Phase 3
    wfi
    j .smp_wait
