#!/bin/bash
# =============================================================================
# SMVDU TITAN-X SoC — Physical Layout Viewer (KLayout & Magic VLSI)
# Technology : OSU018 180nm
# Usage      : bash open_layout.sh [--klayout | --magic]
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
DELIVERY_DIR="$REPO_ROOT/asic/ASIC through Open Source tools/delivery"
GDS_FILE="$DELIVERY_DIR/titan_x_top.gds"
MAG_FILE="$DELIVERY_DIR/titan_x_top.mag"
TECH="/usr/local/share/qflow/tech/osu018/SCN6M_SUBM.10.tech"

echo "============================================================"
# Clean rendering of technology header
echo "  SMVDU TITAN-X SoC — Physical Layout Viewer"
echo "  Technology: OSU018 180nm"
echo "============================================================"
echo ""
echo "  GDS Database : $GDS_FILE"
echo "  MAG Database : $MAG_FILE"
echo ""

# Parse command line argument
VIEWER=""
if [ "$1" == "--klayout" ] || [ "$1" == "-k" ]; then
    VIEWER="klayout"
elif [ "$1" == "--magic" ] || [ "$1" == "-m" ]; then
    VIEWER="magic"
fi

# If no argument is provided, prompt the user elegantly
if [ -z "$VIEWER" ]; then
    echo "  Select Layout Viewer:"
    echo "  1) KLayout (Recommended — High performance, full cell details) [Default]"
    echo "  2) Magic VLSI (Traditional CAD editor)"
    echo ""
    read -t 6 -p "  Enter choice [1-2] (auto-selects 1 in 6s): " CHOICE
    
    if [ "$CHOICE" == "2" ]; then
        VIEWER="magic"
    else
        VIEWER="klayout"
    fi
fi

if [ "$VIEWER" == "klayout" ]; then
    echo ""
    echo "[KLayout] Launching KLayout viewer in the background..."
    echo "          * Press 'F2' to Zoom to Fit"
    echo "          * Press '*' (asterisk) to fully expand cell hierarchy"
    echo "          * Toggle layers in the right-side Layers Panel"
    echo ""
    klayout "$GDS_FILE" -l "$DELIVERY_DIR/titan_x_top.lyp" &
    exit 0
fi

# Magic VLSI execution flow
if [ "$VIEWER" == "magic" ]; then
    # Step 1: Convert GDS to native .mag format (batch/headless mode)
    if [ ! -f "$MAG_FILE" ] || [ "$GDS_FILE" -nt "$MAG_FILE" ]; then
        echo "[Magic] Converting GDS → native .mag format (headless mode)..."
        magic -noconsole -nowindow -T "$TECH" << MAGICCMDS
gds read "$GDS_FILE"
load titan_x_top
cd "$DELIVERY_DIR"
writeall force
quit
MAGICCMDS
        echo "[Magic] Conversion done. MAG file: $MAG_FILE"
    else
        echo "[Magic] Skipping conversion — .mag file is up to date."
    fi

    echo ""
    echo "[Magic] Opening layout in Magic VLSI GUI..."
    echo "        * In the tkcon console, type: expand  (to expand subcells)"
    echo "        * Press 'v' in the layout window to zoom to fit"
    echo ""

    # Step 2: Open the native .mag file directly in Magic GUI
    cd "$REPO_ROOT"
    magic -T "$TECH" "$DELIVERY_DIR/titan_x_top"
fi