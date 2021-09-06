;16 bit print function
print16:
	pusha
	mov ah, 0x0e
print16_loop:
	mov al, [bx]
	cmp al, 0
	je print16_end
	int 0x10	
	add bx, 1
	jmp print16_loop
print16_end:
	popa
	ret

[bits 32]
;32 bit print function
print32:
	pusha
print32_loop:
	mov al, [ebx] 
	cmp al, 0
	je print32_end
	mov [edx], ax
	add ebx, 1
	add edx, 2
	jmp print32_loop
print32_end:
	popa
	ret

;32 bit clear screen
clear:
	mov edx, VideoMemAddr
	pusha
	mov ax, 0
clear_loop:
	cmp edx, VideoMemAddr + 4000
	je clear_end
	mov [edx], ax
	add edx, 1
	jmp clear_loop
clear_end:
	popa
	ret
[bits 16]
