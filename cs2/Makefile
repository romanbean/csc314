NAME=cs2

all: cs2

clean:
	rm -rf cs2 cs2.o

cs2: cs2.asm
	nasm -f elf -F dwarf -g cs2.asm
	gcc -no-pie -g -m32 -o cs2 cs2.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
