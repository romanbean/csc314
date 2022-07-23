%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	equalSign 	db "= ", 10 ;; 10 is new line, same as 0xa

segment .bss

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;; Accepting the user inputs
		;; first input
	call	read_int
		mov		esi, eax

	call 	read_char ;; caught an \n from previous input
			;; Special thanks for Mr Kramer to demostrate in the class at Feb 14.

		;; second input for operations (+, -, *, /, %, ^)

		;; Accepting the input for operations
	call	read_char
		mov		cl, al

		;; Accepting the third input for integers
	call	read_int
		mov		edi, eax


	;; If the char is +, add the registers together, store the final result in ebx
		;; if not, jump out of plus if
	cmp		cl, '+'
	jne		endplusif
		mov		ebx, esi
		add		ebx, edi
		jmp		endexpif

endplusif:
			;; if the char is -, subtract the registers together and store the final result in the ebx
				;; register, then jump to the end. If not, exit to next cmp
			cmp 	cl, '-'
			jne		endsubif
				mov		ebx, esi
				sub 	ebx, edi
				jmp		endexpif
endsubif:
			;; checking for mulitply sign, if so, perform the multiplication (signed). If not, exit
			cmp		cl, '*'
			jne		endmulif
				mov		ebx, esi
				imul	ebx, edi

				jmp		endexpif
endmulif:
			;; checking for division, if so, perform the division (signed). If not, exit
			cmp		cl, '/'
			jne		enddivif
				mov		eax, esi
				cdq
				idiv	edi

				;; Store in ebx register
				;;  since ebx is using for print purpose
				mov		ebx, eax
				jmp		endexpif

enddivif:
			;; checking for modulus
				;REMEMBER, EDX:EAX. EDX is where the reminder will go
			cmp		cl, '%'
			jne		endmodif
				mov		eax, esi
				cdq
				idiv	edi

				;; edx is the reminder, store into ebx register
				mov		ebx, edx
				jmp		endexpif
endmodif:
			;; Checking for the exponentation, if so, perform it. If not, exit
			cmp		cl, '^'
			jne		endexpif
				mov 	ecx, 0
				mov		ebx, 1 ;; to avoid to reset it to zero
				;; For loop for exponentation 
					;; calculator.c is the reference to help me to write this solution
				for1:
					cmp		ecx, edi
					jge		endfor
						imul	ebx, esi
						inc		ecx
						jmp for1 ;; loop back until ecx is above edi (for example, 2^2, ecx is 0, edi is 2. It will loop twice)
													;; Therefore, it will be 4.
				endfor:

endexpif:
		;; Printing the result along with the equal sign

		mov		eax, equalSign
		call	print_string

		mov		eax, ebx
		call	print_int
		call	print_nl

exit:
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
