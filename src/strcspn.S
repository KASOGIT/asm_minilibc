[BITS 64]
	global strcspn
	section .text

strcspn:
	push rdx
	push rcx
	push rdi
	push rsi
	xor rdx, rdx
loop:
	cmp byte [rdi], 0
	je end
sloop:
	cmp byte [rsi], 0
	je sloopend
	mov cl, byte [rdi]
	cmp cl, byte [rsi]
	je end
	inc rsi
	jmp sloop
sloopend:
	pop rsi
	push rsi
	inc rdi
	inc rdx
	jmp loop
end:
	mov rax, rdx
	pop rsi
	pop rdi
	pop rcx
	pop rdx
	ret
