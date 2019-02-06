[BITS 64]
section .text
	global strchr

strchr:
	push rbp
	mov rbp, rsp
loop:
	cmp byte[rdi], 0
	je end

	cmp [rdi], sil
	je stop

	inc rdi

	jmp loop
stop:
	mov rax, rdi
	leave
	ret
end:
	mov rax, 0
	leave
	ret
