	[BITS 64]
section .text
	global memcpy

memcpy:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
loop:
	cmp rcx, rdx
	je stop

	mov al, [rsi + rcx]
	mov byte[rdi + rcx], al

	inc rcx
	jmp loop
stop:
	mov rax, rdi
	leave
	ret
