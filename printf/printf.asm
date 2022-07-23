%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	str1 	db	"Hello World!", 10, 0

	str2	db	"str3 is '%s', isn't that cool?",10,0

	str3	db	"woot woot",10,0
	str3Len equ $-str3

	str4	db	"%c is a char, but so is %%, %s again!",10,0

segment .bss


segment .text
	global  asm_main
;	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	str1
	call	printf
	add		esp, 4

	push	str3
	push	str2
	call	printf
	add		esp, 4

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

	;; Hint: print each character instead of storing a whole thing
printf:
	push	ebp
	mov		ebp, esp

	mov		edi, 0
	mov		esi, DWORD [ebp + 8]

	toploop:

		cmp		BYTE [esi + edi], '%'
		je		argument

			;; syscall for writing to the screen
			mov		eax, 4 ;; write call
			mov		ebx, 1 ;; std out
			lea		ecx, [esi + edi] ;; load the address of str1
			mov		edx, 1	;; length
			int		0x80

		inc		edi
		jmp		toploop

	endloop:

		argument:
			mov		eax, 4
			mov		ebx, 1
			mov		ecx, [ebp + 12]
			mov		edx, str3Len
			int		0x80

end:
	mov		esp, ebp
	pop		ebp
	ret
