global _ft_atoi_base

extern _ft_strlen


;	rax, rcx, rdx, r8-r11 are volatile.
;	rbx, rbp, rdi, rsi, r12-r15 are nonvolatile.
;	NEVER FORGET :(

ft_isspace:
	mov rax, 1
	cmp [rdi], byte ' '
	je .exit
	cmp [rdi], byte 9
	jl .exit_false
	cmp [rdi], byte 13
	jg .exit_false
	jmp .exit
.exit_false:
	xor rax, rax
.exit:
	ret

ft_pos:
	xor rcx, rcx
.loop:
	cmp [rdi + rcx], byte 0
	je .end_notfound
	cmp [rdi + rcx], byte sil
	je .end
	inc rcx
	jmp .loop
.end_notfound:
	mov rcx, -1
.end:
	mov rax, rcx
	ret

ft_occcount:
	xor rcx, rcx
	push rdi
.loop:
	; get the next char position using ft_pos
	push rcx
	call ft_pos
	pop rcx
	cmp rax, 0
	jl .end

	; if found, advance string and look for it again
	inc rcx
	inc rax
	add rdi, rax
	jmp .loop
.end:
	pop rdi
	mov rax, rcx
	ret

ft_basevalid:
	push rsi
	push rdi

	; if the base has a size < 2, we simply cannot express any number in it
	call _ft_strlen
	cmp rax, 2
	jl .end_invalid

	; check each character
.loop:
	mov dl, byte [rdi]
	mov rax, 1

	; end of string
	cmp dl, byte 0
	je .end
	; == - ?
	cmp dl, byte '-'
	je .end_invalid
	; == '+' ?
	cmp dl, byte '+'
	je .end_invalid
	; == whitespace
	call ft_isspace
	cmp rax, 1
	je .end_invalid
	; more than one occurence of the character in the base
	movzx rsi, dl
	call ft_occcount
	cmp rax, 1
	jg .end_invalid
	; next char
	inc rdi
	jmp .loop
.end_invalid:
	xor rax, rax
.end:
	pop rdi
	pop rsi
	ret

; neg is in rcx
; tmp stuff in rdx
; converted number is in r9
; base length is in r8
_ft_atoi_base:
	push rdi
	push rsi
	xor r9, r9
	mov rcx, 1

	; check for valid base
	mov r10, rdi
	mov rdi, rsi
	call ft_basevalid
	cmp rax, 0
	je .end

	; get base len
	call _ft_strlen
	cmp rax, 0
	mov r8, rax
	mov rdi, r10
	dec rdi
.skip_spaces:
	inc rdi
	call ft_isspace
	cmp rax, 1
	je .skip_spaces
	dec rdi
.skip_signs:
	inc rdi
	mov dl, byte [rdi]
	cmp dl, byte '+'
	je .skip_signs
	cmp dl, byte '-'
	jne .convert_number
	imul rcx, -1
	jmp .skip_signs
.convert_number:
	mov dl, byte [rdi]

	; check if we reached end of string
	cmp dl, byte 0
	je .end

	; call ft_pos and save needed registers
	push rdi
	push rsi
	mov rdi, rsi
	movzx rsi, dl
	push rcx
	call ft_pos
	pop rcx
	mov rdx, rax
	pop rsi
	pop rdi

	; check if the character is in base
	cmp rdx, -1
	je .end

	; num = num * base_len + ft_pos(base, *arg0)
	imul r9, r8
	add r9, rdx

	; next
	inc rdi
	jmp .convert_number
.end:
	; apply neg if needed and restore callee-saved registers
	mov rax, r9
	imul rax, rcx
	pop rsi
	pop rdi
	ret
