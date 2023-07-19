[org 0x7c00]
    mov ax, 1
    inc ax
    inc ax
    inc ax
    inc ax
    inc ax
die:jmp die

times 510-($-$$) db 0
dw 0xaa55
