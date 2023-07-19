# Makefile for the simple example kernel.
AS86    = as86 -0 -a
LD86    = ld86 -0

AS      = i386-elf-as
LD      = i386-elf-ld
GDB     = i386-elf-gdb
LDFLAGS = -m elf_i386 -Ttext 0 -e startup_32 -s -x -M

all: Image

boot.bin: boot.asm
	nasm -f bin -o boot.bin boot.asm

Image: boot.bin
	dd bs=512 if=boot.bin of=Image skip=0

debug: Image
	qemu-system-i386 -s -fda Image 2>/dev/null &
	gdb	-ex "target remote localhost:1234" \
		-ex "break *0x7c00" \
		-ex "layout asm" \
		-ex "layout reg"

clean:
	-rm -f *.bin *.o Image
