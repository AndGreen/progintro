global	_start
 
section .text
print: 
	push ebp
	mov ebp, esp		
	sub esp, 4

	push esi
	push edi
.param1:
	mov esi, [ebp+8]
.param2:
	mov edi, [ebp+12]	

	mov eax, 4
	mov ebx, 1
	mov ecx, esi
	mov edx, edi
	int 80h

	ret

section .data
param1	db "Hello world", 10
param2	dd $-param1	

section .text
_start:
	push dword param1
	push dword param2
	call print
	
	mov eax, 1
	mov ebx, 0
	int 80h 
