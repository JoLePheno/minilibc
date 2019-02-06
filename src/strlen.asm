	[BITS 64]  		; Obligatoire

	global strlen 		;  initialize the name of the function Obligatoire 
	section .text 		; set the .text Obligatoire 

strlen:
	push rbp 		; initialize the stack
	mov rbp, rsp 		; initialize the pointer of the stack
	mov rcx, 0 		; set our incrementeur to 0

loop:
	cmp byte[rdi], 0
	je end
	
	inc rdi
		
	inc rcx
	jmp loop

end:
	mov rax, rcx
	leave
	ret
