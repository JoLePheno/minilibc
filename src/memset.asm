	[BITS 64]
section .text
	global memset

memset:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
loop:
	cmp rcx, rdx
	je stop
	
	cmp byte[rdi + rcx], 0
	je stop

	mov byte[rdi + rcx], sil

	inc rcx
	jmp loop
stop:
	mov rax, rdi
	leave
	ret
