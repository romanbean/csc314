

segment .data

	meanMsg 	db 	"Mean: %d", 10, 0
	medianMsg	db	"Median: %d", 10, 0
	modeMsg		db	"Mode: %d", 10, 0
	scanf_fmt	db	"%d",0
	printf_fmt	db	"%d",10,0
	sumMsg		db	"Sum: %d",10,0

segment .bss

	nums		resd	13
	tally		resd	1 ; for mode
	maxCount	resd	1 ; for mode
	sum			resd	1 ; for mean
	mean		resd	1 ; for mean
	mid			resd	1 ; for median
	mode		resd	1 ; for mode
	temp		resd 	1 ; for mode

segment .text
	global  main
	extern	scanf
	extern	printf

main:
	push	rbp
	mov		rbp, rsp
	; ********** CODE STARTS HERE **********

	; Reads 13 integers from the users
	mov		r15, 0
	read_loop_start:
	cmp		r15, 13
	jge		read_loop_end

		;; Storing numbers in arr
		mov		rdi, scanf_fmt
		lea		rsi, [nums + r15 * 4]
		call	scanf

	inc		r15
	jmp		read_loop_start
	read_loop_end:

	; Calculating Mean (all numbers / 13)
	mov		r15, 0
	calc_mean_start:
	cmp		r15, 13 ; change to 13 later
	jge		calc_mean_end

		; add them to sum
		mov		r14, [nums + r15 * 4]
;		add		r13d, r14d
		add		[sum], r14d

	inc		r15
	jmp		calc_mean_start
	calc_mean_end:
		; divide sum by 13
			; rdx:rax (quotient:reminder)
;		mov		rax, r13
		mov		rax, [sum]
		xor		rdx, rdx
		mov		rdi, 13
		idiv	rdi
		; store the output into the variable, [mean]
		mov		[mean], rax

	; Calculating Median (middle number)
		; first we need to sort the array
		mov		r15, 0
		sort_start:
		cmp		r15, 13
		jge		sort_end

			mov		r14, 0
			sort_start2:
			cmp		r14, 13
			jge		sort_end2

				; dereference
				mov		r8d, DWORD [nums + r15 * 4]
				mov		r9d, DWORD [nums + r14 * 4]
				cmp		r8d, r9d
				jge		endif

					mov		DWORD [nums + r15 * 4], r9d
					mov		DWORD [nums + r14 * 4], r8d

			endif:

			inc		r14
			jmp		sort_start2
			sort_end2:

		inc		r15
		jmp		sort_start
		sort_end:

		mov		rax, [nums]
		xor		rdx, rdx
		mov		rdi, 2
		idiv	rdi
			; if array length mod 2 is not 0
		cmp		rax, 2
		jne		endModIf
			; return a[n/2];
			mov		[mid], rdx ; store from division earlier
			xor		r14, r14 ; reset
			mov		r14, [nums + rdx * 4] ; hope it works

		endModIf:
			; return (a[n-1]/2] + a[n/2]) / 2

			;a[n-1]/2
			mov		r14d, 13 ; to remove exceeding 0's; hardcode.. can be fixed later
			mov		rax, r14
			sub		rax, 1 ; should be 2
			xor		rdx, rdx
			mov		rdi, 2
			idiv	rdi
			mov		rbx, rax

			mov		r13d, [nums + rbx * 4] ; access the variable ; this case, should be 2

			;a[n/2]
			mov		r14d, 13
			mov		rax, r14
			xor		rdx, rdx
			mov		rdi, 2
			idiv	rdi
			mov		rbx, rax

			mov		r12d, [nums + rbx * 4] ; access the variable; should be 2

			; add them together
			add		r13, r12
			mov		rax, r13
			xor		rdx, rdx
			mov		rdi, 2
			idiv	rdi ; 2 + 2 / 2 = 2
			mov		rbx, rax

			mov		[mid], rbx ; should be 2

	; Calculating Mode (repeating number)
	;getting the first element
		;; trying to use bits?
		;; 0x21 (2 is value, 1 is how much time)?
	mov		r15, 0
	mode_loop1:
	cmp		r15, 13
	jge		endmode_loop1

	inc		r15
	jmp		mode_loop1
	endmode_loop1:


	; Print out the numbers in order (debug)
	mov		r15, 0
	print_start:
	cmp		r15, 13
	jge		print_end

		mov		rdi, printf_fmt
		mov		esi, DWORD [nums + r15 * 4]
		call	printf

	inc		r15
	jmp		print_start
	print_end:

	; Printing out Mean, Median, Mode
	mov		rdi,	sumMsg
	mov		esi,	[sum]
	call	printf

	mov		rdi,	meanMsg
	mov		esi,	[mean]
	call	printf

	mov		rdi,	medianMsg
	mov		esi,	[mid]
	call	printf

	mov		rdi,	modeMsg
	mov		esi, 	[mode]
	call	printf

	; *********** CODE ENDS HERE ***********
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret
