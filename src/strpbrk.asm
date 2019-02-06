	[BITS 64]
section .text
	global strpbrk
strpbrk:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
	mov rbx, 0
	mov rdx, 0

	cmp byte[rsi], 0
	je null_ptr
loop:
	mov al, [rsi + rcx]
	mov bl, [rdi]
	
	cmp al, 0
	je end
	
	cmp bl, 0
	je null_ptr

	cmp al, bl
	je stop
	
	inc rcx
	jmp loop
null_ptr:
	mov rax, 0
	leave
	ret
end:
	cmp bl, 0
	je stop
	
	mov rcx, 0
	inc rdi
	jmp loop

stop:
	mov rax, rdi
	leave
	ret
