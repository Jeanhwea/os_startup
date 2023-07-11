all: my_proc.run

exch.s:	exch.c
	gcc -Wall -S -o exch.s exch.c

sys_write.o: sys_write.S
	as -o sys_write.o sys_write.S

my_proc.run: my_proc.c sys_write.o
	gcc -o my_proc.run my_proc.c sys_write.o
