NAME=practice2

all: practice2

clean:
	rm -rf practice2 practice2.o

practice2: practice2.asm
	nasm -f elf -F dwarf -g practice2.asm
	gcc -no-pie -g -m32 -o practice2 practice2.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
