%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, 0 ;; a = 0

toploop:
	cmp		eax, 25 ;; if a >= 25
	jge		endloop ;; ^^^^^^^^^^
		call	print_int
		call 	print_nl
		add		eax , 1
	jmp 	toploop
endloop:

	mov		ebx, 0 ;; a = 0
toploop2:
	cmp		ebx, 100
	jge		endloop2
		mov		ecx, 2
		cdq
		mov		eax, ebx ;; for loop purpose
		idiv	ecx
		cmp		edx, 0 ;; if(i % 2 != 0)
		jne		endif ;; goto endif
			mov		eax, ebx
			call 	print_int
			call	print_nl
		endif:
		add		ebx, 1
	jmp		toploop2
endloop2:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
