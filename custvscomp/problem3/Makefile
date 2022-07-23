NAME=problem3

all: problem3

clean:
	rm -rf problem3 problem3.o

problem3: problem3.asm
	nasm -f elf -F dwarf -g problem3.asm
	gcc -no-pie -g -m32 -o problem3 problem3.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
