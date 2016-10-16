[BITS 64]
	global memcpy
	section .text

memcpy:
	push rdi
	push rsi
	push rdx
loop:
	cmp rdx, 0
	je end
	mov al, byte [rsi]
	mov byte [rdi], al
	dec rdx
	inc rsi
	inc rdi
	jmp loop
end:
	mov rax, rdi
	pop rdx
	pop rsi
	pop rdi
	ret
