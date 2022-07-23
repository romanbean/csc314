%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; thing1 = 62 - 4
	mov 	eax, 62
	sub		eax, 4
	
;	mov		ebx, 0
;	mov		ebx, eax
;	add		ebx, eax

	; thing2 = thing1 + thing1
	add 	eax, eax

	; thing3 = thing2 - 5
	sub 	eax, 5

	call	print_int
	call	print_nl


	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
