# Makefile for the simple example kernel.
AS86    = as86 -0 -a
LD86    = ld86 -0

AS      = as
LD      = ld
GDB     = gdb
LDFLAGS = -Ttext 0 -e startup_32 -s -x -M

QEMU = qemu-system-i386

all: Image

Image: boot.bin
	dd bs=32 if=boot.bin of=Image skip=1


nox:
	$(QEMU) -nographic -fda Image

start:
	$(QEMU) -fda Image

debug: Image
	$(QEMU) -S -s -fda Image 2>/dev/null &
	gdb	-ex "target remote localhost:1234" \
		-ex "break *0x7c00" \
		-ex "layout asm" \
		-ex "layout reg"

boot.bin: boot.s
	$(AS86) -o boot.o boot.s
	$(LD86) -s -o boot.bin boot.o

clean:
	-rm -f Image *.bin *.o
