// SMVDU-TITAN-X Phase 3 Chipyard SoC Configuration
//
// Quad-core Rocket RV64GC with Inclusive L2 cache and standard peripherals.
//
// SPDX-License-Identifier: Apache-2.0

package chipyard

import org.chipsalliance.cde.config.{Config}

class TitanXPhase3Config extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(4) ++         // Quad-core Rocket, RV64GC
  new chipyard.config.AbstractConfig)
