all: vmhd.vhd

# 按 [ctrl-a x] 退出 QEMU
run: vmhd.vhd
	-qemu-system-i386 -nographic -hda vmhd.vhd

# 制作硬盘镜像
vmhd.vhd: boot.bin
	dd if=boot.bin of=vmhd.vhd seek=0

boot.bin: boot.s
	nasm -f bin -o boot.bin boot.s

clean:
	-rm *.bin *.vhd *.vhdx

.PHONY: all run clean
