	[BITS 64]
section .text
	global memmove

memmove:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
loop:
	cmp rcx, rdx
	je stop
	
	cmp byte[rdi + rcx], 0
	je stop

	cmp byte[rsi + rcx], 0
	je end

	mov al, [rsi + rcx]
	mov byte[rdi + rcx], al

	inc rcx
	jmp loop
end:
	mov byte[rdi + rcx], 0
	mov rax, rdi
	leave
	ret
stop:
	mov rax, rdi
	leave
	ret
