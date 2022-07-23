%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;;	Accept the user input for value a (esi) to avoid eax for now
	call	read_int

	;; Store the value a into register esi
	mov		esi, eax

	;; Accept the user input for value b (ebx) for easy reading purpose
	call	read_int

	;; Store the value b into register ebx
	mov		ebx, eax

	;; Calculations
	;; Formula is final_result = (17 + A) * ((B * 32) / A) + 123 - B
	;; Use ecx for calculation purposes to keep value a and b safe
	;; 17 + A

	;; Adding 17 to value a
	mov 	ecx, 17
	add		ecx, esi

	;; Printing out the number (debugging)
		;; It is after value a added with 17
		;mov		eax, ecx
		;call	print_int
		;call 	print_nl

		;; Original value a
		;mov		eax, esi
		;call	print_int
		;call	print_nl

	;; B * 32 then divided by A
		;; Storing the original value of b into the register edi
		mov 	edi, ebx

	mov		ebx, 32
	imul	ebx, edi
	mov		eax, ebx
	cdq
	idiv	esi

	;; Store it into edx
	mov		edx, eax

	;; Printing out the number (debugging)
		;; value b is now multiplied by 32 and divided by a
;		mov		eax, edx
;		call	print_int
;		call	print_nl

	;; (17 + A) * ((B*32)/A)
	;; ecx had the modified value of a
	;; eax had the modified value of b
	imul	ecx, eax

	;; Printing out the number (debugging)
		;; (17 + A) * ((B * 32) / A) is now completed
		;; in this example a = 10,  b = 20 
		;; should be 1728
		;mov		eax, ecx
		;call	print_int
		;call	print_nl

	;; Adding 123 then substract original value of b
	add		ecx, 123

	;; Printing out the number (debugging)
		;; After adding 123
		;; in this example, it should be either 1851, 16643
		;mov		eax, ecx
		;call	print_int
		;call	print_nl

	;;	Subtracting final result by original value of b
	sub		ecx, edi

	;; Printing out the number (debugging)
		;; After subtracting the original value of b
		;; in this example, it should be either 1831, 16187
		mov		eax, ecx
		call	print_int
		call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
