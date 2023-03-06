global ft_strdup

extern ft_strlen
extern malloc
extern ft_strcpy

ft_strdup:
	; align stack for libc call
	push rbp
	push rdi
	push rsi
	mov rbp, rsp
	and rsp, 0xFFFFFFFFFFFFFFF0

	; allocate new dst string
	call ft_strlen
	inc rax
	push rdi
	mov rdi, rax
	call malloc wrt ..plt
	pop rdi

	; check if malloc failed
	cmp rax, 0
	je end

cpy:
	mov rsi, rdi
	mov rdi, rax
	call ft_strcpy
end:
	; return stack to its original state
	mov rsp, rbp
	pop rsi
	pop rdi
	pop rbp
	ret