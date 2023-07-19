BOOTSEG = 0x07c0

entry start
start:
    jmpi    go, #BOOTSEG
    mov     ax, #1
    inc     ax
    inc     ax
    inc     ax
    xor     ax, ax

go: mov     ax, #99
    inc     ax
    inc     ax
    inc     ax
    inc     ax
    inc     ax

die:jmp     die

.org 510
    .word   0xAA55
