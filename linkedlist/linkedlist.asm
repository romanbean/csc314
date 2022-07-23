%include "/usr/local/share/csc314/asm_io.inc"

%define	BOLD_GREEN 27, "[32m"
%define YELLOW 27, "[33m"
%define RED 27, "[31m"
%define BLUE 27, "[34m"
%define MAGENTA 27, "[35m"
%define END	27, "[0m"

segment .data
	size:		; the size of the structure

	struc	node
		data:	resd	1
		key:	resd	1
		struc	node
			next:	resd	1
	endstruc

	len			equ		$-size

	nullMsg		db		RED, "Null - the list is empty!", END, 0
	addMsg		db		BOLD_GREEN, "Adding ", END, "an element to the List!", 0
	printMsg	db		YELLOW, "Printing ", END, "a linked list:", 0
	cleanMsg	db		BLUE, "Cleaning ", END , "an element", 0
	doneMsg		db		MAGENTA, "Done! ", END, "Now it is ready for cleaning!", 0
	emptyLMsg	db		"- EMPTY LIST -", 0

segment .bss

	list		resd	1

segment .text
	global  	main
	extern		free
	extern		print
	extern		malloc
	extern		puts
	extern		putchar

main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

    mov 	DWORD [list], 0 ; the list must be empty initially.

    push 	DWORD 'L'      ; First element being added to the list!
    push 	list           ; Address of the first element in the list and pass it to the insert function through the stack!
    call 	insert         ; Add the element to the list!

    push 	DWORD 'O'
    push 	list
    call 	insert

    push 	DWORD 'V'
    push 	list
    call 	insert

	push 	DWORD 'E'
	push 	list
	call 	insert

	push 	DWORD '-'
	push 	list
	call 	insert

	push 	DWORD 'x'
	push 	list
	call 	insert

	push 	DWORD '8'
	push 	list
	call 	insert

	push 	DWORD '6'
	push 	list
	call 	insert

    mov 	ecx, 1
start_proc:
    push 	ecx            ; I don't know why ecx is changed, but if I don't push, infinite loop will occur!
    push 	DWORD '!'
    push 	list

    call 	insert

    pop 	ecx

    loop 	start_proc

	push	DWORD [list]   ; Printing out the list
    call 	print

    push 	list           ; Remove the first element: L
    call 	pof

    push 	DWORD [list]
    call 	print

    push 	list           ; Remove the second element: O
    call 	pof

    push 	DWORD [list]
    call 	print

    push 	list           ; Remove V
    call 	pof

    push 	DWORD [list]
    call 	print

    push 	list           ; Remove E
    call 	pof

    push 	DWORD [list]
    call 	print

    push 	list           ; Remove -
    call 	pof

    push 	DWORD [list]
    call 	print

	push 	list			; Remove x
	call 	pof

	push 	DWORD [list]
	call 	print

	push 	list			; Remove 8
	call 	pof

	push 	DWORD [list]
	call 	print

	push 	list			; remove 6
	call 	pof

	push 	DWORD [list]
	call 	print

    push 	DWORD [list]   ; Finally, now we can clean it up!
    call 	cleanup

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

insert:
    push 	ebp            ; Save the stack
    mov 	ebp, esp

    push 	eax            ; Save the registers
    push 	ebx

    push 	len            ; Size to get from the heap and pass the size to the malloc function
    call 	malloc         ; Call the malloc function - now eax has the address of the allocated memory

    mov 	ebx, [ebp + 12]
    mov 	[eax + data], ebx    ; Add the element to the node data field
    mov 	DWORD [eax + key], 0   ; Address of the next element is NULL, because it is the last element in the list

    mov 	ebx, [ebp + 8]  ; Retrieve the address to the first element
    cmp 	DWORD [ebx], 0
    je 		null_p

    mov 	ebx, [ebx]      ; This parameter was the address of the address

next_element:
    cmp		DWORD [ebx + key], 0
    je 		found_last
    mov 	ebx, [ebx + key]
    jmp 	next_element

found_last:
    push 	eax
    push 	addMsg
    call 	puts
    add 	esp, 4              ; Restore the stack
    pop 	eax

    mov 	[ebx + key], eax   ; Last element is this one from the newly allocated memory block

go_out:
    pop 	ebx             ; Restore registers
    pop 	eax

    mov 	esp, ebp
    pop 	ebp
    ret 	8               ; Return to the caller function and cleaning the stack

null_p:
    push 	eax
    push 	nullMsg
    call 	puts
    add 	esp, 4
    pop 	eax

    mov 	[ebx], eax      ; Point the address of the first element to the allocated memory

    jmp 	go_out

pof:
    push 	ebp
    mov 	ebp, esp

    push 	ebx
    push 	edx
    push 	ecx

    mov 	ebx, [ebp + 8]          ; Address of the address of the first element
    mov 	eax, [ebx]              ; Address of the first element
    cmp 	eax, 0
    je 		donePof                  ; Don't do anything if the list is empty already!
    mov 	edx, eax
    mov 	eax, [eax + data]       ; The information stored in the element

    mov 	ecx, [edx + key]
    mov 	[ebx], ecx              ; The address to the first element changed to point to the key one

    pusha                       ; This is suboptimal I guess, i have no idea why but it works
    push 	edx                    ; Free the allocated resources
    call 	free
    add 	esp, 4
    popa

donePof:
    pop 	ecx
    pop 	edx                     ; Done - restore the registers and return to the calling procedure
    pop 	ebx

    mov 	esp, ebp
    pop 	ebp
    ret 	4

cleanup:
    push 	ebp                    ; Save the stack pointer
    mov 	ebp, esp

    push 	eax                    ; Save the working registers

    mov 	eax, [ebp + 8]          ; Retrieve the parameters
    cmp 	eax, 0                  ; If the address is NULL, then it is past the end of the list
    je 		doneCleaning             ; No more recursive calls; print an appropriate message

    push 	DWORD [eax + key]     ; Push the address of the key element as parameter for the key call to this procedure
    call 	cleanup

    pusha                       ; Print a message that cleaning is underway
    push 	cleanMsg
    call 	puts
    add 	esp, 4
    popa

    push 	eax                    ; Push the address of the current element as parameter for the free function
    call 	free
    add 	esp, 4

doneAll:                        ; Prepare to exit the procedure
    pop 	eax
    mov 	esp, ebp
    pop 	ebp
    ret 	4

doneCleaning:                   ; Print a message that the last element was passed to the procedure
    pusha
    push 	doneMsg
    call 	puts
    add 	esp, 4
    popa
    jmp 	doneAll

print:
    push 	ebp
    mov 	ebp, esp

    push 	ebx
    mov 	ebx, [ebp + 8]  ; Address of the first element
    cmp 	ebx, 0
    je 		emptyList

    push 	eax
    push 	printMsg
    call 	puts
    add 	esp, 4
    pop 	eax

key_char:
    push 	DWORD [ebx + data]
    call 	putchar
    mov 	ebx, [ebx + key]
    cmp 	ebx, 0
    jne 	key_char

    push 	DWORD 10
    call 	putchar

done:
    pop 	ebx
    mov 	esp, ebp
    pop 	ebp
    ret 	4

emptyList:
    pusha
    push 	emptyLMsg
    call 	puts
    add 	esp, 4
    popa
    jmp 	done
