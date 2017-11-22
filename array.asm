section .text
	global _start:
	%macro output 2
		mov edx,%1
		mov ecx,%2
		mov ebx,1
		mov eax,4
		int 0x80
	%endmacro

	%macro input 1
		mov ebx,2
		mov eax,3
		mov ecx,%1
		int 0x80
	%endmacro

	%macro endProg 0
	mov eax,1
	int 0x80
	%endmacro

	_start:
	output msg1len, msg1
	input array

	output msg1len, msg1	
	input array+1

	output msg1len, msg1	
	input array+2

	output msg1len, msg1	
	input array+3

	output 1,array
	output 1,array+1
	output 1,array+2
	output 1,array+3

	endProg

section .bss



section .data

	array TIMES 4 db 0

	msg1 db "Enter a number between 1-9",0xa
	msg1len equ $-msg1
