// SMVDU-TITAN-X Phase 5 Chipyard SoC Configuration
//
// Single Rocket core RV64GC with custom RoCC Systolic Array coprocessor.
//
// SPDX-License-Identifier: Apache-2.0

package chipyard

import org.chipsalliance.cde.config.{Config}

class TitanXPhase5Config extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++         // Rocket core
  new chipyard.config.AbstractConfig)
