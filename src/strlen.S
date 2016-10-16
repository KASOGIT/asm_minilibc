[BITS 64]
	global strlen
	section .text

strlen:
	push rdi
	xor rax, rax
loop:	cmp byte [rdi], 0
	je end
	inc rax
	inc rdi
	jmp loop
end:	pop rdi
	ret
