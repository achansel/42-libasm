global _ft_strdup

extern _ft_strlen
extern _malloc
extern _ft_strcpy

_ft_strdup:
	; align stack for libc call
	push rbp
	push rdi
	push rsi
	mov rbp, rsp
	and rsp, 0xFFFFFFFFFFFFFFF0

	; allocate new dst string
	call _ft_strlen
	inc rax
	mov r12, rdi
	mov rdi, rax
	call _malloc
	mov rdi, r12

	; check if malloc failed
	cmp rax, 0
	je end

cpy:
	mov rsi, rdi
	mov rdi, rax
	call _ft_strcpy
end:
	; return stack to its original state
	mov rsp, rbp
	pop rsi
	pop rdi
	pop rbp
	ret
