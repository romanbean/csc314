%include "/usr/local/share/csc314/asm_io.inc"
;; this programs takes in an number and inform the user what the krabby patty should have

%define LET	32
%define	ONI 16
%define	TOM	8
%define	PIC	4
%define	MUS	2
%define KET 1

segment .data

	letMsg		db "- lettuce",10,0
	oniMsg		db "- onions",10,0
	tomMsg		db "- tomato",10,0
	picMsg		db "- pickles",10,0
	musMsg		db "- mustard",10,0
	ketMsg		db "- ketchup",10,0

	krabbyMsg	db "Krabby patty code?: ",0
	thatKrabbyMsg db	"That Krabby patty needs: -- ", 10,0


segment .bss

	res		resd 	1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, krabbyMsg
	call	print_string

	;; taking in the input for the code
	call	read_int
		;or		DWORD [res], eax
		mov 	ebx, 0
		or		ebx, eax
		mov		eax, ebx
		call	print_int
		call	print_nl
	;;
	mov		eax, thatKrabbyMsg
	call	print_string


	;; lettuce?
	and		DWORD [res], LET
	cmp		DWORD [res], 0
	je		onion
		;; printing lettuce
		mov		eax, letMsg
		call	print_string

onion:
	;; onion?
	and		ebx, ONI
	cmp		ebx, 1
	jne		tomato
		mov		eax, oniMsg
		call	print_string
tomato:
end:
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
