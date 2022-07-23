NAME=random

all: random

clean:
	rm -rf random random.o

random: random.asm
	nasm -f elf -F dwarf -g random.asm
	gcc -no-pie -g -m32 -o random random.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
