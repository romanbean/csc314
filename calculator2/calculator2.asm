%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	equalSign 	db "= ",0

segment .bss

	var1	resw	1
	var2 	resw	2
segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call	read_int
		mov		[var1], eax

		mov		esi, [var1]

		call	read_char ;; captures the \n

	call	read_char
		mov		cl, al

	call	read_int
		mov		[var2], eax

		mov		edi, [var2]

	cmp		cl, 0x2B
	jne		endplusif
		mov		ebx, esi
		add		ebx, edi
		jmp		endexpif

endplusif:
			cmp 	cl, 0x2D
			jne		endsubif
				mov		ebx, esi
				sub 	ebx, edi
				jmp		endexpif
endsubif:
			cmp		cl, 0x2A
			jne		endmulif
				mov		ebx, esi
				imul	ebx, edi

				jmp		endexpif
endmulif:
			cmp		cl, 0x2F
			jne		enddivif
				mov		eax, esi
				cdq
				idiv	edi

				;; Store in edx register
				;;  since edx is using for print purpose
				mov		ebx, eax
				jmp		endexpif

enddivif:
			cmp		cl, 0x25
			jne		endmodif
				mov		eax, esi
				cdq
				idiv	edi

				;; edx is the reminder
				mov		ebx, edx
				jmp		endexpif
endmodif:

			cmp		cl, 0x5E
			jne		endexpif
				mov 	ecx, 0
				mov		ebx, 1
				for1:
					cmp		ecx, edi
					jge		endfor
						imul	ebx, esi
					inc		ecx
					jmp for1 ;; loop back
				endfor:

endexpif:

		mov		eax, equalSign
		call	print_string

		mov		eax, ebx
		call	print_int
		call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
