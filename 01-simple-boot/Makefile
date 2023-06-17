run: vmhd.vhd
	-echo 'Press [ctrl-a x] to exit QEMU'
	-qemu-system-i386 vmhd.vhd -nographic

vmhd.vhd: boot.bin
	dd if=boot.bin of=vmhd.vhd seek=0

boot.bin: boot.s
	nasm -o boot.bin boot.s

clean:
	-rm *.bin *.vhd *.vhdx

.PHONY: run clean
