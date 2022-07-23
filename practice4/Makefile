NAME=practice4

all: practice4

clean:
	rm -rf practice4 practice4.o

practice4: practice4.asm
	nasm -f elf -F dwarf -g practice4.asm
	gcc -no-pie -g -m32 -o practice4 practice4.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
