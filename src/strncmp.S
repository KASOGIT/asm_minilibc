[BITS 64]
	global strncmp
	section .text

strncmp:
	push rdi
	push rsi
	push rdx
	push rcx
	xor rax, rax
loop:
	cmp rdx, 0
	je end
	mov cl, byte [rdi]
	cmp byte [rsi], cl
	jne found
	cmp cl, 0
	je end
	dec rdx
	inc rsi
	inc rdi
	jmp loop
found:
	push rbx
	mov bl, byte [rsi]
	sub cl, bl
	movsx rax, cl
	pop rbx
	jmp end
end:
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	ret
