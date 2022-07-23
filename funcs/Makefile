NAME=funcs

all: funcs

clean:
	rm -rf funcs funcs.o

funcs: funcs.asm
	nasm -f elf -F dwarf -g funcs.asm
	gcc -no-pie -g -m32 -o funcs funcs.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
