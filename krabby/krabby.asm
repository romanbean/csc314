%include "/usr/local/share/csc314/asm_io.inc"

%define B_LETTUCE 32 ;000100000
%define B_ONION   16 ;000010000
%define B_TOMATO  8  ;000001000
%define B_PICKLE  4  ;000000100
%define B_MUSTARD 2  ;000000010
%define B_KETCHUP 1  ;000000001

;; test case, no lettuce, no tomato, no mustard
;;			yes onion, yes pickles, yes ketchup
;;			000010101
;;				21

segment .data

lettuce_msg		db		"Lettuce? ", 10

onion_msg		db		"Onions? ", 10

tomato_msg		db		"Tomatoes? ", 10
;pickle_msg		db		"Pickles?: ", 10
;mustard_msg		db		"Mustard?: ", 10
;ketchup_msg		db		"Ketchup?: ", 10

segment .bss

res 			resb	1
segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********


prompt_lettuce:
;	mov		eax, lettuce_msg
;	call	print_string

	mov		ebx, 0 ;; setting it 0

		;; if yes, add the bit
		call	read_char

		mov		dl, al

		cmp		dl, 'n'
		je		prompt_onion

			;;addin the bit
			or 	ebx, B_LETTUCE ;; 100000 or 32

prompt_onion:
;	mov		eax, onion_msg
;	call	print_string

		call	read_char
		mov		dl, al
		cmp		dl, 'n'
		je		prompt_tomato

			;; adding the bit
			or ebx, B_ONION

prompt_tomato:
;	mov		eax, tomato_msg
;	call	print_string

		call	read_char
		mov		dl, al
		cmp		dl, 'n'
		je		prompt_pickle

			;; adding the bit
			or	ebx, B_TOMATO

prompt_pickle:
		
end:
	;; printing out the final result
	mov		eax, ebx
	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
