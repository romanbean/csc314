NAME=multiply

all: multiply

clean:
	rm -rf multiply multiply.o

multiply: multiply.asm
	nasm -f elf -F dwarf -g multiply.asm
	gcc -no-pie -g -m32 -o multiply multiply.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
