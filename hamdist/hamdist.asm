%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	str1	db	"test",0
	str2	db	"text",0
	mainStr db	"Hamming distance = %d",10,0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	str2
	push	str1
	call	hamdist
	add		esp, 8

	push	eax
	push	mainStr
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

hamdist:
	push	ebp
	mov		ebp, esp

	sub		esp, 8

	mov		esp, ebp
	pop		ebp
	ret
