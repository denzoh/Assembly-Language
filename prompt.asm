
SYSTEM_EXIT equ 1
SYSTEM_READ equ 3
SYSTEM_WRITE equ 4
SYSTEM_IN equ 0
SYSTEM_OUT equ 1


section .bss
	num1 resb 2
	num2 resb 2
	res resb 10	

section .data
	prompt_1 db 'Enter The first number:',0xA
	promptLength_1 equ $-prompt_1
	prompt_2 db 'Enter the second number:',0xA
	promptLength_2 equ $-prompt_2	
	prompt_3 db 'The Product is:'
	promptLength_3 equ $-prompt_3

section .text
	global _start
	_start:

	mov eax, SYSTEM_WRITE
	mov ebx, SYSTEM_OUT
	mov ecx, prompt_1
	mov edx, promptLength_1
	int 0x80

	mov eax, SYSTEM_READ
	mov ebx, SYSTEM_IN
	mov ecx, prompt_1
	mov edx, 2
	int 0x80

	mov eax, SYSTEM_WRITE
	mov ebx, SYSTEM_OUT
	mov ecx, prompt_2
	mov edx, promptLength_2
	int 0x80

	mov eax, SYSTEM_READ
	mov ebx, SYSTEM_IN
	mov ecx, prompt_2
	mov edx, 2
	int 0x80

	mov eax, SYSTEM_WRITE
	mov ebx, SYSTEM_OUT
	mov ecx, prompt_3
	mov edx, promptLength_3
	int 0x80


	mov al,[prompt_1]
	sub al,'0'

	mov bl,[prompt_2]
	mov bl,'0'
		
	mul bl
	add al,'0'

	mov[res], al
	mov ecx,prompt_3
	mov edx,promptLength_3
	mov ebx,1
	mov eax,4
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,res
	mov edx,1
	int 0x80
	mov eax,1
	int 0x80	


exit:
	mov eax, SYSTEM_EXIT
	int 0x80
