%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;; Accepting the user input
	call	read_int

	;; Storing the input into the register esi
	mov		esi, eax

	;; Shift left by 5
	shl		esi, 0x5

	;; Loading the effective address
	;lea		ecx, [esi+0x11]

	;; Printing the value
		mov		eax, esi
		;mov		eax, ecx
		call	print_int
		call 	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
