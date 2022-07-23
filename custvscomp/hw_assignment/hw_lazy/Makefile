NAME=hw_lazy

all: hw_lazy

clean:
	rm -rf hw_lazy hw_lazy.o

hw_lazy: hw_lazy.asm
	nasm -f elf -F dwarf -g hw_lazy.asm
	gcc -no-pie -g -m32 -o hw_lazy hw_lazy.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
