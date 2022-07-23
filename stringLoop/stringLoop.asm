%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	messages db "h", "e", "l","l", "o", 10, "w", "o", "r", "l", "d", 10
	magicNums dd	32, 16, 8, 4, 2, 1

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;; bit loop
		mov		ecx, 0
	bit_loop:
		cmp		ecx, 6
		jge		end

		mov		eax, DWORD [magicNums + ecx * 4]
		call	print_int
		call	print_nl

		add		ecx, 1
		jmp		bit_loop
	end:
		call	print_nl
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
