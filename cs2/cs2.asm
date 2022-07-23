%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, 10 ;; a = 10
toploop:

	cmp		eax, 0 ;; if a < 0
	jl		endloop ;;   ^^^^^
		mov		ebx, 5
		cmp		eax, ebx
		je		endif
			call	print_int
			call	print_nl
	endif:
		sub eax, 1 ;; a--;
	jmp toploop

endloop:
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
