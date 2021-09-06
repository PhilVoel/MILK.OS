[bits 32]
[extern main]	;tell linker that external symbol "main" exists
global _start
_start:
call main	;jump to main function
jmp $		;hang forever when returning
