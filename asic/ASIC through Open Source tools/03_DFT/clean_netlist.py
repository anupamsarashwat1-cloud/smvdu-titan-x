import re

def clean_netlist():
    with open("titan_x_soc/03_DFT/titan_x_dft_netlist.v", "r") as f:
        content = f.read()

    # Find all input, output, inout declarations
    ports_declared = set()
    for match in re.finditer(r"\b(input|output|inout)\s+(?:\[[^\]]+\]\s+)?([A-Za-z0-9_]+);", content):
        ports_declared.add(match.group(2))
    
    # Remove 'wire [width] port_name;' if port_name is in ports_declared
    lines = content.splitlines()
    cleaned_lines = []
    for line in lines:
        match = re.match(r"^\s*wire\s+(?:\[[^\]]+\]\s+)?([A-Za-z0-9_]+);", line)
        if match:
            wire_name = match.group(1)
            if wire_name in ports_declared:
                continue # Skip / Remove this redundant wire declaration
        cleaned_lines.append(line)

    cleaned_content = "\n".join(cleaned_lines)

    with open("titan_x_soc/03_DFT/titan_x_dft_netlist.v", "w") as f:
        f.write(cleaned_content)

    print("Success: Cleaned redundant port wire declarations for SystemVerilog compliance!")

if __name__ == "__main__":
    clean_netlist()
