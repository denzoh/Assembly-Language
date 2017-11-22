SYSTEM_WRITE equ 4
SYSTEM_OUT equ 1
SYSTEM_READ equ 3
SYSTEM_IN equ 0

section .bss
	fact resb 1

section .text
	global _start:
_start:
	mov bx ,3
	call get_fact
	add ax, 30h
	mov [fact], ax

	mov edx, len
	mov ecx, msg
	mov ebx,SYSTEM_OUT
	mov eax,SYSTEM_WRITE
	int 80h

	mov edx, 8
	mov ecx, fact
	mov ebx, SYSTEM_OUT
	mov eax,SYSTEM_WRITE
	int 80h

get_fact:
	cmp bl,1
	jg do_calculation
	mov ax, 1
	ret
do_calculation:
	dec bl
  	call get_fact
	inc bl
	mul bl
	ret
section .data
msg db 'The factorial of 8 is:',0Ah
len equ $ -msg 
	
