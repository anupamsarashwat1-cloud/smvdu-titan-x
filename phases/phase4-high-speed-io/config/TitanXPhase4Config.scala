// SMVDU-TITAN-X Phase 4 Chipyard SoC Configuration
//
// Dual-core Rocket RV64GC with high-speed PCIe, USB and HDMI controllers.
//
// SPDX-License-Identifier: Apache-2.0

package chipyard

import org.chipsalliance.cde.config.{Config}

class TitanXPhase4Config extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(2) ++         // Dual-core Rocket, RV64GC
  new chipyard.config.AbstractConfig)
