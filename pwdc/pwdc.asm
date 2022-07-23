%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	fmtstring	db		"Complexity: %d", 10, 0
	testpass	db		"Password1!", 0

segment .bss


segment .text
	global  asm_main
	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; eax = complexity("Password1!");
	push	testpass
	call	complexity
	add		esp, 4

	; printf("Complexity: %d\n", eax);
	push	eax
	push	fmtstring
	call	printf
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

complexity:
	; ... TODO ...
	
