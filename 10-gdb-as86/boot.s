BOOTSEG = 0x07c0

entry start
start:

go: mov     ax, #3
    dec     ax
    dec     ax
    dec     ax
    jmpi    go, #BOOTSEG

say:mov     ah, #0x0e
    mov     al, #0x58   ! char 'X'
    int     0x10        ! print char
die:jmp     die

.org 510
    .word   0xAA55
