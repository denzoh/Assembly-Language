section .bss

section .data
	message db 'My name is Dennis', 0Ah
	messageLength db $-message
section .text
	global _start
	_start:
		mov edx ,22  ;message length
		mov ecx, message	;message to display
		mov ebx, 1		;file descriptor(stdout)
		mov eax, 4		;system print call
		int 0x80		;kernel call

		;exit from the program
		mov eax, 1
		int 0x80
