global _ft_list_sort

extern _ft_list_size

; ARGS -> [RDI: t_list **head, RSI: int (*cmp)(void*,void*)]
; WORKING -> [R12: t_list **head, R13: t_list *traverser, R14: cmp func]
; RETURNS -> void
_ft_list_sort:
	mov r12, rdi
	mov r14, rsi
	
	; get list len
	mov rdi, [rdi]
	call _ft_list_size

	; use len as the number of iters
	mov rcx, rax
.loop1:
	; load head into r13 and sort one item in the list
	mov r13, [r12]
	cmp rcx, 0
	je .end
.loop2:
	; if we are at the last element of the list then go iter again over the whole list
	cmp qword [r13 + 0x08], 0
	je .next_loop1

	mov rdi, [r13 + 0x00]
	mov rsi, [r13 + 0x08]
	mov rsi, [rsi + 0x00]
	; call cmp func, rcx safe
	push rcx
	call r14
	pop rcx
	; eax instead of rax since the return value is 32bit wide, otherwise it doesnt detect that the return value was signed, since the highest bit is never set
	; took me 2 hours to fix...
	cmp eax, 0
	jle .next_loop2

	; swap values
	mov rdi, [r13 + 0x00]
	mov r8,  [r13 + 0x08]
	mov rsi,  [r8 + 0x00]
	mov [r13 + 0x00], rsi
	mov [r8 + 0x00], rdi
.next_loop2:
	; move node in list
	mov r13, [r13 + 0x08]
	jmp .loop2
.next_loop1:
	; next node to sort
	dec rcx
	jmp .loop1
.end:
	mov rdi, r12
	mov rsi, r14
	ret
