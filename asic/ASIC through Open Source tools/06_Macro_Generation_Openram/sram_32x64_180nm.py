# OpenRAM Configuration for SMVDU-AHO-32
word_size = 32
num_words = 64
num_rw_ports = 1
num_r_ports = 0
num_w_ports = 0
write_size = 8  # 4-bit byte write-mask (32/8 = 4)

# Use the built-in SCMOS 180nm technology
tech_name = "scn4m_subm"

nominal_corner_only = True
output_path = "sram_output"
output_name = "sram_32x64_180nm"
