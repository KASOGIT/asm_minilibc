[BITS 64]
	global strchr
	section .txt

strchr:
	push rdi
	push rsi
	push rcx
	mov rcx, rsi
	xor rax, rax
loop:
	cmp byte [rdi], cl
	je found
	cmp byte [rdi], 0
	je end
	inc rdi
	jmp loop
found:
	mov rax, rdi
end:	
	pop rcx
	pop rsi
	pop rdi
	ret
