%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	fun_nums		dd		10,20,30

	fun_string		db		"Hello world",0
	fun_string2		db		"Hello world",0

segment .bss

	destbuff	resb 		12

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	cld
	mov		edi, fun_string
	mov		esi, fun_string2
	mov		ecx, 12
	toploop1:
		cmpsb
		jne		noteq
		loop	toploop1
	mov		eax, 0
	call	print_int
	jmp		end
	noteq:
	mov		eax, 1
	call	print_int
	end:
	cld
	mov		esi, fun_string
	mov		edi, destbuff
	mov		ecx, 12
	toploop:
;		lodsd			;; mov al, byte [esi]; add ecx, 1
;		stosd			;; mov byte [edi], al; add edi, 1

		movsb
	loop	toploop

	mov		eax, destbuff
	call	print_string
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
