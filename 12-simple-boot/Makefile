# Makefile for the simple example kernel.
AS86    = as86 -0 -a
LD86    = ld86 -0
AS      = as
LD      = ld
GDB     = gdb
LDFLAGS = -Ttext 0 -e startup_32 -s -x -M
QEMU    = qemu-system-i386

.PHONY: all
all: debug

debug: Image
	$(QEMU) -S -s -m 512 -smp 1 -fda Image 2>/dev/null &
	gdb	-ex "target remote localhost:1234" \
		-ex "set disassemble-next-line on" \
		-ex "set architecture i8086" \
		-ex "layout asm" -ex "layout reg" \
		-ex "break *0x7c00"


Image: boot.bin
	dd if=boot.bin of=Image seek=0

boot.bin: boot.s
	nasm -f bin -o boot.bin boot.s

.PHONY: clean
clean:
	-rm *.bin *.img
