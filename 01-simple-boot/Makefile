EMU  = qemu-system-i386 -nographic
EMUG = qemu-system-i386

.PHONY: all
all: run

# 按 [ctrl-a x] 退出 QEMU
.PHONY: run
run: vm.img
	$(EMU) -hda vm.img

.PHONY: runx
runx: vm.img
	$(EMUG) -hda vm.img

vm.img: boot.bin
	dd if=boot.bin of=vm.img seek=0

boot.bin: boot.s
	nasm -f bin -o boot.bin boot.s

.PHONY: clean
clean:
	-rm *.bin *.img
