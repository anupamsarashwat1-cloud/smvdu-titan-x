// SMVDU-TITAN-X Phase 3 Chipyard SoC Configuration
//
// Defines custom Rocket-based SoC configuration for Phase 3:
//   - Quad-Core Coherent Rocket Cluster (RV64GC SMP)
//   - Shared Inclusive L2 Cache (TileLink-C)
//   - GPIO mapped at 0x54010000 (from Phase 2)
//   - SPI Flash mapped at 0x10030000 (from Phase 2)
//
// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

package chipyard

import org.chipsalliance.cde.config.{Config}

class TitanXPhase3Config extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache ++                             // Coherent L2 Cache
  new chipyard.config.WithGPIO(address = 0x54010000, width = 32) ++                    // GPIO Controller
  new chipyard.config.WithSPIFlash(address = 0x10030000, fAddress = 0x20000000) ++     // SPI Flash Controller
  new freechips.rocketchip.rocket.WithNHugeCores(4) ++                                 // Quad-Core RISC-V Rocket Core
  new chipyard.config.AbstractConfig                                                   // baseline system
)
