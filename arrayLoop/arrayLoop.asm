%include "/usr/local/share/csc314/asm_io.inc"




segment .data


segment .bss

	array resd 10

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;; Accepting the user input
		;; start a loop up to 10 entries
	mov		ecx, 0 ;; counter
	inputLoop:
		cmp	ecx, 10 ;; if i > 10
		jge endInputLoop
			call 	read_int ;; Accepting the user input
			mov		DWORD [array + ecx * 4], eax ;; assign into array
			add		ecx, 1 ;; i++
			jmp		inputLoop
	endInputLoop:


	;; Sorting the integers
	mov		ecx, 0 ;; counter
	sortLoop:
		cmp ecx, 10 ;; if i > 10
		jge endSortLoop
			mov edx, ecx
			add edx, 1
			insideLoop:
				cmp edx, 10
				jge endInsideLoop
					mov	ebx, DWORD [array + edx * 4]
					cmp DWORD [array + ecx * 4], ebx
					jl endInsideIf

						mov esi, DWORD [array + ecx * 4]
						mov DWORD [array + ecx * 4], ebx
						mov	DWORD [array + edx * 4], esi

					endInsideIf:

				add edx, 1
				jmp insideLoop
			endInsideLoop:
		add ecx, 1
		jmp sortLoop
	endSortLoop:

	;; Printing out the array
	mov		ecx, 0 ;; counter
	printLoop:
		cmp ecx, 10 ;; if i > 10
		jge endPrintLoop

			mov eax, DWORD [array + ecx * 4]
			call print_int
			call print_nl

		add ecx, 1
		jmp printLoop
	endPrintLoop:


	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret





