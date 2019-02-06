	[BITS 64]
section .text
	global strstr
strstr:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rdx, 0
	mov rbx, 0
	mov r15, 0
loop:
	mov rdx, 0
	mov rcx, 0

	jmp test_match

test_match:
	mov bl, [rdi + rdx]
	mov al, [rsi + rcx]

	cmp al, 0
	je stop

	cmp bl, 0
	je end
	
	cmp al, bl
	je match

	cmp al, bl
	jne before_loop
match:
	inc rcx
	inc rdx
	jmp test_match
before_loop:
	inc rdi
	jmp loop
end:
	mov rax, 0
	leave
	ret
stop:
	mov rax, rdi
	leave
	ret
