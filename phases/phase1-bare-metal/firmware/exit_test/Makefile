# SMVDU-TITAN-X Phase 1 Exit Test Firmware Makefile
#
# Builds minimal exit-test RISC-V assembly firmware for SMVDU-TITAN-X
#
# SPDX-License-Identifier: Apache-2.0

CROSS_COMPILE ?= riscv64-unknown-elf-
AS      := $(CROSS_COMPILE)as
LD      := $(CROSS_COMPILE)ld
OBJCOPY := $(CROSS_COMPILE)objcopy
OBJDUMP := $(CROSS_COMPILE)objdump
SIZE    := $(CROSS_COMPILE)size

TARGET  := exit_test
ARCH    := rv64gc
ABI     := lp64d

SRCS    := main.S
OBJS    := $(SRCS:.S=.o)

ASFLAGS := -march=$(ARCH) -mabi=$(ABI) -g
LDFLAGS := -T linker.ld -nostdlib -static -Map=$(TARGET).map

BUILD_DIR := build

.PHONY: all clean disasm sim size

all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

$(BUILD_DIR)/%.o: %.S | $(BUILD_DIR)
	@echo "  AS      $<"
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/$(TARGET).elf: $(addprefix $(BUILD_DIR)/, $(OBJS)) linker.ld
	@echo "  LD      $@"
	$(LD) $(LDFLAGS) -o $@ $(addprefix $(BUILD_DIR)/, $(OBJS))
	@echo ""
	$(SIZE) $@

$(BUILD_DIR)/$(TARGET).hex: $(BUILD_DIR)/$(TARGET).elf
	@echo "  HEX     $@"
	$(OBJCOPY) -O ihex $< $@

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	@echo "  BIN     $@"
	$(OBJCOPY) -O binary $< $@

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

disasm: $(BUILD_DIR)/$(TARGET).elf
	@echo "  DISASM  $(BUILD_DIR)/$(TARGET).dis"
	$(OBJDUMP) -d -S $< > $(BUILD_DIR)/$(TARGET).dis

size: $(BUILD_DIR)/$(TARGET).elf
	$(SIZE) $<

sim: $(BUILD_DIR)/$(TARGET).elf
	@echo "  SPIKE   $<"
	spike --isa=rv64gc $<

clean:
	@echo "  CLEAN"
	rm -rf $(BUILD_DIR)
