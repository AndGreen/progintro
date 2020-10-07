global _start

section .data
msg	db "Hello world", 10
msgLn	equ $-msg

section .text
_start:	mov	eax, 4		; system call (standart output) code
	mov	ebx, 1		; standart output mode
	mov	ecx, msg	; message
	mov	edx, msgLn	; message length
	int	80h

	mov	eax, 1		; system call (exit) code
	mov	ebx, 0		; success code
	int	80h
