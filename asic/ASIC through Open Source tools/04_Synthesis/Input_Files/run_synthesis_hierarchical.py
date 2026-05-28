#!/usr/bin/env python3
# run_synthesis_hierarchical.py
# Hierarchical bottom-up synthesis wrapper to synthesize the TITAN-X SoC submodules
# individually to avoid Out-Of-Memory (OOM) failures on low-RAM systems.

import os
import subprocess
import sys

# Define base paths
WORKSPACE_DIR = "/home/anupam-sarashwat/Documents/antigravity/cool-hawking"
SOC_DIR = f"{WORKSPACE_DIR}/titan_x_soc"
SYNTH_DIR = f"{SOC_DIR}/04_Synthesis"
SUBMODULES_DIR = f"{SYNTH_DIR}/submodules_synth"
RTL_DIR = f"{SOC_DIR}/01_RTL_Design/Input_Files/rtl"
LIB_FILE = "/home/anupam-sarashwat/vsdflow/library/osu018_stdcells.lib"

# Define compile order (Level 1: Leaf cells, Level 2: Mid-level blocks, Level 3: Complexes, Level 4: Top wrapper)
submodules = [
    # --- LEVEL 1: LEAF MODULES ---
    {
        "name": "reset_sync",
        "sources": [f"{RTL_DIR}/common/reset_sync.v"],
        "dependencies": []
    },
    {
        "name": "cdc_sync",
        "sources": [f"{RTL_DIR}/common/cdc_sync.v"],
        "dependencies": []
    },
    {
        "name": "fifo_sync",
        "sources": [f"{RTL_DIR}/common/fifo_sync.v"],
        "dependencies": []
    },
    {
        "name": "fifo_async",
        "sources": [f"{RTL_DIR}/common/fifo_async.v"],
        "dependencies": [
            "reset_sync",
            "cdc_sync"
        ]
    },
    {
        "name": "rv_fetch",
        "sources": [f"{RTL_DIR}/cpu_complex/rv_core/rv_fetch.v"],
        "dependencies": []
    },
    {
        "name": "rv_decode",
        "sources": [f"{RTL_DIR}/cpu_complex/rv_core/rv_decode.v"],
        "dependencies": []
    },
    {
        "name": "rv_execute",
        "sources": [f"{RTL_DIR}/cpu_complex/rv_core/rv_execute.v"],
        "dependencies": []
    },
    {
        "name": "rv_mem",
        "sources": [f"{RTL_DIR}/cpu_complex/rv_core/rv_mem.v"],
        "dependencies": []
    },
    {
        "name": "rv_writeback",
        "sources": [f"{RTL_DIR}/cpu_complex/rv_core/rv_writeback.v"],
        "dependencies": []
    },
    {
        "name": "clint",
        "sources": [f"{RTL_DIR}/cpu_complex/clint.v"],
        "dependencies": []
    },
    {
        "name": "plic",
        "sources": [f"{RTL_DIR}/cpu_complex/plic.v"],
        "dependencies": []
    },
    {
        "name": "l2_tag_array",
        "sources": [f"{RTL_DIR}/memory_subsystem/l2_tag_array.v"],
        "dependencies": []
    },
    {
        "name": "l2_data_array",
        "sources": [
            f"{RTL_DIR}/memory_subsystem/l2_data_array.v"
        ],
        "dependencies": [],
        "use_sram_lib": True
    },
    {
        "name": "l2_cache_ctrl",
        "sources": [f"{RTL_DIR}/memory_subsystem/l2_cache_ctrl.v"],
        "dependencies": []
    },
    {
        "name": "ddr_phy_if",
        "sources": [f"{RTL_DIR}/memory_subsystem/ddr_ctrl/ddr_phy_if.v"],
        "dependencies": []
    },
    {
        "name": "ddr_scheduler",
        "sources": [f"{RTL_DIR}/memory_subsystem/ddr_ctrl/ddr_scheduler.v"],
        "dependencies": []
    },
    {
        "name": "axi4_crossbar",
        "sources": [f"{RTL_DIR}/interconnect/axi4_crossbar.v"],
        "dependencies": []
    },
    {
        "name": "axi4_to_ahb",
        "sources": [f"{RTL_DIR}/interconnect/axi4_to_ahb.v"],
        "dependencies": []
    },
    {
        "name": "ahb_to_apb",
        "sources": [f"{RTL_DIR}/interconnect/ahb_to_apb.v"],
        "dependencies": []
    },
    {
        "name": "pcie_top",
        "sources": [f"{RTL_DIR}/pcie/pcie_top.v"],
        "dependencies": []
    },
    {
        "name": "gem_ethernet",
        "sources": [f"{RTL_DIR}/ethernet/gem_ethernet.v"],
        "dependencies": []
    },
    {
        "name": "gpio_ctrl",
        "sources": [f"{RTL_DIR}/peripherals/gpio_ctrl.v"],
        "dependencies": []
    },
    {
        "name": "spi_master",
        "sources": [f"{RTL_DIR}/peripherals/spi_master.v"],
        "dependencies": []
    },
    {
        "name": "i2c_master",
        "sources": [f"{RTL_DIR}/peripherals/i2c_master.v"],
        "dependencies": []
    },
    {
        "name": "watchdog_timer",
        "sources": [f"{RTL_DIR}/peripherals/watchdog_timer.v"],
        "dependencies": []
    },
    {
        "name": "aes_engine",
        "sources": [f"{RTL_DIR}/security/aes_engine.v"],
        "dependencies": []
    },
    {
        "name": "sha256_engine",
        "sources": [f"{RTL_DIR}/security/sha256_engine.v"],
        "dependencies": []
    },
    {
        "name": "trng",
        "sources": [f"{RTL_DIR}/security/trng.v"],
        "dependencies": []
    },
    
    # --- LEVEL 2: MID-LEVEL BLOCKS ---
    {
        "name": "rv_core_top",
        "sources": [f"{RTL_DIR}/cpu_complex/rv_core/rv_core_top.v"],
        "dependencies": [
            "rv_fetch",
            "rv_decode",
            "rv_execute",
            "rv_mem",
            "rv_writeback"
        ]
    },
    {
        "name": "l2_cache_top",
        "sources": [f"{RTL_DIR}/memory_subsystem/l2_cache_top.v"],
        "dependencies": [
            "l2_tag_array",
            "l2_data_array",
            "l2_cache_ctrl"
        ]
    },
    {
        "name": "ddr_ctrl_top",
        "sources": [f"{RTL_DIR}/memory_subsystem/ddr_ctrl/ddr_ctrl_top.v"],
        "dependencies": [
            "ddr_phy_if",
            "ddr_scheduler"
        ]
    },
    {
        "name": "uart_16550",
        "sources": [f"{RTL_DIR}/peripherals/uart_16550.v"],
        "dependencies": []
    },
    
    # --- LEVEL 3: COMPLEXES ---
    {
        "name": "cpu_complex_top",
        "sources": [f"{RTL_DIR}/cpu_complex/cpu_complex_top.v"],
        "dependencies": [
            "rv_core_top",
            "clint",
            "plic"
        ]
    }
]

def synthesize_module(module):
    name = module["name"]
    print(f"=== Synthesizing Submodule: {name} ===")
    
    tcl_script_path = f"{SYNTH_DIR}/temp_synth_{name}.tcl"
    netlist_out = f"{SUBMODULES_DIR}/{name}_synth.v"
    
    with open(tcl_script_path, "w") as f:
        # 1. Read SRAM macro as library stub if requested
        if module.get("use_sram_lib"):
            f.write(f"read_verilog -lib {SOC_DIR}/06_Macro_Generation_Openram/sram_32x64_180nm.v\n")
            
        # 2. Read dependencies (synthesized netlists as library models)
        for dep in module["dependencies"]:
            dep_netlist = f"{SUBMODULES_DIR}/{dep}_synth.v"
            f.write(f"read_verilog -lib {dep_netlist}\n")
            
        # 3. Read module source
        for src in module["sources"]:
            f.write(f"read_verilog {src}\n")
            
        # 4. Elaborate
        f.write(f"hierarchy -top {name}\n")
        
        # 5. Synthesize
        f.write(f"synth -top {name}\n")
        
        # 6. Map FFs and logic
        f.write(f"dfflibmap -liberty {LIB_FILE}\n")
        f.write(f"abc -liberty {LIB_FILE}\n")
        f.write("clean\n")
        
        # 7. Write netlist
        f.write(f"write_verilog -noattr {netlist_out}\n")
        
        # 8. Stats
        f.write(f"stat -liberty {LIB_FILE}\n")
        
    # Execute Yosys
    log_file_path = f"{SYNTH_DIR}/log_synth_{name}.log"
    print(f"  Running Yosys... Log: log_synth_{name}.log")
    
    with open(log_file_path, "w") as log_f:
        res = subprocess.run(["yosys", "-s", tcl_script_path], stdout=log_f, stderr=subprocess.STDOUT)
        
    # Clean up temp TCL script
    if os.path.exists(tcl_script_path):
        os.remove(tcl_script_path)
        
    if res.returncode != 0:
        print(f"  ERROR: Synthesis of submodule {name} failed with code {res.returncode}. Check log.")
        sys.exit(1)
        
    print(f"  Success: Gate-level netlist written to {name}_synth.v")

def synthesize_top():
    print("=== Synthesizing SoC Top Wrapper: titan_x_top ===")
    
    tcl_script_path = f"{SYNTH_DIR}/temp_synth_top.tcl"
    final_netlist_out = f"{SYNTH_DIR}/titan_x_synth_netlist.v"
    
    with open(tcl_script_path, "w") as f:
        # 1. Read SRAM macro as library stub
        f.write(f"read_verilog -lib {SOC_DIR}/06_Macro_Generation_Openram/sram_32x64_180nm.v\n")
        
        # 2. Read ALL synthesized submodules as library/blackbox models
        for module in submodules:
            dep_netlist = f"{SUBMODULES_DIR}/{module['name']}_synth.v"
            f.write(f"read_verilog -lib {dep_netlist}\n")
            
        # 3. Read top-level wrapper source
        f.write(f"read_verilog {RTL_DIR}/titan_x_top.v\n")
        
        # 4. Elaborate top level
        f.write("hierarchy -top titan_x_top\n")
        
        # 5. Synthesize top wrapper (this will only map the wrapper port connections!)
        f.write("synth -top titan_x_top\n")
        
        # 6. Map FFs and logic
        f.write(f"dfflibmap -liberty {LIB_FILE}\n")
        f.write(f"abc -liberty {LIB_FILE}\n")
        f.write("clean\n")
        
        # 7. Write the stitched netlist
        f.write(f"write_verilog -noattr {final_netlist_out}\n")
        
        # 8. Stats
        f.write(f"stat -liberty {LIB_FILE}\n")
        
    # Execute Yosys
    log_file_path = f"{SYNTH_DIR}/synth_top.log"
    print("  Running Yosys for Top-level... Log: synth_top.log")
    
    with open(log_file_path, "w") as log_f:
        res = subprocess.run(["yosys", "-s", tcl_script_path], stdout=log_f, stderr=subprocess.STDOUT)
        
    # Clean up temp TCL script
    if os.path.exists(tcl_script_path):
        os.remove(tcl_script_path)
        
    if res.returncode != 0:
        print(f"  ERROR: Synthesis of Top Wrapper failed with code {res.returncode}. Check log.")
        sys.exit(1)
        
    print(f"  Success: STITCHED Gate-level netlist written to {final_netlist_out}!")

def main():
    print("Starting Hierarchical Bottom-Up Synthesis...")
    
    # 1. Synthesize submodules bottom-up
    for module in submodules:
        synthesize_module(module)
        
    # 2. Synthesize top level and stitch everything together
    synthesize_top()
    
    print("\n=== Hierarchical Bottom-Up Synthesis Complete! ===")

if __name__ == "__main__":
    main()
