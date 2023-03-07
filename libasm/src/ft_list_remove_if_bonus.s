global _ft_list_remove_if

extern _free

; ARGS -> [RDI: t_list **head, RSI: t_list *to_remove]
; WORKING -> [R8: to_remove_prev, R9: to_remove_search, R10: to_remove->next (tmp)]
; RETURNS -> void
ft_list_remove_pointers:
	push rdi
	; working regs
	mov r8, [rdi]
	; check if *head != to_remove
	cmp [rdi], rsi
	jne .change_any
	; *head == to_remove, simply remove it and call free
	mov r10, [rsi + 0x08]
	mov qword [rdi], r10
	mov rdi, rsi
	jmp .free_rdi
.change_any:
	; find the one to delete
	mov r9, [r8 + 0x08]
	cmp r9, rsi
	je .delete
	mov r8, r9
	jmp .change_any
.delete:
	; get to_delete->next in r10 then set to_remove_prev->next to it
	mov r10, [rsi + 0x08]
	mov [r8 + 0x08], r10
	mov rdi, rsi
.free_rdi:
	; free and ret
	call _free
	pop rdi
	ret

; ARGS -> [RDI: t_list **head, RSI: void *data_ref, RDX: int (*cmp)(void*,void*), RCX: void (*free_fct)(void*)]
; WORKING -> [R8: traverser->next, RBX: arg1, R12: t_list traverser, R13: arg2, R14: arg3, R15: arg4, R9: temporary store for list **head]
; RETURNS -> void
_ft_list_remove_if:
	; all the registers we need to save
	; since System V calling convention has different sources for regs rdi and rsi, save them
	push rdi
	push rsi
	mov rbx, rdi
	mov r13, rsi
	mov r14, rdx
	mov r15, rcx
	mov r12, [rdi]
.loop:
	; t_list* == NULL ?
	cmp r12, 0
	je .end

	; save node->next
	mov r8, [r12 + 0x08]
	push r8

	; call cmp function on data 
	mov rdi, [r12 + 0x00]
	mov rsi, r13
	call r14

	; if == 0 remove, else next node
	cmp rax, 0
	je .loop_remove
	jmp .loop_remove_next
.loop_remove:
	; call remove function to free the data
	mov rdi, [r12 + 0x00]
	call r15

	; calls function to remove the element from the list and relink it
	mov rdi, rbx
	mov rsi, r12
	call ft_list_remove_pointers
.loop_remove_next:
	; get next node from stack and loop again
	pop r12
	jmp .loop
.end:
	pop rsi
	pop rdi
	ret
