switch_protected_mode:
	cli			;disable interrupts
	lgdt [gdt_descriptor]	;load GDT
	mov bx, MSG_GDT
	call print16
	;set cr0 to tell CPU about PM but you can't do it directly
	mov eax, cr0
	or eax, 1
	mov cr0, eax
	jmp CODE_SEG:init_pm	;far jump flushes CPU pipeline

[bits 32]
init_pm:
	mov ax, DATA_SEG	;we need new segments
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

	mov ebp, 0x90000	;move stack to top of free space
	mov esp, ebp
	call protected_mode	;go back to main code
