NAME=stringLoop

all: stringLoop

clean:
	rm -rf stringLoop stringLoop.o

stringLoop: stringLoop.asm
	nasm -f elf -F dwarf -g stringLoop.asm
	gcc -no-pie -g -m32 -o stringLoop stringLoop.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
