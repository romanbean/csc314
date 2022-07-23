NAME=pwdc

all: pwdc

clean:
	rm -rf pwdc pwdc.o

pwdc: pwdc.asm
	nasm -f elf -F dwarf -g pwdc.asm
	gcc -no-pie -g -m32 -o pwdc pwdc.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
