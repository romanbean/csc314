%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call	read_int	; eax = user input
	;inc	eax     	; OK
	;add	1, eax  	; BAD CODE
	add		eax, 1
	call 	print_int	; print's eax
	call 	print_nl	; print new line

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
