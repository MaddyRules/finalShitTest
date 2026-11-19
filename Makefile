MCU := attiny13
F_CPU ?= 1200000UL
AVR_CC ?= avr-gcc
AVR_OBJCOPY ?= avr-objcopy

.PHONY: all clean
all: blink.hex

blink.elf: blink.c Makefile
	$(AVR_CC) -mmcu=$(MCU) -DF_CPU=$(F_CPU) -std=c11 -Os -Wall -Wextra -o $@ $<

blink.hex: blink.elf
	$(AVR_OBJCOPY) -O ihex -R .eeprom $< $@

clean:
	$(RM) blink.elf blink.hex
