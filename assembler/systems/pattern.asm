global _start
section .data
star	equ '*'		; use it!

section .text
match:
	push ebp
	mov ebp, esp
	sub esp, 4

	push esi
	push edi
	mov esi, [ebp+8]
	mov edi, [ebp+12]
.again:
	cmp byte [edi], 0
	jne .not_end
	cmp byte [esi], 0
	jne near .false
	jmp .true
.not_end:
	cmp byte [edi], '*'
	jne .not_star
	mov dword [ebp-4], 0
.star_loop:
	mov eax, edi
	inc eax
	push eax 
	mov eax, esi
	add eax, [ebp-4]
	push eax
	call match
	
	add esp, 8
	test eax, eax
	jnz .true
	add eax, [ebp-4]
	cmp byte [esi+eax], 0
	je .false
	inc dword [ebp-4]
	jmp .star_loop
.not_star:
	mov al, [edi]
	cmp al, '?'
	je .quest
	cmp al, [esi]
	jne .false
	jmp .goon
.quest:
	cmp byte [esi], 0
	jz .false
.goon:	inc esi
	inc edi
	jmp .again
.true:
	mov eax, 1
	jmp .quit
.false:
	xor eax, eax
.quit:
	pop edi
	pop esi
	mov esp, ebp
	pop ebp
	ret

section .data
pattern	db "*.c", 3
string	db "hello.c", 7

section .text
_start:
	push dword pattern
	push dword string
	call match
	add esp, 8

result:	mov esi, eax
	mov eax, 4
	mov ebx, 1
	mov ecx, esi
	mov edx, 8
	int 80h	

quit:	mov eax, 1
	mov ebx, 0
	int 80h
