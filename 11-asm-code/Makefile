AS = nasm



*.o: %.s
	$(AS) -f elf -o $@ $<

.PHONY: clean
clean:
	-rm *.o
