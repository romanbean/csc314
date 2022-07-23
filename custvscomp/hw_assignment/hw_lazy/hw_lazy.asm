%include "/usr/local/share/csc314/asm_io.inc"


segment .data
a17 equ 17
b32 equ 32
x123 equ 123

segment .bss
a resd 1 ;;
b resd 1 ;;
x resd 1 ;;

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	;; eax is 4 bytes, 32 bits
		;; dword is 4 bytes≈
	;; Accepting the user input
	call	read_int
		;; Storing the input into the variable a
		mov		[a], eax

	;; Accepting the user input
	call	read_int
		;; Storing the input into the variable b
		mov		[b], eax

	;; Adding 17 to the variable a
	mov		esi, [a]
	add		esi, a17

	mov 	[x], esi

	;; Printing out the modified value of a
		;; in this example, should be 27 or 140
	;mov		eax, [x]
	;call	print_int
	;call	print_nl

	;;
	;; Now x have (17 + A)
	;;

	;; Multiplying B with 32, then dividing by a
	mov		edi, [b]
	imul	edi, b32
	mov		eax, edi ;; Recieving the original value of a
	cdq
	idiv	word [a]

	;; Store it in edx
	mov		edx, eax

	;; Printing the modified value of b
		;; in this example, should be 64 or 118
	;mov		eax, edx
	;call	print_int
	;call	print_nl

	;;
	;; Now ((B*32) / A) is completed
	;;

	;; Multplying it with the modified value of a
	imul	edx, esi

	;; Overwritting x with new value
	mov		[x], edx

	;; Printing the x
		;; in this example, should be 1728
	;mov		eax, [x]
	;call	print_int
	;call	print_nl


	;; Finally, adding 123 to the variable x, then subtracting by the original value of b

	add		word [x], x123

	mov		edx, [b]
	sub		[x], edx

	;; Printing the final result
		;; in this example, should be 1831
	mov		eax, [x]
	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
