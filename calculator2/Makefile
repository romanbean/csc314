NAME=calculator2

all: calculator2

clean:
	rm -rf calculator2 calculator2.o

calculator2: calculator2.asm
	nasm -f elf -F dwarf -g calculator2.asm
	gcc -no-pie -g -m32 -o calculator2 calculator2.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
