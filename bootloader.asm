[org 0x7c00]

;print welcome message
mov bx, MSG_Welcome
call print16

;set stack to 0x8000
mov bp, 0x8000
mov sp, bp

;load disk and test
call disk_load
mov bx, 0x9000
call print16

;switch to protected mode
call switch_protected_mode	;Good-bye, BIOS! We will never forget you.

jmp $				;prevent shit from happening by looping

[bits 32]
protected_mode:
call clear
mov edx, VideoMemAddr
mov ah, CLRWhiteOnBlack
mov ebx, MSG_PM
call print32
mov edx, VideoMemAddr + 160
mov ebx, MSG_Kernel_Load
call print32

jmp $				;prevent shit from happening by looping

[bits 16]
%include "variables.asm"
%include "print.asm"
%include "disk.asm"
%include "gdt.asm"
%include "proteccmode.asm"

times 510-($-$$) db 0		;fill rest with 0s
dw 0xaa55			;magic number tells BIOS that this is a boot sector

db "Disk successfully read.", 10, 13, "Initializing GDT...", 10, 13, 0 ;will be printed after loading disk
