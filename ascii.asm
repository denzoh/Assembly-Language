section .text

	global _start
	_start: 
	sub ah,ah
	mov al,'9'
	sub al,'3'
	aas
	or  al,30h ;or zero with the contents in the al to change it back to ascii
	mov [res],ax

	mov edx,len
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,1
	mov ecx,res
	mov ebx,1
	mov eax,4
	int 0x80

	mov eax,1
	int 0x80


section .data
	msg db "The result is:",0xa
	len equ $-msg

section .bss
	res resb 1
