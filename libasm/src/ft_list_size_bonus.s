global ft_list_size

ft_list_size:
	push rdi
	xor rcx, rcx
.count:
	cmp rdi, 0
	je .end
	mov rdi, [rdi + 0x8]
	inc rcx
	jmp .count
.end:
	pop rdi
	mov rax, rcx
	ret