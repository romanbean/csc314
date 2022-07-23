%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	myMessage 	db 	"Hello World",10,0 ;; \0 in ascii code
	myMessageLen equ $-myMessage

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	
	mov 	eax, myMessage
	call 	print_string

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
