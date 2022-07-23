NAME=modulus_test

all: modulus_test

clean:
	rm -rf modulus_test modulus_test.o

modulus_test: modulus_test.asm
	nasm -f elf -F dwarf -g modulus_test.asm
	gcc -no-pie -g -m32 -o modulus_test modulus_test.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
