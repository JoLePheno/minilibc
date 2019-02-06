	[BITS 64]  		; Obligatoire
section .text
        global strcmp
 
strcmp:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rbx, 0
loop:
	mov 	al, [rdi]
	mov	bl, [rsi]
	
	cmp     byte[rdi], 0
        je      stop		;end of first string

        cmp     byte[rsi], 0
        je      stop		;end of second string
	
        cmp     al, bl
        jne 	stop

	inc	rdi
	inc	rsi	

	jmp     loop
stop:
	sub rax, rbx
	leave
	ret
