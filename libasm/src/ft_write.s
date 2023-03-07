global _ft_write
extern ___error

%define WRITE_SYSCALL_NO 0x2000004

_ft_write:
	push rbp
	mov rbp, rsp
	and rsp, 0xFFFFFFFFFFFFFFF0

	mov rax, WRITE_SYSCALL_NO
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
