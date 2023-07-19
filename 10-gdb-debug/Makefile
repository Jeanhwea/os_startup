# Makefile for the simple example kernel.
AS86    = as86 -0 -a
LD86    = ld86 -0

AS      = i386-elf-as
LD      = i386-elf-ld
GDB     = i386-elf-gdb
LDFLAGS = -m elf_i386 -Ttext 0 -e startup_32 -s -x -M

# AS      = as
# LD      = ld
# GDB     = gdb
# LDFLAGS = -Ttext 0 -e startup_32 -s -x -M

all: Image

Image: boot.bin
	dd bs=32 if=boot.bin of=Image skip=1

start:
	qemu-system-i386 -fda Image

debug:
	qemu-system-i386 -s -fda Image &
	$(GDB)  -ex "target remote localhost:1234" \
			-ex "break *0x7c00"


boot.bin: boot.s
	$(AS86) -o boot.o boot.s
	$(LD86) -s -o boot.bin boot.o

clean:
	-rm -f Image System.map *.bin *.o
