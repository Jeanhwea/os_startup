BOOTSEG = 0x07c0

entry start
start:
    jmpi    go, #BOOTSEG

go: mov     ah, #0x0e
    mov     al, #0x58   ! char 'X'
    int     0x10        ! print char

die:jmp     die

.org 510
    .word   0xAA55
