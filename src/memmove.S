[BITS 64]
	global memmove
	section .text

memmove:
	push rdi
	push rsi
	push rdx

	cmp rdi, rsi
	jge tailcpy
	jl headcpy
tailcpy:
	cmp rdx, 0
	je end
	dec rdx
	mov al, byte [rdi + rdx]
	mov byte [rsi + rdx], al
	jmp tailcpy
headcpy:	
	cmp rdx, 0
	je end
	mov al, byte [rdi]
	mov byte [rsi], al
	dec rdx
	inc rsi
	inc rdi
	jmp headcpy
end:	
	pop rdx
	pop rsi
	pop rdi
	mov rax, rdi
	ret
