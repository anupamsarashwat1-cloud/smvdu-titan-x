// SMVDU-TITAN-X Phase 2 Chipyard SoC Configuration
//
// Single Rocket RV64GC core with SPI Flash, GPIO and UART.
//
// SPDX-License-Identifier: Apache-2.0

package chipyard

import org.chipsalliance.cde.config.{Config}

class TitanXPhase2Config extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++         // single Rocket core, RV64GC
  new chipyard.config.AbstractConfig)                           // standard peripheral set
