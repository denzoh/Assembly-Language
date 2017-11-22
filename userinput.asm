section .bss
	name resb 10	

section .data
	prompt_1 db 'Enter Your Name', 0Ah
	promptLength_1 equ $-prompt_1
	prompt_2 db 'Name entered is:', 0Ah
	promptLength_2 equ $-prompt_2
section .text
	global _start
	_start:
		;dispay first prompt
		mov edx ,promptLength_1 ;message length
		mov ecx, prompt_1	;message to display
		mov ebx, 1		;file descriptor(stdout)
		mov eax, 4		;system print call
		int 0x80		;kernel call

		
		;read user input
		mov eax,3		;sys_read
		mov ebx,2		;from stdin
		mov ecx,name		;save user input
		int 0x80
		
		;display second prompt
		mov edx ,promptLength_2 ;message length
		mov ecx, prompt_2	;message to display
		mov ebx, 1		;file descriptor(stdout)
		mov eax, 4		;system print call
		int 0x80		;kernel call

		
		;output user input
		mov eax,4		;sys_write
		mov ebx,1		;from stdin
		mov ecx,name		;save user input
		mov edx,10
		int 0x80
		

		;exit from the program
		mov eax, 1
		mov ebx, 0
		int 0x80
