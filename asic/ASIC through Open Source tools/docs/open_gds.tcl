# SMVDU TITAN-X SoC — Magic VLSI GDS Viewer Startup Script
# NOTE: This file is now superseded by open_layout.sh which uses the reliable
# GDS->MAG batch conversion approach. Kept for reference only.
#
# The correct way to view the layout is:
#   bash "asic/ASIC through Open Source tools/docs/open_layout.sh"
#
# Or directly:
#   Step 1 (one-time): magic -noconsole -nowindow -T <tech> < convert_gds.tcl
#   Step 2 (view):     magic -T <tech> "delivery/titan_x_top"
