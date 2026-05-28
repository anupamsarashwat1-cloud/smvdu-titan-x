# Step 07: Macro Integration

This directory contains the structural macro integration step for the **SMVDU-TITAN-X SoC** design.

## 🎯 Step Description
Memory macros (such as the L2 Cache SRAM compiled via OpenRAM) cannot be synthesized using standard cell logic. Instead, they are treated as physical hard blocks (macros) with fixed dimensions, layouts, and pins. 

In this step, we structurally integrate **two banks of `sram_32x64_180nm` memory macros** (each providing a 32-bit word width and 64-word depth block) inside the **L2 Cache Data Array (`l2_data_array.v`)**.

### Pin Mapping Table:
Standard cell logic and controller wires are mapped directly to the OpenRAM physical macro pins:

| SRAM Pin Name | Purpose | Connected Signal in L2 Cache Data Array |
| :--- | :--- | :--- |
| **`clk0`** | Reference Clock | `clk` (System clock) |
| **`csb0`** | Chip Select (Active-low) | `csb0_bank0` / `csb0_bank1` (decoders based on `bank_sel` and `cs`) |
| **`web0`** | Write Enable (Active-low) | `web0` (inverted write enable signal `~we`) |
| **`wmask0`** | Byte-Write Mask (4-bit) | `wmask` (allows selective 8-bit byte modifications) |
| **`addr0`** | 6-bit Address Input | `addr` (selects 1 of the 64 lines) |
| **`din0`** | 32-bit Data Input | `din` (data written during write cycles) |
| **`dout0`** | 32-bit Data Output | `sram_dout_bank0` / `sram_dout_bank1` (routed to the L2 Cache output multiplexer) |

---

## 📋 Inputs and Outputs Checklist

### Input Files (`Input_Files/`)
* **`l2_data_array.v`**: The structural RTL wrapper that defines the two memory banks and implements the bank-selection decoder and the output multiplexer with 1-cycle latency.

### Output Files (`Output_Files/`)
* **`l2_data_array.v`**: The verified synthesizable structural module, ready for synthesis elaboration.

---

## 🔍 Electrical & Physical Sign-Off Compliance
* **No Floating Nets**: In our previous design, the `dout0` pins were left floating, which caused DRC/LVS LVS mismatch errors during physical sign-off. We resolved this by structurally routing `dout0` to the registered output multiplexer. Both macro banks are fully connected, electrically verified, and sign-off clean.
