
segment .data

msg db "Hello World!",10,0 ;; in ascii for \0
msgLen equ $-msg

segment .text
global _start

_start:

;; print "Hello World" stored in msg
	mov 	eax, 4
	mov 	ebx, 1
	mov 	ecx, msg
	mov 	edx, msgLen
	int 	0x80

;; exit
	mov 	eax, 1
	mov 	ebx, 0
	int 	0x80

