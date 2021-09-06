;load disk
disk_load: 
	mov [boot_drive], dl
	mov bx, 0x9000		;moving disk to 0x9000
	mov dh, 1		;number of sectors to load
	mov dl, [boot_drive]
	push dx
	mov ah, 2
	mov al, dh
	mov ch, 0
	mov dh, 0
	mov cl, 2
	int 0x13
	jc disk_error
	pop dx
	cmp dh, al
	jne disk_error
	ret
disk_error:
	mov bx, MSG_Disk_Error
	call print16
	jmp $
