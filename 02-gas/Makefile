all: boot.run

boot.o: boot.S
	as -g -o boot.o boot.S

boot.run: boot.o
	gcc -g -o boot.run boot.o
