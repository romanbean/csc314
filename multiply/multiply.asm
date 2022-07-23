%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; A = read_int
	call 	read_int
	mov		ebx, eax 		; A = ebx
	
	; B = read_int
	call	read_int
	
	; C = A * B
	;imul	eax, ebx ;NOT SAFE
	imul 	ebx ; SAFE ; edx:eax = (eax * ebx)

	; print_int(C)
	call	print_int
	call	print_nl

	; A = read_int
	call	read_int
	mov		ebx, eax
	; B = read_int
	call	read_int
	
	; C = A / B
	; D = A % B
	;mov		edx, 0 ;; assume both integers will be positive
	cdq
	idiv	ebx
	; print_int(C)
	call	print_int
	call	print_nl
	; print_int(D)
	mov		eax, edx
	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
