%include "stud_io.inc"
global _start

section .data
x:	dd 'hh' 

section .text

_start: PRINT	[x]
        FINISH
