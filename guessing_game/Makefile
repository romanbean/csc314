NAME=guessing_game

all: guessing_game

clean:
	rm -rf guessing_game guessing_game.o

guessing_game: guessing_game.asm
	nasm -f elf -F dwarf -g guessing_game.asm
	gcc -no-pie -g -m32 -o guessing_game guessing_game.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
