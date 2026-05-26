// SMVDU-TITAN-X Chipyard SoC Configurations
//
// Defines Rocket-based SoC configurations for all project phases.
// The SAME Rocket RV64GC core is used across all phases for consistency.
//
// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

package chipyard

import org.chipsalliance.cde.config.{Config}

// ─────────────────────────────────────────────────────────────────────────────
// Phase 1: Single Rocket RV64GC — Bare Metal Bring-Up
//
// Single Rocket core with UART, JTAG, BootROM, L2 cache.
// AbstractConfig includes: UART @ 0x10020000, SerialTL, SimDRAM, JTAG debug.
// ─────────────────────────────────────────────────────────────────────────────
class TitanXPhase1Config extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++         // single Rocket core, RV64GC
  new chipyard.config.AbstractConfig)                           // full SoC peripherals

// ─────────────────────────────────────────────────────────────────────────────
// Phase 2: Single Core + Linux Boot
//
// Same Rocket core as Phase 1. DDR + OpenSBI/U-Boot for Linux.
// Rocket includes FPU and MMU by default (WithNHugeCores).
// ─────────────────────────────────────────────────────────────────────────────
class TitanXPhase2Config extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  new chipyard.config.AbstractConfig)

// ─────────────────────────────────────────────────────────────────────────────
// Phase 3: Quad-Core SMP
//
// 4× the same Rocket core with shared L2 via InclusiveCache.
// Coherent interconnect (TileLink) handles cache coherency automatically.
// ─────────────────────────────────────────────────────────────────────────────
class TitanXPhase3Config extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(4) ++         // quad-core Rocket
  new chipyard.config.AbstractConfig)

// ─────────────────────────────────────────────────────────────────────────────
// Simulation: Fast sim with TL monitors disabled
// ─────────────────────────────────────────────────────────────────────────────
class TitanXSimConfig extends Config(
  new freechips.rocketchip.subsystem.WithoutTLMonitors ++      // faster simulation
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  new chipyard.config.AbstractConfig)
