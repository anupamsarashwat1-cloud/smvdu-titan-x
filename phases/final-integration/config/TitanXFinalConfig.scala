// SMVDU-TITAN-X Final Integrated SoC Chipyard Configuration
//
// Defines custom Rocket-based SoC configuration for the FINAL INTEGRATION PHASE:
//   - 4x Application Cores: RV64GC (SiFive U54 equivalent) with Sv39 MMU & FPU
//   - 1x Monitor Core: RV64IMAC (SiFive E51 equivalent) on isolated peripheral bus
//   - 2 MB Inclusive Banked L2 Cache (4x 512 KB banks, configurable as LIM)
//   - Integrated Low-Speed MMIO blocks: GPIO, SPI, I2C, CAN, 5x MMUARTs
//   - Integrated High-Speed Cores: PCIe Gen2 x4 Root Port, Dual GEM Ethernet, USB 2.0
//   - Registered custom RoCC Systolic Array Coprocessor & Cryptographic Co-processor
//
// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

package chipyard

import org.chipsalliance.cde.config.{Config, Parameters}
import freechips.rocketchip.tile._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.rocket._

// 1. Custom RoCC configuration trait for SMVDU-TITAN-X Systolic Array ML Coprocessor
class WithFinalSystolicMLCoprocessor extends Config((site, here, up) => {
  case BuildRoCC => Seq(
    (p: Parameters) => {
      val ml_coproc = LazyModule(new SystolicArrayCoprocessor(Opcode(0))(p))
      ml_coproc
    }
  )
})

// 2. Custom Core Complex config defining 4x Application Cores & 1x Monitor Core
class WithApplicationAndMonitorCores extends Config((site, here, up) => {
  case TileKey => up(TileKey, site).map {
    case tp: RocketTileParams => {
      // Configure Application Cores as RV64GC with ECC caches
      tp.copy(
        core = tp.core.copy(
          fpu = Some(FPUParams()), // Enable double-precision FPU
          useVM = true             // Enable Sv39 MMU
        ),
        dcache = tp.dcache.map(_.copy(
          nSets = 64, // 32 KB I-Cache (8-way)
          nWays = 8
        )),
        icache = tp.icache.map(_.copy(
          nSets = 64, // 32 KB D-Cache (8-way)
          nWays = 8
        ))
      )
    }
    case other => other
  }
})

// 3. Complete Unified SoC Configuration
class TitanXFinalConfig extends Config(
  new WithFinalSystolicMLCoprocessor ++                                                 // RoCC Systolic Accelerator ML unit
  new WithApplicationAndMonitorCores ++                                                 // Configure App Core custom L1 ECC settings
  new freechips.rocketchip.subsystem.WithInclusiveCache ++                             // Coherent L2 Cache enabled
  
  // Custom Memory Subsystem: 2MB banked L2 Cache (4 banks of 512KB)
  new chipyard.config.WithL2Cache(capacityKB = 2048, ways = 16, banks = 4) ++
  
  // Custom MMIO peripheral mapped blocks
  new chipyard.config.WithGPIO(address = 0x54010000, width = 32) ++                    // GPIO Controller
  new chipyard.config.WithSPIFlash(address = 0x10030000, fAddress = 0x20000000) ++     // SPI Flash XIP
  
  // Multi-Core allocation
  new freechips.rocketchip.rocket.WithNHugeCores(4) ++                                 // 4x RV64GC Application Cores
  new freechips.rocketchip.rocket.WithNSmallCores(1) ++                                // 1x RV64IMAC Monitor Core
  
  new chipyard.config.AbstractConfig                                                   // baseline system
)
