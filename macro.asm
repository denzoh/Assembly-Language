%macro output 2
		;do actual work
		
	mov eax, %2
	mov ebx, %1
	mov ecx, 1
	mov edx, 4
	int 80h
	
		
%endmacro

section .data
	msg1 db 'take user input' ,0Ah
	lenmsg1 equ $ -msg1
	msg2 db 'Take user input' ,0Ah
	lenmsg2 equ $ -msg2

section .bss
	name resb 10

section .text

	global _start
	_start:
	output msg1, lenmsg1
	input name ,10
	output msg2, lenmsg2
	output name ,10
	
	mov eax,1
	int 80h
