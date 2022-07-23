%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	entered 	db	"You entered: ", 0

segment .bss

	userInput resb 1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

		;; same as call read_string
	mov		edx, 1
	mov		ecx, [userInput]
	mov		ebx, 0
	mov		eax, 3
	int		0x80

	mov		eax, [userInput]
		call	print_string
		call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
