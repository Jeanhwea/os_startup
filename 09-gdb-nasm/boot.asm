[org 0x7c00]

BOOTSEG equ 0x07c0

start:
    jmpi    go, BOOTSEG
go: mov     ah, 0x0e
    mov     al, 0x58            ; char 'X'
    int     0x10                ; print char
    jmp     go
die:jmp     die

times 510-($-$$) db 0
dw 0xaa55
