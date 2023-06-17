all: boot kernel


kernel: kernel.s
	nasm kernel.s -o kernel

boot: boot.s
	nasm boot.s -o boot

.PHONY: clean
clean:
	-rm kernel
	-rm boot
