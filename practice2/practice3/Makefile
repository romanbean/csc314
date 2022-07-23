NAME=practice3

all: practice3

clean:
	rm -rf practice3 practice3.o

practice3: practice3.asm
	nasm -f elf -F dwarf -g practice3.asm
	gcc -no-pie -g -m32 -o practice3 practice3.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
