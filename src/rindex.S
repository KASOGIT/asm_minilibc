[BITS 64]
	global rindex
	section .text

rindex:
	push rsi
	push rcx
	push rdi
	xor rax, rax
	mov rcx, rsi
loop:	
	cmp byte [rdi], 0
	je search
	inc rdi
	jmp loop
search:
	pop rdx
	push rdx
sloop:
	cmp byte [rdi], cl
	je found
	cmp rdi, rdx
	je end
	dec rdi
	jmp sloop
found:
	mov rax, rdi
end:	
	pop rdi
	pop rcx
	pop rsi
	ret
