[BITS 64]
	global strcasecmp
	section .text

strcasecmp:
	push rdi
	push rsi
	push rcx
	push rbx
	xor rax, rax
loop:
	mov cl, byte [rdi]
	mov bl, byte [rsi]
	cmp cl, 0
	je found
	cmp bl, 0
	je found
	cmp bl, cl
	je cont
	sub cl, 41h
	add cl, 61h
	cmp bl, cl
	je cont
	sub cl, 61h
	add cl, 41h
	sub cl, 61h
	add cl, 41h
	cmp bl, cl
	je cont
	sub cl, 41h
	add cl, 61h
	jmp found
cont:
	inc rsi
	inc rdi
	jmp loop
found:
	sub cl, bl
	movsx rax, cl
end:
	pop rbx
	pop rcx
	pop rsi
	pop rdi
	ret
