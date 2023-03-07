global _ft_strlen

_ft_strlen:
	mov rax, rdi
count:
	cmp [rax], byte 0
	je exit
	inc rax
	jmp count
exit:
	sub rax, rdi
	ret
