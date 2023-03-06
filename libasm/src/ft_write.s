global ft_write
extern __errno_location

%define WRITE_SYSCALL_NO 1

ft_write:
	push rbp
	mov rbp, rsp
	and rsp, 0xFFFFFFFFFFFFFFF0

	mov rax, WRITE_SYSCALL_NO
	syscall
	cmp rax, 0
	jge end
	neg rax
	mov rdx, rax
	call __errno_location wrt ..plt
	mov [rax], rdx
	mov rax, -1
end:
	mov rsp, rbp
	pop rbp
	ret
