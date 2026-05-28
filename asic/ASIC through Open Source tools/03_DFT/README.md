# Step 03: DFT Scan-Chain Insertion

This directory contains the DFT (Design For Testability) scan-chain insertion step for the **SMVDU-TITAN-X SoC** structural netlist.

## 🎯 Step Description
DFT scan-chain insertion converts standard sequential elements into test-capable scan flip-flops and daisy-chains them to form a shift register. This allows external tester equipment (ATE) to shift in arbitrary test vectors, execute a single clock cycle, and shift out the resulting state to detect physical silicon faults (stuck-at, transition faults).

Due to the bottom-up hierarchical synthesis flow, the top-level wrapper `titan_x_top` is purely structural wiring and contains no registers itself. The actual design flip-flops are located within leaf submodules and mid-level blocks (which are read as library blackboxes during top wrapper elaboration).

To perform a real and electrically correct DFT insertion:
1. We target **8 real, synthesizable `DFFSR` flip-flop instances** (`_552_` to `_591_`) inside the instantiated `u_axi2ahb` (AXI4-to-AHB bridge) submodule.
2. We add three top-level DFT ports (`scan_in`, `scan_enable`, `scan_out`) to the SoC top wrapper `titan_x_top`.
3. We route these three ports down to the instantiated `u_axi2ahb` block.
4. Inside the `axi4_to_ahb` submodule definition, we declare the new port directions.
5. For each of the 8 flip-flops, we intercept their original `.D()` inputs with a standard cell 2-to-1 multiplexer (`MUX2X1`), controlled by `scan_enable`, to select between functional data and scan-in data (the `Q` output of the preceding register).
6. The Q output of the final register (`s_wready`) is assigned to drive the `scan_out` port.

---

## 📋 Inputs and Outputs Checklist

### Input Files (`Input_Files/`)
* **`titan_x_synth_netlist.v`**: Structural stitched gate-level netlist generated in Step 04.
* **`insert_dft.py`**: Python script to parse the structural netlist, construct the MUXes, daisy-chain the registers, and write the netlist.
* **`clean_netlist.py`**: Python post-processor script that removes redundant wire declarations (e.g. `wire port_name;` duplicate definitions) to make the resulting netlist 100% compliant with standard SystemVerilog compilers.

### Output Files (`Output_Files/`)
* **`titan_x_dft_netlist.v`**: The final, functional gate-level netlist with the 8-register scan chain successfully stitched and routed to top-level ports.

---

## 🔗 Scan Chain Route

The daisy chain routes as follows:
`scan_in` ➔ `_552_` ➔ `_553_` ➔ `_554_` ➔ `_555_` ➔ `_556_` ➔ `_557_` ➔ `_558_` ➔ `_591_` ➔ `scan_out`

| Instance Name | Original D net | Scan-In Source | Q Output (Scan Out) | MUX Output Wire |
| :--- | :--- | :--- | :--- | :--- |
| **`_552_`** | `_001_` | `scan_in` | `bstate[0]` | `dft_mux_out_552` |
| **`_553_`** | `_002_` | `bstate[0]` | `bstate[1]` | `dft_mux_out_553` |
| **`_554_`** | `_003_` | `bstate[1]` | `htrans[1]` | `dft_mux_out_554` |
| **`_555_`** | `_004_` | `htrans[1]` | `s_arready` | `dft_mux_out_555` |
| **`_556_`** | `_000_` | `s_arready` | `s_bvalid` | `dft_mux_out_556` |
| **`_557_`** | `_005_` | `s_bvalid` | `s_awready` | `dft_mux_out_557` |
| **`_558_`** | `_275_` | `s_awready` | `s_rvalid` | `dft_mux_out_558` |
| **`_591_`** | `_038_` | `s_rvalid` | `s_wready` | `dft_mux_out_591` |

---

## 🚀 Execution Commands
```bash
python3 titan_x_soc/03_DFT/insert_dft.py
python3 titan_x_soc/03_DFT/clean_netlist.py
```

---

## 📈 Key Results & Metrics
* **Scan Insertion Status**: **SUCCESSFUL** (Exit Code 0).
* **Scan Chain Length**: 8 flip-flops daisy-chained.
* **MUX Cell Instantiated**: 8 instances of `MUX2X1`.
* **Silicon Compliance**: Verified that the SystemVerilog netlist builds cleanly with standard parsers without redundant port wire conflicts.
