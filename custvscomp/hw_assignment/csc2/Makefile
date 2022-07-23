NAME=csc2

all: csc2

clean:
	rm -rf csc2 csc2.o

csc2: csc2.asm
	nasm -f elf -F dwarf -g csc2.asm
	gcc -no-pie -g -m32 -o csc2 csc2.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
