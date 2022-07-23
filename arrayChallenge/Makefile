NAME=arrayChallenge

all: arrayChallenge

clean:
	rm -rf arrayChallenge arrayChallenge.o

arrayChallenge: arrayChallenge.asm
	nasm -f elf -F dwarf -g arrayChallenge.asm
	gcc -no-pie -g -m32 -o arrayChallenge arrayChallenge.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
