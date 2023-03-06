global ft_strcmp


ft_strcmp:
	xor rcx, rcx
loop:
	mov al, byte [rdi + rcx]
	mov dl, byte [rsi + rcx]
	cmp al, dl
	jne exit
	cmp al, byte 0
	je exit
	inc rcx
	jmp loop
exit:
	movzx rax, al
	movzx rdx, dl
	sub rax, rdx
	ret
