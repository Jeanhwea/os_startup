all: vmhd.vhd


kernel.bin: kernel.s
	nasm -w-zeroing -o kernel.bin kernel.s

boot.bin: boot.s
	nasm -o boot.bin boot.s

vmhd.vhd: boot.bin kernel.bin
	dd if=boot.bin of=vmhd.vhd seek=0
	dd if=kernel.bin of=vmhd.vhd seek=1

.PHONY: clean
clean:
	-rm *.bin
	-rm vmhd.vhd
