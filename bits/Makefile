NAME=bits

all: bits

clean:
	rm -rf bits bits.o

bits: bits.asm
	nasm -f elf -F dwarf -g bits.asm
	gcc -no-pie -g -m32 -o bits bits.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
