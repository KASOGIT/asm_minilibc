[BITS 64]
	global strpbrk
	section .text
	
strpbrk:
	push rcx
	push rdi
	push rsi
	xor rax, rax
loop:
	cmp byte [rdi], 0
	je end
sloop:
	cmp byte [rsi], 0
	je sloopend
	mov cl, byte [rdi]
	cmp byte [rsi], cl
	je found
	inc rsi
	jmp sloop
sloopend:
	pop rsi
	push rsi
	inc rdi
	jmp loop
found:
	mov rax, rdi
end:	
	pop rsi
	pop rdi
	pop rcx
	ret
