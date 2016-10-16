[BITS 64]
	global memset
	section .text

memset:
	push rdi
	push rsi
	push rdx
	push rcx
	mov rcx, rsi
loop:	
	cmp rdx, 0
	je end
	mov byte [rdi], cl
	inc rdi
	dec rdx
	jmp loop
end:
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, rdi
	ret
