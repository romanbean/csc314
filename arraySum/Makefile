NAME=arraySum

all: arraySum

clean:
	rm -rf arraySum arraySum.o

arraySum: arraySum.asm
	nasm -f elf -F dwarf -g arraySum.asm
	gcc -no-pie -g -m32 -o arraySum arraySum.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
