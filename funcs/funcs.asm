%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	str1	db	"Hello '%s'", 10,0
	str2	db 	"Electro", 10, 0

segment .bss


segment .text
	global  asm_main
;	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	str2
	push	str1
	call	printf
	add		esp, 4

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

printf:
	push	ebp
	mov		ebp, esp

		mov		esi, DWORD [ebp + 8]
		mov		edi, 0

		;; loop to print a character from stack parameter
		toploop:
			cmp	BYTE [esi + edi], '%'
			je		endloop

			main:
				mov		eax, 4
				mov		ebx, 1
				lea		ecx, [esi + edi]
				mov		edx, 1
				int		0x80

			inc		edi
			jmp		toploop

		endloop:

	mov		esp, ebp
	pop		ebp
	ret

argument:
	push	ebp
	mov		ebp, esp

		mov		edi, 0
		mov		esi, DWORD [ebp + 16]

		tl1:
			cmp BYTE [esi+ edi], 0
			je	el1

				mov		eax, 4
				mov		ebx, 1
				lea		ecx, [esi + edi]
				mov		edx, 1
				int		0x80
			inc		edi
			jmp		tl1

		el1:


	mov		esp, ebp
	pop		ebp
	ret
