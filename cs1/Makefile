NAME=cs1

all: cs1

clean:
	rm -rf cs1 cs1.o

cs1: cs1.asm
	nasm -f elf -F dwarf -g cs1.asm
	gcc -no-pie -g -m32 -o cs1 cs1.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
