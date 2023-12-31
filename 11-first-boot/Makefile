# Makefile for the simple example kernel.
AS86    = as86 -0 -a
LD86    = ld86 -0
AS      = i386-elf-as
LD      = i386-elf-ld
GDB     = gdb
LDFLAGS = -m elf_i386 -Ttext 0 -e startup_32 -s -x -M
QEMU    = qemu-system-x86_64
# AS      = as
# LD      = ld
# GDB     = gdb
# LDFLAGS = -Ttext 0 -e startup_32 -s -x -M

all: Image

Image: boot.bin system.bin
	dd bs=32 if=boot.bin of=Image skip=1
	objcopy -O binary system.bin head.bin
	cat head.bin >> Image

disk: Image
	dd bs=8192 if=Image of=/dev/fd0
	sync;sync;sync

start:
	$(QEMU) -fda Image

qemu: System.map
	$(QEMU) -s -S -fda Image &
	$(GDB) -ex "target remote localhost:1234" \
		-ex "set disassemble-next-line on" \
		-ex "break *0x7c00"

bochs: Image
	bochs -q -f bochsrc.bxrc

head.o: head.s

system.bin: head.o
	$(LD) $(LDFLAGS) head.o -o system.bin > System.map

boot.bin: boot.s
	$(AS86) -o boot.o boot.s
	$(LD86) -s -o boot.bin boot.o

clean:
	-rm -f Image System.map *.bin *.o
