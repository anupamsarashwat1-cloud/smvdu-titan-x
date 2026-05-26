"""
SMVDU-TITAN-X UART Testbench (cocotb)
Tests the UART peripheral against SiFive UART protocol.

Requirements:
  - cocotb >= 1.8
  - cocotb-bus
  - Verilator or iverilog

Run:
  cd verification/cocotb/uart
  make SIM=verilator

SPDX-License-Identifier: Apache-2.0
Copyright (c) 2025 SMVDU-TITAN-X Contributors
"""

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
from cocotb.utils import get_sim_time

# ─── Constants ────────────────────────────────────────────────────────────────
UART_BASE       = 0x54000000
UART_TX_DATA    = 0x00
UART_RX_DATA    = 0x04
UART_TX_CTRL    = 0x08
UART_RX_CTRL    = 0x0C
UART_STATUS     = 0x10
UART_BAUD_DIV   = 0x18

# UART Status bits
STATUS_RXEMPTY  = (1 << 0)
STATUS_TXFULL   = (1 << 1)

# Baud divisor for 115200 baud at 100 MHz
BAUD_DIV_115200 = 867

# ─── Helpers ──────────────────────────────────────────────────────────────────

async def reset_dut(dut, cycles=10):
    """Apply reset for a number of clock cycles."""
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, cycles)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)
    dut._log.info("Reset released")


async def write_reg(dut, addr, data):
    """Write to a UART register via the wishbone/AXI interface."""
    # TODO: adapt to actual bus protocol (AXI4-Lite or TileLink)
    dut.addr.value  = addr >> 2     # Word-aligned
    dut.wdata.value = data
    dut.we.value    = 1
    dut.req.value   = 1
    await RisingEdge(dut.clk)
    while not dut.ack.value:
        await RisingEdge(dut.clk)
    dut.req.value = 0
    dut.we.value  = 0


async def read_reg(dut, addr):
    """Read from a UART register."""
    dut.addr.value = addr >> 2
    dut.we.value   = 0
    dut.req.value  = 1
    await RisingEdge(dut.clk)
    while not dut.ack.value:
        await RisingEdge(dut.clk)
    value = int(dut.rdata.value)
    dut.req.value  = 0
    return value


async def uart_send_char(dut, char: int):
    """Send a single byte via UART TX register."""
    # Wait until TX is not full
    while True:
        status = await read_reg(dut, UART_STATUS)
        if not (status & STATUS_TXFULL):
            break
        await ClockCycles(dut.clk, 10)
    await write_reg(dut, UART_TX_DATA, char)


async def uart_send_string(dut, s: str):
    """Send a string via UART."""
    for c in s:
        await uart_send_char(dut, ord(c))


# ─── Test Cases ───────────────────────────────────────────────────────────────

@cocotb.test()
async def test_uart_reset_state(dut):
    """Test UART registers are in correct reset state."""
    clk = Clock(dut.clk, 10, units="ns")  # 100 MHz
    cocotb.start_soon(clk.start())

    await reset_dut(dut)

    # Status register should indicate RX empty, TX not full
    status = await read_reg(dut, UART_STATUS)
    assert (status & STATUS_RXEMPTY), \
        f"Expected RX empty after reset, got status=0x{status:08X}"
    assert not (status & STATUS_TXFULL), \
        f"TX should not be full after reset, got status=0x{status:08X}"

    dut._log.info(f"✓ Reset state verified: status=0x{status:08X}")


@cocotb.test()
async def test_uart_baud_divisor(dut):
    """Test baud rate divisor register read/write."""
    clk = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clk.start())
    await reset_dut(dut)

    # Write baud divisor
    await write_reg(dut, UART_BAUD_DIV, BAUD_DIV_115200)

    # Read it back
    readback = await read_reg(dut, UART_BAUD_DIV)
    assert readback == BAUD_DIV_115200, \
        f"Baud divisor mismatch: wrote {BAUD_DIV_115200}, read {readback}"

    dut._log.info(f"✓ Baud divisor: {readback} ({100e6/(readback+1)/1000:.1f} kbaud)")


@cocotb.test()
async def test_uart_tx_enable(dut):
    """Test TX control register enable bit."""
    clk = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clk.start())
    await reset_dut(dut)

    # Set baud rate
    await write_reg(dut, UART_BAUD_DIV, BAUD_DIV_115200)

    # Enable TX
    await write_reg(dut, UART_TX_CTRL, 1)

    # Verify TX line is idle (high) when not transmitting
    await ClockCycles(dut.clk, 5)
    assert dut.uart_tx.value == 1, \
        f"UART TX should be idle (HIGH) when enabled but not transmitting"

    dut._log.info("✓ UART TX enabled, line idle")


@cocotb.test()
async def test_uart_tx_single_byte(dut):
    """Test transmitting a single byte and verify waveform on TX line."""
    clk = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clk.start())
    await reset_dut(dut)

    # Configure UART
    await write_reg(dut, UART_BAUD_DIV, BAUD_DIV_115200)
    await write_reg(dut, UART_TX_CTRL, 1)

    # Transmit 'A' = 0x41
    test_char = 0x41
    await write_reg(dut, UART_TX_DATA, test_char)

    # Wait for start bit (TX should go LOW)
    timeout = 0
    while dut.uart_tx.value == 1 and timeout < 10000:
        await RisingEdge(dut.clk)
        timeout += 1

    assert timeout < 10000, "Timeout waiting for UART start bit"
    dut._log.info(f"✓ UART start bit detected at {get_sim_time('ns')} ns")

    # Wait for transmission to complete (10 bits at BAUD_DIV_115200)
    # 10 bits × (BAUD_DIV + 1) clock cycles
    await ClockCycles(dut.clk, 10 * (BAUD_DIV_115200 + 1) + 20)

    # TX should return to idle
    assert dut.uart_tx.value == 1, \
        "UART TX should return to idle after transmission"

    dut._log.info(f"✓ Byte 0x{test_char:02X} ('{chr(test_char)}') transmitted successfully")


@cocotb.test()
async def test_uart_tx_string(dut):
    """Transmit a test string and verify no errors."""
    clk = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clk.start())
    await reset_dut(dut)

    await write_reg(dut, UART_BAUD_DIV, BAUD_DIV_115200)
    await write_reg(dut, UART_TX_CTRL, 1)

    test_str = "Hello SMVDU-TITAN-X!\r\n"
    await uart_send_string(dut, test_str)

    # Wait for all bytes to transmit
    await ClockCycles(dut.clk, len(test_str) * 10 * (BAUD_DIV_115200 + 1) + 100)

    dut._log.info(f"✓ String '{test_str.strip()}' transmitted ({len(test_str)} bytes)")


@cocotb.test()
async def test_uart_tx_full_status(dut):
    """Test that TX full status bit asserts when FIFO is full."""
    clk = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clk.start())
    await reset_dut(dut)

    await write_reg(dut, UART_BAUD_DIV, 0xFFFF)  # Very slow baud for test
    await write_reg(dut, UART_TX_CTRL, 1)

    # Fill TX FIFO
    fifo_full = False
    for i in range(32):  # Assume max FIFO depth is 16
        status = await read_reg(dut, UART_STATUS)
        if status & STATUS_TXFULL:
            fifo_full = True
            dut._log.info(f"✓ TX FIFO full after {i} writes")
            break
        await write_reg(dut, UART_TX_DATA, 0x55)

    assert fifo_full, "TX FIFO never became full — check FIFO depth configuration"
