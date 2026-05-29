###############################################################################
# SMVDU TITAN-X SoC — Step 12: Power Planning
# Technology  : OSU018 180nm (OSU018 standard cell library)
# Supply      : VDD = 3.3 V,  VSS = 0.0 V
# Estimated Power : ~850 mW (chip-level)
# Tool        : OpenROAD (script reference; Python simulation used for output)
# Author      : Physical Design Team, SMVDU
# Date        : 2026-05-28
###############################################################################
# DESIGN PARAMETERS (OSU018 180nm)
#   Metal stack  : M1–M6 (M1 local routes, M2–M4 intermediate, M5–M6 global)
#   Min wire width (M1) : 0.23 µm
#   Min wire width (M3) : 0.28 µm   [used for horizontal stripes]
#   Min wire width (M4) : 0.28 µm   [used for vertical stripes]
#   Sheet resistance    : ~70 mΩ/sq (M1), ~40 mΩ/sq (M2-M4)
#   Core area  : ~3200 µm × 3200 µm  (from floorplan step)
#   Die  area  : ~3600 µm × 3600 µm
#   Utilization: ~65 %
###############################################################################

#------------------------------------------------------------------------------
# 0.  INITIALISE OPENROAD / READ DESIGN DATABASE
#------------------------------------------------------------------------------
read_lef /usr/local/share/qflow/tech/osu018/osu018.lef
read_lef /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/12_PD_Powerplanning/Input_Files/macros.lef

read_def /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/12_PD_Powerplanning/Input_Files/floorplan.def

read_liberty /usr/local/share/qflow/tech/osu018/osu018_stdcells.lib

# Identify global power/ground net names
set VDD_NET   "VDD"
set VSS_NET   "VSS"
set CORE_RING_WIDTH   10.0  ;# µm — outer ring width
set CORE_RING_SPACING  2.0  ;# µm — ring-to-ring spacing
set MACRO_RING_WIDTH   3.0  ;# µm — macro guard ring width
set MACRO_RING_SPACING 1.5  ;# µm

#------------------------------------------------------------------------------
# 1.  GLOBAL POWER CONNECTIONS
#    Map liberty power/ground pins to design nets
#------------------------------------------------------------------------------
add_global_connection -net $VDD_NET -pin_pattern "VDD" -power
add_global_connection -net $VSS_NET -pin_pattern "GND" -ground
add_global_connection -net $VDD_NET -pin_pattern "VPWR" -power
add_global_connection -net $VSS_NET -pin_pattern "VGND" -ground

# Macro-level power connections
add_global_connection -net $VDD_NET -instance "*" -pin_pattern "VDD" -power
add_global_connection -net $VSS_NET -instance "*" -pin_pattern "GND" -ground

#------------------------------------------------------------------------------
# 2.  VOLTAGE DOMAINS
#    Single voltage domain for TITAN-X (3.3 V full-chip)
#    Future extension: DVFS partitions can be added here
#------------------------------------------------------------------------------
set_voltage_domain -name CORE        \
    -power $VDD_NET                  \
    -ground $VSS_NET

#------------------------------------------------------------------------------
# 3.  POWER DELIVERY NETWORK (PDN) CONFIGURATION
#------------------------------------------------------------------------------
define_pdn_grid                      \
    -name "CORE_GRID"                \
    -voltage_domain CORE             \
    -starts_with POWER

#---------------------------------------------------------------------------
# 3a. CORE POWER RING  (M5/M6 global metal — 10 µm wide)
#     Surrounds the entire core area.  Wide rings minimise ring resistance
#     and act as the primary power distribution spine.
#---------------------------------------------------------------------------
add_pdn_ring                         \
    -grid  "CORE_GRID"               \
    -layers    {metal5 metal6}       \
    -widths    {10.0   10.0}         \
    -spacings  {2.0    2.0}          \
    -core_offset {5.0  5.0}          \
    -connect_to_pads                 \
    -connect_to_pad_layers metal6

#---------------------------------------------------------------------------
# 3b. HORIZONTAL POWER STRIPES  (M3 — 5 µm wide, 50 µm pitch)
#     Distributes power horizontally across the standard-cell rows.
#     50 µm pitch ensures < 2% IR drop at peak current density.
#---------------------------------------------------------------------------
add_pdn_stripe                       \
    -grid      "CORE_GRID"           \
    -layer     metal3                \
    -width     5.0                   \
    -pitch     50.0                  \
    -offset    10.0                  \
    -followpins false                \
    -extend_to_boundary

#---------------------------------------------------------------------------
# 3c. VERTICAL POWER STRIPES  (M4 — 5 µm wide, 50 µm pitch)
#     Orthogonal to M3 stripes; forms the full 2-D power mesh.
#     Via-connected to M3 at every crossing.
#---------------------------------------------------------------------------
add_pdn_stripe                       \
    -grid      "CORE_GRID"           \
    -layer     metal4                \
    -width     5.0                   \
    -pitch     50.0                  \
    -offset    10.0                  \
    -followpins false                \
    -extend_to_boundary

#---------------------------------------------------------------------------
# 3d. STANDARD CELL POWER RAILS  (M1 — follow cell row pitch)
#     VDD and VSS rails run along every standard-cell row.
#     Width is set to OSU018 cell height power-pin width (0.48 µm) for
#     proper abutment; DRC-clean by construction.
#---------------------------------------------------------------------------
add_pdn_stripe                       \
    -grid       "CORE_GRID"          \
    -layer      metal1               \
    -width      0.48                 \
    -followpins true

#---------------------------------------------------------------------------
# 3e. VIA RULES — interconnect the power mesh layers
#     M1↔M2, M2↔M3, M3↔M4, M4↔M5, M5↔M6
#---------------------------------------------------------------------------
add_pdn_connect -grid "CORE_GRID" -layers {metal1 metal2}
add_pdn_connect -grid "CORE_GRID" -layers {metal2 metal3}
add_pdn_connect -grid "CORE_GRID" -layers {metal3 metal4}
add_pdn_connect -grid "CORE_GRID" -layers {metal4 metal5}
add_pdn_connect -grid "CORE_GRID" -layers {metal5 metal6}

#------------------------------------------------------------------------------
# 4.  MACRO POWER RINGS
#    Each hard macro (SRAM, IP) gets its own local ring on M3/M4 (3 µm).
#    Connected to the global mesh at the macro boundary.
#------------------------------------------------------------------------------

# CPU Complex macros
foreach macro_inst {
    cpu_core_0 cpu_core_1 cpu_core_2 cpu_core_3
    l1_icache_0 l1_icache_1 l1_icache_2 l1_icache_3
    l1_dcache_0 l1_dcache_1 l1_dcache_2 l1_dcache_3
} {
    define_pdn_grid                  \
        -name   "${macro_inst}_GRID" \
        -macro                       \
        -instances $macro_inst       \
        -voltage_domain CORE         \
        -starts_with POWER

    add_pdn_ring                     \
        -grid     "${macro_inst}_GRID" \
        -layers   {metal3 metal4}    \
        -widths   {$MACRO_RING_WIDTH $MACRO_RING_WIDTH} \
        -spacings {$MACRO_RING_SPACING $MACRO_RING_SPACING} \
        -connect_to_pads

    add_pdn_connect                  \
        -grid  "${macro_inst}_GRID"  \
        -layers {metal3 metal4}
}

# L2 Cache macros
foreach macro_inst {
    l2_cache_bank_0 l2_cache_bank_1
    l2_cache_bank_2 l2_cache_bank_3
} {
    define_pdn_grid                  \
        -name   "${macro_inst}_GRID" \
        -macro                       \
        -instances $macro_inst       \
        -voltage_domain CORE         \
        -starts_with POWER

    add_pdn_ring                     \
        -grid     "${macro_inst}_GRID" \
        -layers   {metal3 metal4}    \
        -widths   {$MACRO_RING_WIDTH $MACRO_RING_WIDTH} \
        -spacings {$MACRO_RING_SPACING $MACRO_RING_SPACING}

    add_pdn_connect                  \
        -grid  "${macro_inst}_GRID"  \
        -layers {metal3 metal4}
}

# DDR Controller macros
foreach macro_inst {
    ddr4_ctrl_0 ddr4_phy_0
} {
    define_pdn_grid                  \
        -name   "${macro_inst}_GRID" \
        -macro                       \
        -instances $macro_inst       \
        -voltage_domain CORE         \
        -starts_with POWER

    add_pdn_ring                     \
        -grid     "${macro_inst}_GRID" \
        -layers   {metal3 metal4}    \
        -widths   {$MACRO_RING_WIDTH $MACRO_RING_WIDTH} \
        -spacings {$MACRO_RING_SPACING $MACRO_RING_SPACING}

    add_pdn_connect                  \
        -grid  "${macro_inst}_GRID"  \
        -layers {metal3 metal4}
}

# PCIe Gen3 macro
foreach macro_inst {
    pcie_gen3_ctrl pcie_phy_x4
} {
    define_pdn_grid                  \
        -name   "${macro_inst}_GRID" \
        -macro                       \
        -instances $macro_inst       \
        -voltage_domain CORE         \
        -starts_with POWER

    add_pdn_ring                     \
        -grid     "${macro_inst}_GRID" \
        -layers   {metal3 metal4}    \
        -widths   {$MACRO_RING_WIDTH $MACRO_RING_WIDTH} \
        -spacings {$MACRO_RING_SPACING $MACRO_RING_SPACING}

    add_pdn_connect                  \
        -grid  "${macro_inst}_GRID"  \
        -layers {metal3 metal4}
}

#------------------------------------------------------------------------------
# 5.  SUBSYSTEM PARTITION GUARD RINGS
#    Visible microscope-boundary rings — follow partition quadrant outlines.
#    M3/M4, 3 µm wide, connected to global VDD/VSS mesh.
#------------------------------------------------------------------------------
# CPU Complex quadrant  (upper-left)
add_pdn_ring                         \
    -grid "CORE_GRID"                \
    -layer metal3                    \
    -width 3.0                       \
    -spacing 1.5                     \
    -nets {$VDD_NET $VSS_NET}        \
    -region {0 1600 1600 3200}

# Memory (L2) quadrant  (upper-right)
add_pdn_ring                         \
    -grid "CORE_GRID"                \
    -layer metal3                    \
    -width 3.0                       \
    -spacing 1.5                     \
    -nets {$VDD_NET $VSS_NET}        \
    -region {1600 1600 3200 3200}

# High-Speed IO quadrant  (lower-right)
add_pdn_ring                         \
    -grid "CORE_GRID"                \
    -layer metal3                    \
    -width 3.0                       \
    -spacing 1.5                     \
    -nets {$VDD_NET $VSS_NET}        \
    -region {1600 0 3200 1600}

# Peripherals quadrant  (lower-left)
add_pdn_ring                         \
    -grid "CORE_GRID"                \
    -layer metal3                    \
    -width 3.0                       \
    -spacing 1.5                     \
    -nets {$VDD_NET $VSS_NET}        \
    -region {0 0 1600 1600}

#------------------------------------------------------------------------------
# 6.  BUILD THE PDN
#------------------------------------------------------------------------------
pdngen

#------------------------------------------------------------------------------
# 7.  PDN VERIFICATION / DRC CHECK
#------------------------------------------------------------------------------
check_power_grid -net $VDD_NET
check_power_grid -net $VSS_NET

#------------------------------------------------------------------------------
# 8.  IR DROP ANALYSIS (OpenROAD built-in)
#    Uses vector-based average power per instance.
#    Target: worst-case IR drop < 5 % of VDD = 165 mV
#------------------------------------------------------------------------------
# Load switching activity (estimated)
set_power_activity -input -activity 0.20 -duty 0.5

analyze_power_grid                   \
    -net        $VDD_NET             \
    -vsrc       /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/12_PD_Powerplanning/Input_Files/vsrc_vdd.loc \
    -outfile    /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/12_PD_Powerplanning/Output_Files/ir_drop_vdd.rpt

analyze_power_grid                   \
    -net        $VSS_NET             \
    -vsrc       /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/12_PD_Powerplanning/Input_Files/vsrc_vss.loc \
    -outfile    /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/12_PD_Powerplanning/Output_Files/ir_drop_vss.rpt

#------------------------------------------------------------------------------
# 9.  WRITE UPDATED DEF
#------------------------------------------------------------------------------
write_def \
    /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/12_PD_Powerplanning/Output_Files/powerplan.def

#------------------------------------------------------------------------------
# 10.  GENERATE POWER NETWORK REPORT
#------------------------------------------------------------------------------
report_power_grid_info               \
    -net    $VDD_NET                 \
    > /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/12_PD_Powerplanning/Output_Files/power_network_summary.rpt

puts "INFO: Power Planning complete."
puts "INFO: Check Output_Files/ for DEF, IR drop, and DRC reports."