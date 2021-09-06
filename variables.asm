;strings
MSG_Welcome	db "Welcome to MILK.OS", 10, 13, "Please wait while we initialize the system.", 10, 13, "Reading disk...", 10, 13, 0
MSG_Disk_Error	db "Error while reading disk.", 10, 13, 0
MSG_GDT		db "GDT successfully initialized.", 10, 13, "Switching to 32-bit Protected Mode...", 0
MSG_PM		db "Protected Mode successfully loaded.", 0
MSG_Kernel_Load	db "Loading Kernel...", 0

;colors
CLRGreenOnBlack	equ 0x02
CLRRedOnBlack	equ 0x04
CLRWhiteOnBlack	equ 0x0f

;other information
boot_drive	db 0
VideoMemAddr	equ 0xb8000
;offset		db 0
