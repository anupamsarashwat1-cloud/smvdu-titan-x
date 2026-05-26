// SMVDU-TITAN-X Chipyard Configuration
// 
// This file defines Chipyard SoC configurations for different project phases.
// Place in: chipyard/generators/smvdu-titan-x/src/main/scala/
//
// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

package smvdu.titan.x

import org.chipsalliance.cde.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.rocket._
import chipyard._

// ─────────────────────────────────────────────────────────────────────────────
// Phase 1: Single Rocket Core — Bare Metal Bring-Up
// ─────────────────────────────────────────────────────────────────────────────
class TitanXPhase1Config extends Config(
  // Single Rocket core, RV64GC
  new WithNBigCores(1) ++
  // Peripheral configuration
  new WithNUARTs(1) ++
  // Default peripherals (GPIO, SPI, etc.)
  new chipyard.config.AbstractConfig
)

// ─────────────────────────────────────────────────────────────────────────────
// Phase 2: Single Core + Linux Boot
// ─────────────────────────────────────────────────────────────────────────────
class TitanXPhase2Config extends Config(
  // Single Rocket core, RV64GC, with FPU
  new WithNBigCores(1) ++
  new WithFPU ++
  // DDR + Linux boot requires MMU, which Rocket has by default
  new WithNUARTs(2) ++
  new chipyard.config.AbstractConfig
)

// ─────────────────────────────────────────────────────────────────────────────
// Phase 3: Quad-Core SMP
// ─────────────────────────────────────────────────────────────────────────────
class TitanXPhase3Config extends Config(
  // Quad-core Rocket, shared L2 via InclusiveCache
  new WithNBigCores(4) ++
  new WithFPU ++
  // Shared L2 cache: 512KB, 8-way set associative
  new freechips.rocketchip.subsystem.WithInclusiveCache(
    nWays = 8,
    capacityKB = 512
  ) ++
  new WithNUARTs(2) ++
  new chipyard.config.AbstractConfig
)

// ─────────────────────────────────────────────────────────────────────────────
// Phase 3b: Out-of-Order BOOM Core Configuration
// ─────────────────────────────────────────────────────────────────────────────
class TitanXBOOMConfig extends Config(
  // MediumBOOM: 2-wide out-of-order, RV64GC
  new boom.common.WithNMediumBooms(1) ++
  new WithFPU ++
  new WithNUARTs(2) ++
  new chipyard.config.AbstractConfig
)

// ─────────────────────────────────────────────────────────────────────────────
// FPGA Target Configuration (Resource-Constrained)
// ─────────────────────────────────────────────────────────────────────────────
class TitanXFPGAConfig extends Config(
  // Small Rocket for FPGA (reduced cache sizes)
  new WithNSmallCores(1) ++
  new WithNUARTs(1) ++
  // Reduce FPU for FPGA area
  new WithoutFPU ++
  new chipyard.config.AbstractConfig
)

// ─────────────────────────────────────────────────────────────────────────────
// Simulation Configuration (Fast Sim, Small Caches)
// ─────────────────────────────────────────────────────────────────────────────
class TitanXSimConfig extends Config(
  new WithNSmallCores(1) ++
  new WithNUARTs(1) ++
  new chipyard.config.AbstractConfig
)
