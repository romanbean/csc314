%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	str1	db	"Hello World!",10,0

segment .bss


segment .text
	global  asm_main
;	extern	putchar
;	extern	getchar

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call	getchar

	push	eax
	call	putchar
	add		esp, 4

	push	str1
	call	gets
	add		esp, 4

	push	str1
	call	puts
	add		esp, 4

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

putchar:
	push	ebp
	mov		ebp, esp

;; syscalls
	mov		eax, 4
	mov		ebx, 1
	lea		ecx, [ebp + 8]
	mov		edx, 1
	int		0x80

	mov 	esp, ebp
	pop		ebp
	ret

getchar:
	push	ebp
	mov		ebp, esp

	sub		esp, 4
	;; syscall
	mov		eax, 3
	mov		ebx, 0
	lea		ecx, [ebp - 4]
	mov		edx, 1
	int		0x80

	;; return c;
	mov		al, BYTE [ebp - 4]

	mov		esp, ebp
	pop		ebp
	ret

puts:
	push	ebp
	mov		ebp, esp

	mov		edi, 0
	mov		esi, DWORD [ebp + 8]

	toploop:
		cmp		BYTE [esi + edi], 0
		je		endloop

			;; sys call
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

gets:
	push	ebp
	mov		ebp, esp

	mov		edi, -1
	mov		esi, DWORD	[ebp + 8]
	toploop1:
	inc		edi

		mov		eax, 3
		mov		ebx, 0
		lea		ecx, [esi + edi]
		mov		edx, 1
		int 	0x80


	cmp		BYTE [esi + edi], 10
	jne		toploop1
	endloop1:

	mov		BYTE [esi + edi], 0

	mov 	esp, ebp
	pop		ebp
	ret

