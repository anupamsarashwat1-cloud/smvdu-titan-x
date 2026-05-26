// SMVDU-TITAN-X Phase 2 Chipyard SoC Configuration
//
// Defines custom Rocket-based SoC configuration for Phase 2:
//   - Single RV64GC Rocket Core
//   - SiFive UART console
//   - 32-bit GPIO mapped at 0x54010000
//   - SPI Flash mapped at 0x10030000 (MMIO) and 0x20000000 (XIP area)
//
// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

package chipyard

import org.chipsalliance.cde.config.{Config}

class TitanXPhase2Config extends Config(
  new chipyard.config.WithGPIO(address = 0x54010000, width = 32) ++                  // 32-bit GPIO
  new chipyard.config.WithSPIFlash(address = 0x10030000, fAddress = 0x20000000) ++   // SPI Flash XIP
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++                               // single Rocket core, RV64GC
  new chipyard.config.AbstractConfig                                                 // baseline system
)
