%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	remin db "reminder: ", 0xA
segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;; accepting the user input
	call	read_int
		mov		esi, eax

	call	read_char
		mov		cl, al

	call	read_int
		mov		edi, eax


	cmp		cl, '%'
		mov		eax, edi
		cdq
		idiv	esi

		mov		ebx, eax

		and 	edx, 1
		jz		print_div

			mov		eax, ebx
			call	print_int

			mov		eax, remin
			call	print_string

			mov		eax, edx
			call	print_int
			jmp		exit

print_div:

	mov 	eax, ebx
	call 	print_int
	call	print_nl

exit:
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
