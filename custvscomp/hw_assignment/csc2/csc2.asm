%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call	read_int
	cmp		eax, 13
	jne		elseif
		mov		eax, 37
		call	print_int
		jmp		endif
	elseif:
	cmp		eax, 100
	jne		else
		mov		eax, 200
		call	print_int
		jmp		endif 	;; jump over else statement
	else:
		mov		eax, -1
		call	print_int
	endif:
		call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
