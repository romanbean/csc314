%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	scanf_fmt	db		"%d",0
	printf_fmt	db		"%d",10,0

segment .bss

	nums 	resd	10

segment .text
	global  main
	extern	scanf
	extern	printf

main:
	push	rbp
	mov		rbp, rsp
	; ********** CODE STARTS HERE **********

	mov		r15, 0
	; get 10 numbers
	read_loop_top:
	cmp		r15, 10
	jge		read_loop_end

		; scanf("%d", nums[i]); i think
		mov		rdi, scanf_fmt
		lea		rsi, [nums + r15 * 4]
		call	scanf

	inc		r15
	jmp		read_loop_top
	read_loop_end:

	; sort them
		; for (i..) {
			; for (j...) {
				; if a[i] < a[j] {
					;swap a[i], a[j]
	mov		r15, 0
	sortloop1_top:
	cmp		r15, 10
	jge		sortloop1_end

		mov		r14, 0
		sortloop2_top:
		cmp		r14, 10
		jge		sortloop2_end

			; deref
			mov		r8d, DWORD [nums + r15 * 4]
			mov		r9d, DWORD [nums + r14 * 4]
			cmp		r8d, r9d
			jge		endif

				mov		DWORD [nums + r15 * 4], r9d
				mov		DWORD [nums + r14 * 4], r8d


			endif:

		inc		r14
		jmp		sortloop2_top
		sortloop2_end:


	inc		r15
	jmp		sortloop1_top
	sortloop1_end:







	; print them out
	mov		r15, 0
	printloop_start:
	cmp		r15, 10
	jge		printloop_end

		; printf("%d\n", nums[r15]);
		mov		rdi, printf_fmt
		mov		esi, DWORD [nums + r15 * 4]
		call	printf

	inc		r15
	jmp		printloop_start
	printloop_end:

	; *********** CODE ENDS HERE ***********
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret
