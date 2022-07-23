%include "/usr/local/share/csc314/asm_io.inc"
%define LET 32	;___1_____
%define ONI	16	;____1____
%define TOM 8	;_____1___
%define PIC 4	;______1__
%define MUS 2	;_______1_
%define KET 1	;________1


segment .data

	letMsg		db	"Lettuce?: ",0,10
	oniMsg		db 	"Onions?: ",0,10
	tomMsg		db	"Tomato?: ",0,10
	picMsg		db	"Pickles?: ",0,10
	musMsg		db	"Mustard?: ",0,10
	ketMsg		db	"Ketchup?: ",0,10

	theEnd		db	"The End.", 0xa
segment .bss

	res		resd	1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;; Lettuce
	mov		eax, letMsg
	call	print_string

		;; Accepting the user input
		call	read_char
			mov		dl, al
		call	read_char ;; capturing \n
		;; checking if it is a yes or no
		cmp		dl, 'y'
		jne		onionPrompt

			;; if yes, set the value to the result
			or		DWORD [res], LET

onionPrompt:
	;; Onion
	mov		eax, oniMsg
	call	print_string

		;; User input
		call	read_char
			mov		dl, al
		call	read_char

		cmp		dl, 'y'
		jne		tomatoPrompt
			;;
			or		DWORD [res], ONI

tomatoPrompt:
	;; Tomato
	mov		eax, tomMsg
	call	print_string

		;; User input
		call	read_char
			mov		dl, al
		call	read_char ;; captures \n

		cmp		dl, 'y'
		jne		picklePrompt
			;;
			or		DWORD [res], TOM

picklePrompt:
	;; Pickle
	mov		eax, picMsg
	call	print_string

		;; User input
		call	read_char
			mov		dl, al
		call	read_char

		cmp		dl, 'y'
		jne		mustardPrompt
			;;
			or		DWORD [res], PIC

mustardPrompt:
	;; Mustard
	mov		eax, musMsg
	call	print_string

		;; User input
		call	read_char
			mov		dl, al
		call	read_char

		cmp		dl, 'y'
		jne		ketchupPrompt
			;;
			or		DWORD [res], MUS

ketchupPrompt:
	;; Ketchup
	mov		eax, ketMsg
	call	print_string

		;; U_I
		call	read_char
			mov		dl, al
		call	read_char

		cmp		dl, 'y'
		jne		result
			;;
			or		DWORD [res], KET
result:
	;; printing the final calculated result
	mov		eax, DWORD [res]
	call	print_int
end:
	call	print_nl
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
