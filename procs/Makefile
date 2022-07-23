NAME=procs

all: procs

clean:
	rm -rf procs procs.o

procs: procs.asm
	nasm -f elf -F dwarf -g procs.asm
	gcc -no-pie -g -m32 -o procs procs.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
