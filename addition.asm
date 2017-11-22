
SYSTEM_EXIT equ 1
SYSTEM_READ equ 3
SYSTEM_WRITE equ 4
SYSTEM_IN equ 0
SYSTEM_OUT equ 1


section .bss
	num1 resb 10
	num2 resb 10
	res resb 10	

section .data
	prompt_1 db 'Enter The first number:',0xA
	promptLength_1 equ $-prompt_1
	prompt_2 db 'Enter the second number:',0xA
	promptLength_2 equ $-prompt_2	
	prompt_3 db 'The sum is:'
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
	mov ecx, num1
	mov edx, 2
	int 0x80

	mov eax, SYSTEM_WRITE
	mov ebx, SYSTEM_OUT
	mov ecx, prompt_2
	mov edx, promptLength_2
	int 0x80

	mov eax, SYSTEM_READ
	mov ebx, SYSTEM_IN
	mov ecx, num2
	mov edx, 2
	int 0x80

	mov eax, SYSTEM_WRITE
	mov ebx, SYSTEM_OUT
	mov ecx, prompt_3
	mov edx, promptLength_3
	int 0x80

	mov eax,[num1]
	sub eax,'0'
	mov ebx,[num2]
	sub ebx,'0'

	add eax, ebx
	add eax,'0'

	mov [res], eax

	;print the sum
 	mov eax, SYSTEM_WRITE
	mov ebx, SYSTEM_OUT
	mov ecx, res
	mov edx, 1
	int 0x80

exit:
	mov eax, SYSTEM_EXIT
	xor ebx, ebx
	int 0x80
