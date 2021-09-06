gdt_null:		;necessary to be recognized as GDT
	dd 0
	dd 0

gdt_code:		;describe code segment
	dw 0xffff	;limit (bits 0-15)
	dw 0		;base (bits 0-15)
	db 0		;base (bits 16-23)
	db 10011010b	;1st flags & type flags
	db 11001111b	;2nd flags & limit (bits 16-19)
	db 0		;base (bits 24-31)

gdt_data:		;describe data segment
	dw 0xffff	;limit (bits 0-15)
	dw 0		;base (bits 0-15)
	db 0		;base (bits 16-23)
	db 10010010b	;1st flags & type flags
	db 11001111b	;2nd flags & limit (bits 16-19)
	db 0		;base (bits 24-31)

gdt_descriptor:		;actual descriptor: size and start address
	dw gdt_descriptor - gdt_null - 1
	dd gdt_null

;apparently those two constants are gonna be relevent or smth idk
CODE_SEG equ gdt_code - gdt_null
DATA_SEG equ gdt_data - gdt_null
