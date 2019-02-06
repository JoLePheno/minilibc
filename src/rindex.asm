	[BITS 64]
section .text
	global rindex

rindex:
	push rbp
	mov rbp, rsp
	mov rax, 0
loop:
	cmp byte[rdi], 0
	je stop

	cmp byte[rdi], sil
	je stor_ptr

	inc rdi
	jmp loop
	
stor_ptr:
	mov rax, rdi
	inc rdi
	jmp loop
stop:
	leave
	ret
