all: kernel.img

bootsect.o: bootsect.s
	as86 -0 -a -o bootsect.o bootsect.s

boot.bin: bootsect.o
	ld86 -0 -s -o boot.bin bootsect.o

# ld86 采用 minix 文件格式, bs=32 跳过前面的 32 个字节的数据
kernel.img: boot.bin
	dd bs=32 if=boot.bin of=kernel.img skip=1
