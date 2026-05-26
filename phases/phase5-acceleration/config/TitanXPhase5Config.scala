// SMVDU-TITAN-X Phase 5 Chipyard SoC Configuration
//
// Defines custom Rocket-based SoC configuration for Phase 5:
//   - Single RV64GC Rocket Core
//   - Custom RoCC Systolic Array ML Coprocessor registered
//   - Inclusive Shared L2 Cache (TileLink-C)
//   - GPIO mapped at 0x54010000 (from Phase 2)
//   - SPI Flash mapped at 0x10030000 (from Phase 2)
//
// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

package chipyard

import org.chipsalliance.cde.config.{Config, Parameters}
import freechips.rocketchip.tile._
import freechips.rocketchip.diplomacy._

// Custom RoCC configuration trait for SMVDU-TITAN-X Systolic Array ML Coprocessor
class WithSystolicMLCoprocessor extends Config((site, here, up) => {
  case BuildRoCC => Seq(
    (p: Parameters) => {
      val ml_coproc = LazyModule(new SystolicArrayCoprocessor(Opcode(0))(p))
      ml_coproc
    }
  )
})

class TitanXPhase5Config extends Config(
  new WithSystolicMLCoprocessor ++                                                     // Custom RoCC Systolic Array
  new freechips.rocketchip.subsystem.WithInclusiveCache ++                             // Coherent L2 Cache
  new chipyard.config.WithGPIO(address = 0x54010000, width = 32) ++                    // GPIO Controller
  new chipyard.config.WithSPIFlash(address = 0x10030000, fAddress = 0x20000000) ++     // SPI Flash Controller
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++                                 // Single RISC-V Rocket Core
  new chipyard.config.AbstractConfig                                                   // baseline system
)
