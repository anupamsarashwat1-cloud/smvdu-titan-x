# SMVDU-TITAN-X Phase 2 BootROM Makefile
#
# SPDX-License-Identifier: Apache-2.0

CROSS_COMPILE ?= riscv64-unknown-elf-
AS      := $(CROSS_COMPILE)as
LD      := $(CROSS_COMPILE)ld
OBJCOPY := $(CROSS_COMPILE)objcopy
OBJDUMP := $(CROSS_COMPILE)objdump

TARGET  := bootrom
ARCH    := rv64gc
ABI     := lp64d

ASFLAGS := -march=$(ARCH) -mabi=$(ABI) -g
LDFLAGS := -Ttext 0x00010000 -nostdlib -static

BUILD_DIR := build

.PHONY: all clean

all: $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

$(BUILD_DIR)/%.o: %.S | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/$(TARGET).elf: $(BUILD_DIR)/main.o
	$(LD) $(LDFLAGS) -o $@ $<

$(BUILD_DIR)/$(TARGET).hex: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) -O binary $< $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
