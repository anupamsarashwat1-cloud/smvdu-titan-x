#!/usr/bin/env python3
"""
SMVDU-TITAN-X LiteX Target — Arty A7-35T / A7-100T
Rapid prototyping configuration for FPGA bring-up before Chipyard integration.

Usage:
    python3 titan_x_litex.py --board=arty_a7 --cpu-type=vexriscv --build
    python3 titan_x_litex.py --board=arty_a7 --cpu-type=vexriscv --load

Requirements:
    pip install litex litedram liteeth litescope

SPDX-License-Identifier: Apache-2.0
Copyright (c) 2025 SMVDU-TITAN-X Contributors
"""

import argparse
import sys

from migen import *
from litex.soc.cores.clock import *
from litex.soc.cores.cpu import CPUS
from litex.soc.cores.uart import UARTWishboneBridge
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores.led import LedChaser
from litex.soc.cores.gpio import GPIOOut

# ─── SMVDU-TITAN-X Memory Map ────────────────────────────────────────────────
# Matches hardware/rtl/top/memory_map.md
TITAN_X_MEM_MAP = {
    "rom":   (0x00001000, 0x10000),     # 64 KB Boot ROM
    "sram":  (0x08000000, 0x4000000),   # 64 MB SRAM/BRAM
    "ddr":   (0x80000000, 0x80000000),  # 2 GB DDR (Phase 2+)
}

TITAN_X_IO_MAP = {
    "uart0":   0x54000000,
    "gpio":    0x54010000,
    "spi0":    0x54020000,
    "timer":   0x54040000,
    "plic":    0x0C000000,
    "clint":   0x02000000,
}


class _CRG(Module):
    """Clock and Reset Generator for Arty A7"""

    def __init__(self, platform, sys_clk_freq):
        self.rst = Signal()
        self.clock_domains.cd_sys = ClockDomain()

        # ── MMCM: 12 MHz input → sys_clk_freq output ────────────────────
        self.submodules.pll = pll = S7MMCM(speedgrade=-1)
        self.comb += pll.reset.eq(~platform.request("cpu_reset") | self.rst)
        pll.register_clkin(platform.request("clk100"), 100e6)
        pll.create_clkout(self.cd_sys, sys_clk_freq)
        platform.add_false_path_constraints(
            self.cd_sys.clk
        )


class TitanXSoC(SoCCore):
    """
    SMVDU-TITAN-X LiteX SoC
    
    Phase 1 FPGA prototype targeting Arty A7.
    Uses VexRiscv (fast compile) or Rocket (closer to target) depending on --cpu-type.
    """

    def __init__(self, platform, sys_clk_freq=int(100e6), cpu_type="vexriscv",
                 with_ethernet=False, with_sdcard=False, **kwargs):

        # ── SoC Core init ────────────────────────────────────────────────
        SoCCore.__init__(
            self,
            platform,
            sys_clk_freq,
            ident="SMVDU-TITAN-X Phase 1 LiteX Prototype",
            ident_version=True,
            cpu_type=cpu_type,
            cpu_variant="standard" if cpu_type == "vexriscv" else "default",
            integrated_rom_size=0x10000,    # 64 KB ROM
            integrated_sram_size=0x10000,   # 64 KB SRAM (expandable)
            uart_name="serial",
            **kwargs
        )

        # ── Clock/Reset Generator ────────────────────────────────────────
        self.submodules.crg = _CRG(platform, sys_clk_freq)

        # ── LED Chaser (heartbeat) ───────────────────────────────────────
        self.submodules.leds = LedChaser(
            pads=platform.request_all("user_led"),
            sys_clk_freq=sys_clk_freq
        )

        # ── Optional: Ethernet (Phase 4) ─────────────────────────────────
        if with_ethernet:
            from liteeth.phy.mii import LiteEthPHYMII
            from liteeth.core import LiteEthUDPIPCore
            self.submodules.ethphy = LiteEthPHYMII(
                clock_pads=platform.request("eth_clocks"),
                pads=platform.request("eth")
            )
            self.add_csr("ethphy")

        # ── Optional: SD Card (Phase 4) ───────────────────────────────────
        if with_sdcard:
            self.add_sdcard()


def main():
    parser = argparse.ArgumentParser(
        description="SMVDU-TITAN-X LiteX FPGA Build Script",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Build for Arty A7-35T with VexRiscv (fast)
  python3 titan_x_litex.py --board=arty_a7 --cpu-type=vexriscv --build

  # Build and program
  python3 titan_x_litex.py --board=arty_a7 --cpu-type=vexriscv --build --load

  # Interactive simulation
  python3 titan_x_litex.py --board=arty_a7 --cpu-type=vexriscv --sim
        """
    )

    # Board selection
    parser.add_argument("--board", default="arty_a7",
                        choices=["arty_a7", "genesys2", "nexys_a7"],
                        help="Target FPGA board (default: arty_a7)")

    # CPU selection
    parser.add_argument("--cpu-type", default="vexriscv",
                        choices=["vexriscv", "rocket", "cva6", "picorv32"],
                        help="CPU core type (default: vexriscv for fast iteration)")

    # Clock frequency
    parser.add_argument("--sys-clk-freq", default=100e6, type=float,
                        help="System clock frequency in Hz (default: 100MHz)")

    # Options
    parser.add_argument("--with-ethernet", action="store_true",
                        help="Include Ethernet MAC (Phase 4)")
    parser.add_argument("--with-sdcard", action="store_true",
                        help="Include SD card interface (Phase 4)")

    # Build actions
    parser.add_argument("--build", action="store_true", help="Build bitstream")
    parser.add_argument("--load", action="store_true", help="Program FPGA")
    parser.add_argument("--sim", action="store_true", help="Run simulation")

    args = parser.parse_args()

    # ── Platform selection ────────────────────────────────────────────────
    if args.board == "arty_a7":
        from litex_boards.platforms import digilent_arty as platform_module
        platform = platform_module.Platform(variant="a7-35")
    elif args.board == "genesys2":
        from litex_boards.platforms import digilent_genesys2 as platform_module
        platform = platform_module.Platform()
    else:
        print(f"Board '{args.board}' not yet supported. Add support in titan_x_litex.py")
        sys.exit(1)

    # ── Build SoC ────────────────────────────────────────────────────────
    soc = TitanXSoC(
        platform=platform,
        sys_clk_freq=int(args.sys_clk_freq),
        cpu_type=args.cpu_type,
        with_ethernet=args.with_ethernet,
        with_sdcard=args.with_sdcard,
    )

    # ── Builder ──────────────────────────────────────────────────────────
    builder = Builder(
        soc,
        output_dir="build",
        compile_software=args.build,
        compile_gateware=args.build,
    )

    builder.build(
        run=args.build,
        with_bios=True,
    )

    if args.load:
        prog = soc.platform.create_programmer()
        prog.load_bitstream(builder.get_bitstream_filename(mode="sram"))

    print("\n" + "="*60)
    print("  SMVDU-TITAN-X LiteX Build Complete")
    print(f"  Board:  {args.board}")
    print(f"  CPU:    {args.cpu_type}")
    print(f"  Clock:  {args.sys_clk_freq/1e6:.0f} MHz")
    print("="*60 + "\n")


if __name__ == "__main__":
    main()
