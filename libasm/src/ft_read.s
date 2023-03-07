global _ft_read
extern ___error

%define READ_SYSCALL_NO 0x2000003

_ft_read:
	push rbp
	mov rbp, rsp
	and rsp, 0xFFFFFFFFFFFFFFF0

	mov rax, READ_SYSCALL_NO
	syscall
	jnc end
	mov rdx, rax
	call ___error
	mov [rax], rdx
	mov rax, -1
end:
	mov rsp, rbp
	pop rbp
	ret
