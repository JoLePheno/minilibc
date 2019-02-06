	[BITS 64]
	section .text
	global strcspn
strcspn:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
	mov rbx, 0
loop:
	mov rdx, 0
	mov al, [rsi]
	mov bl, [rdi + rcx]

	cmp bl, 0
	je stop

	jmp find_match
find_match:
	mov al, [rsi + rdx]
	mov bl, [rdi + rcx]

	cmp al, bl
	je stop

	cmp al, 0
	je before_loop

	inc rdx
	jmp find_match
before_loop:
	inc rcx
	jmp loop
stop:
	mov rax, rcx
	leave
	ret
