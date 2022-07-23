NAME=linkedlist

all: linkedlist

clean:
	rm -rf linkedlist linkedlist.o

linkedlist: linkedlist.asm
	nasm -f elf32 -F dwarf -g linkedlist.asm
	gcc -no-pie -g -m32 -o linkedlist linkedlist.o
