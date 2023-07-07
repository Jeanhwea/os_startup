all: boot.bin

bootsect.o: bootsect.s
	as86 -0 -a -o bootsect.o bootsect.s

boot.bin: bootsect.o
	ld86 -0 -s -o boot.bin bootsect.o
