global ft_list_push_front

extern malloc

;	ARGS -> [RDI: void *data] 
;	RETURNS -> t_list *node

ft_list_new:
	push rdi
	mov rdi, 16 ;sizeof(t_list) -> void* + void* -> 8 + 8 -> 16, on the target architecture
	call malloc wrt ..plt
	pop rdi
	cmp rax, 0
	je .exit
	mov [rax], rdi
	mov qword [rax + 0x8], 0
.exit:
	ret

; ARGS -> [RDI: t_list **head, RSI: void *data]
; RETURNS -> None
ft_list_push_front:
	push rdi
	mov rdi, rsi
	call ft_list_new
	pop rdi
	cmp rax, 0
	je .end
	cmp qword [rdi], 0
	jne .add_front
	mov [rdi], rax
	jmp .end
.add_front:
	mov rdx, [rdi]		 ;rdx = *head
	mov [rax + 0x8], rdx ;ft_list_new()->next = rdx
	mov [rdi], rax		 ;*head = ft_list_new()
.end:
	ret