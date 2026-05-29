#!/bin/bash
# =============================================================================
# SMVDU TITAN-X SoC — Magic VLSI Layout Viewer
# Technology : OSU018 180nm (scmos-compatible)
# Usage      : bash open_layout.sh
# =============================================================================
#
# IMPORTANT: This script uses the two-step approach to avoid a Magic VLSI bug:
#
#   During startup, `gds read` triggers a cell-load that updates the window
#   titlebar widget. But the Tk widget '.magic1.titlebar.caption' does not
#   exist yet at script-sourcing time, causing:
#       Error: invalid command name '.titlebar.caption'
#   This error aborts the startup script and leaves a blank gray canvas.
#
#   SOLUTION: Convert GDS → native .mag format in headless batch mode FIRST,
#   then open the .mag file directly (no gds read during GUI startup).
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
DELIVERY_DIR="$REPO_ROOT/asic/ASIC through Open Source tools/delivery"
GDS_FILE="$DELIVERY_DIR/titan_x_top.gds"
MAG_FILE="$DELIVERY_DIR/titan_x_top.mag"
TECH="/usr/local/share/qflow/tech/osu018/SCN6M_SUBM.10.tech"

echo "============================================================"
echo "  SMVDU TITAN-X SoC — Magic VLSI Layout Viewer"
echo "  Technology: OSU018 180nm"
echo "============================================================"
echo ""
echo "  GDS source : $GDS_FILE"
echo "  MAG output : $MAG_FILE"
echo "  Tech file  : $TECH"
echo ""

# Step 1: Convert GDS to native .mag format (batch/headless mode)
if [ ! -f "$MAG_FILE" ] || [ "$GDS_FILE" -nt "$MAG_FILE" ]; then
    echo "[Step 1] Converting GDS → native .mag format (batch mode)..."
    magic -noconsole -nowindow -T "$TECH" << MAGICCMDS
gds read "$GDS_FILE"
load titan_x_top
cd "$DELIVERY_DIR"
writeall force
quit
MAGICCMDS
    echo "[Step 1] Done. MAG file: $MAG_FILE"
else
    echo "[Step 1] Skipping conversion — .mag file is up to date."
fi

echo ""
echo "[Step 2] Opening layout in Magic VLSI GUI..."
echo "         In the tkcon console, type: expand  (to expand subcells)"
echo "         Press 'v' in the layout window to zoom to fit"
echo ""

# Step 2: Open the native .mag file directly in Magic GUI
# This avoids the 'gds read' startup crash completely
cd "$REPO_ROOT"
magic -T "$TECH" "$DELIVERY_DIR/titan_x_top"