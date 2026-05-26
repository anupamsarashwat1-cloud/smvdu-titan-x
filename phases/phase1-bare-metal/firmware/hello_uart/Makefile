# SMVDU-TITAN-X Phase 1 Firmware Makefile
#
# Builds bare-metal RISC-V assembly firmware for SMVDU-TITAN-X
#
# Usage:
#   make              — Build firmware ELF and HEX
#   make clean        — Clean build artifacts
#   make disasm       — Dump disassembly
#   make sim          — Run in Spike RISC-V ISA simulator
#
# Prerequisites: riscv64-unknown-elf-gcc toolchain on PATH
# Run: bash ../../../scripts/setup/setup_riscv_toolchain.sh
#
# SPDX-License-Identifier: Apache-2.0

# ─── Toolchain ───────────────────────────────────────────────────────────────
CROSS_COMPILE ?= riscv64-unknown-elf-
AS      := $(CROSS_COMPILE)as
LD      := $(CROSS_COMPILE)ld
OBJCOPY := $(CROSS_COMPILE)objcopy
OBJDUMP := $(CROSS_COMPILE)objdump
SIZE    := $(CROSS_COMPILE)size

# ─── Build Configuration ─────────────────────────────────────────────────────
TARGET  := hello_uart
ARCH    := rv64gc
ABI     := lp64d

# ─── Source Files ────────────────────────────────────────────────────────────
SRCS    := main.S
OBJS    := $(SRCS:.S=.o)

# ─── Flags ───────────────────────────────────────────────────────────────────
ASFLAGS := -march=$(ARCH) -mabi=$(ABI) -g
LDFLAGS := -T linker.ld -nostdlib -static -Map=$(TARGET).map

# ─── Build Directory ─────────────────────────────────────────────────────────
BUILD_DIR := build

# ─── Default Target ──────────────────────────────────────────────────────────
.PHONY: all clean disasm sim size

all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

# ─── Compile Assembly ────────────────────────────────────────────────────────
$(BUILD_DIR)/%.o: %.S | $(BUILD_DIR)
	@echo "  AS      $<"
	$(AS) $(ASFLAGS) -o $@ $<

# ─── Link ────────────────────────────────────────────────────────────────────
$(BUILD_DIR)/$(TARGET).elf: $(addprefix $(BUILD_DIR)/, $(OBJS)) linker.ld
	@echo "  LD      $@"
	$(LD) $(LDFLAGS) -o $@ $(addprefix $(BUILD_DIR)/, $(OBJS))
	@echo ""
	$(SIZE) $@

# ─── Generate HEX (for simulation memory loading) ────────────────────────────
$(BUILD_DIR)/$(TARGET).hex: $(BUILD_DIR)/$(TARGET).elf
	@echo "  HEX     $@"
	$(OBJCOPY) -O ihex $< $@

# ─── Generate BIN (for FPGA BRAM programming) ────────────────────────────────
$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	@echo "  BIN     $@"
	$(OBJCOPY) -O binary $< $@

# ─── Create build directory ──────────────────────────────────────────────────
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

# ─── Disassembly ─────────────────────────────────────────────────────────────
disasm: $(BUILD_DIR)/$(TARGET).elf
	@echo "  DISASM  $(BUILD_DIR)/$(TARGET).dis"
	$(OBJDUMP) -d -S $< > $(BUILD_DIR)/$(TARGET).dis
	@echo "  Disassembly written to $(BUILD_DIR)/$(TARGET).dis"

# ─── Size report ─────────────────────────────────────────────────────────────
size: $(BUILD_DIR)/$(TARGET).elf
	$(SIZE) $<

# ─── Spike simulation ────────────────────────────────────────────────────────
# Requires: spike (riscv-isa-sim) on PATH
sim: $(BUILD_DIR)/$(TARGET).elf
	@echo "  SPIKE   $<"
	@command -v spike >/dev/null 2>&1 || { echo "Error: spike not found. Install riscv-isa-sim."; exit 1; }
	spike --isa=rv64gc $<

# ─── Clean ───────────────────────────────────────────────────────────────────
clean:
	@echo "  CLEAN"
	rm -rf $(BUILD_DIR)

# ─── Help ────────────────────────────────────────────────────────────────────
help:
	@echo "SMVDU-TITAN-X Phase 1 Firmware Build System"
	@echo ""
	@echo "Targets:"
	@echo "  all      Build ELF, HEX, and BIN (default)"
	@echo "  disasm   Generate disassembly listing"
	@echo "  size     Print section sizes"
	@echo "  sim      Run in Spike ISA simulator"
	@echo "  clean    Remove build artifacts"
	@echo ""
	@echo "Variables:"
	@echo "  CROSS_COMPILE  Toolchain prefix (default: riscv64-unknown-elf-)"
