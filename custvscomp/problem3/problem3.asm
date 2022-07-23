%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; A .. D = read_int()
	call	read_int
	mov 	ebx, eax

	call	read_int
	
	imul	ebx		; (A*B) => ebx
	mov		ebx, eax

	call	read_int
	mov		ecx, eax

	call	read_int
	
	imul	ecx		; (C*D) => eax
	mov		ecx, eax

	mov		eax, ebx
	cdq
	idiv	ecx

	; E = (A * B) / (C * D)
	; print_int(E);
	call	print_int
	call	print_nl


	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
