%include "/usr/local/share/csc314/asm_io.inc"


segment .data
	gameWonMsg db "You got it!",0xa,0
	tooLow db "Too low",0xa,0
	tooHigh db "Too high",0xa,0
segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;; Dumping the registers to see the number
	;dump_regs	1

	;; Setting the random number
	mov		ebx, 0 ; reset it to 0
	mov		bl, cl ; getting the value

	gameLoop:
	;; Accepting the user input
	call	read_int

	cmp 	bl, al
	je		gameWon
	jg		guessLow
	jl		guessHigh

	guessLow:
		;; Printing too low
		mov		eax, tooLow 
		call	print_string
		;call	print_nl
		jmp 	gameLoop

	guessHigh:
		;; Printing too high
		mov		eax, tooHigh
		call	print_string
		;call	print_nl
		jmp gameLoop

gameWon:
	mov 	eax, gameWonMsg
	call	print_string
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
