global _start

section .bss
array	resb 256	; array 256 bytes

section .text
_start	mov ecx, 256	; number of elements to register ecx
	mov edi, array	; first array pointer to register edi
	mov al, '@'	; symbol to register al
again:	mov [edi], al	; -- it's the main reason of this program
	inc edi		; next element 
	dec ecx		; decrease counter
	jnz again	; repeat mark again
	

