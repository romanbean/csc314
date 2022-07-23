NAME=arrayLoop

all: arrayLoop

clean:
	rm -rf arrayLoop arrayLoop.o

arrayLoop: arrayLoop.asm
	nasm -f elf -F dwarf -g arrayLoop.asm
	gcc -no-pie -g -m32 -o arrayLoop arrayLoop.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
