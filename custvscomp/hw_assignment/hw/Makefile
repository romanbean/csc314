NAME=hw

all: hw

clean:
	rm -rf hw hw.o

hw: hw.asm
	nasm -f elf -F dwarf -g hw.asm
	gcc -no-pie -g -m32 -o hw hw.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
