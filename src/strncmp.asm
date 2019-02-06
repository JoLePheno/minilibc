	[BITS 64]
section .text
	global strncmp

strncmp:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
loop:
	mov al, [rdi + rcx]
	mov bl, [rsi + rcx]

	cmp rcx, rdx
	je stop
	
	cmp al, bl
	jne stop

	cmp al, 0
	je stop

	cmp bl, 0
	je stop

	inc rcx
	jmp loop
stop:
	
	sub rax, rbx
	leave
	ret
