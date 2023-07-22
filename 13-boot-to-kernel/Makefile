all: Image


kernel.bin: kernel.s
	nasm -o kernel.bin kernel.s

boot.bin: boot.s
	nasm -o boot.bin boot.s

Image: boot.bin kernel.bin
	dd if=boot.bin of=Image seek=0
	dd if=kernel.bin of=Image seek=1

.PHONY: clean
clean:
	-rm *.bin Image
