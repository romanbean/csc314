%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss

	N	   resd 1
	arrayA resd 100
	arrayB resd 100
	arrayC resd 100

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;; for n
	call	read_int
	mov		[N], eax

	;; Array A
	mov		esi, 0
	for1:
		cmp		esi, [N] ;; i >= n
		jge		endfor1
				call	read_int
				mov		[arrayA + esi * 4], eax
		add 	esi, 1
		jmp 	for1
	endfor1:

	;; Array B
	mov		esi, 0
	for2:
		cmp		esi, [N] ;; i >= n
		jge		endfor2
			call	read_int
			mov		[arrayB + esi * 4], eax
		add		esi, 1
		jmp		for2
	endfor2:

	;; Array C
	mov		esi, 0
	for3:
		cmp		esi, [N] ;; i >= n
		jge		endfor3
			mov		edx, [arrayA + esi * 4]
			add		edx, [arrayB + esi * 4]
			mov		[arrayC + esi * 4], edx
		add		esi, 1
		jmp		for3
	endfor3:
		;; for readability purpose
		call	print_nl

	;; Printin out
	mov		esi, 0
	for4:
		cmp		esi, [N] ;; i>=n
		jge 	endfor4
			mov		eax, [arrayC + esi * 4]
			call	print_int
			call	print_nl
		add 	esi, 1
		jmp		for4
	endfor4:

		call	print_nl
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
