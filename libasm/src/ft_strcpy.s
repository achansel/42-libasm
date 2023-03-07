global _ft_strcpy

_ft_strcpy:
	xor rax, rax
cpy:
	cmp [rsi + rax], byte 0
	je exit
	mov dl, byte [rsi + rax]
	mov [rdi + rax], dl
	inc rax
	jmp cpy
exit:
	mov [rdi + rax], byte 0
	mov rax, rdi
	ret
