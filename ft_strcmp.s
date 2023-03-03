global ft_strcmp

ft_strcmp:
	mov al, byte [rdi + rcx]
	mov bl, byte [rsi + rcx]
	cmp al, bl
	jne exit
	cmp al, byte 0
	je exit
	inc rcx
	jmp ft_strcmp
exit:
	movzx rax, al
	movzx rbx, bl
	sub rax, rbx
	ret
