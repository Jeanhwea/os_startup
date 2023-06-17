all: vmhd.vhd

# 按 [ctrl-a x] 退出 QEMU
run: vmhd.vhd
	-qemu-system-i386 vmhd.vhd -nographic

# 制作硬盘镜像
vmhd.vhd: boot.bin
	dd if=boot.bin of=vmhd.vhd seek=0

boot.bin: boot.s
	nasm -o boot.bin boot.s

clean:
	-rm *.bin *.vhd *.vhdx

.PHONY: all run clean
