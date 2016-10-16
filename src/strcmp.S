[BITS 64]
	section .text
	global strcmp
	
strcmp:
	push rdi
	push rsi
	push rcx
	xor rax, rax
loop:
	mov cl, byte [rdi]
	cmp byte [rsi], cl
	jne found
	cmp cl, 0
	je end
	inc rsi
	inc rdi
	jmp loop
found:
	push rdx
	mov dl, byte [rsi]
	sub cl, dl
	movsx rax, cl
	pop rdx
	jmp end
end:
	pop rcx
	pop rsi
	pop rdi
	ret
