	[BITS 64]
section .text
	global strcasecmp

strcasecmp:

	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rbx, 0
	mov rcx, 0

fill_argument:
	mov al, [rdi + rcx]
	mov bl, [rsi + rcx]
	
loop:
		
	cmp al, 0
	je stop

	cmp bl, 0
	je stop

	cmp al, 97
	jl to_lower_case_al

	cmp bl, 97
	jl to_lower_case_bl
	
	cmp al, bl
	jne stop

	inc rcx
	jmp fill_argument
	
to_lower_case_al:
	add al, 32
	jmp loop
to_lower_case_bl:	
	add bl, 32
	jmp loop
stop:
	mov rax, 0
	mov rbx, 0
	mov al, [rdi + rcx]
	mov bl, [rsi + rcx]
	sub rax, rbx
	leave
	ret
