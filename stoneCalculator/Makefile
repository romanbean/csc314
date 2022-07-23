NAME=stoneCalculator

all: stoneCalculator

clean:
	rm -rf stoneCalculator stoneCalculator.o

stoneCalculator: stoneCalculator.asm
	nasm -f elf -F dwarf -g stoneCalculator.asm
	gcc -no-pie -g -m32 -o stoneCalculator stoneCalculator.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
