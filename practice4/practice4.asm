%include "/usr/local/share/csc314/asm_io.inc"


segment .data

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call 	read_int
	
	; ebx = eax - 10
	mov		ebx, eax
	sub		ebx, 10
	
	; ecx = ebx + eax
	mov		ecx, ebx
	add		ecx, eax

;	mov		edx, ecx
;	sub		edx, 1
;	add		edx, ebx

	sub 	ecx, 1
	add		ecx, ebx
;	add		eax, edx

	add		eax, ecx

	call	print_int
	call	print_nl


	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
