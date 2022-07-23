%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; cat = 100 + 200 + 300
	mov		eax, 100 ; eax = 100
	add		eax, 200 ; eax += 200
	add		eax, 300 ; eax += 300

	; dog = cat - 50
	mov	    ebx, eax ; store eax in ebx (ebx = eax)
	sub		ebx, 50  ; ebx -= 50
	
	; fish = 40 + cat
	mov		ecx, 40
	add		ecx, eax

	mov		eax, ecx
	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
