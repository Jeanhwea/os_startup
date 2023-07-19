BOOTSEG = 0x07c0

entry start
start:
    jmpi    go, #BOOTSEG

go: mov     ax, cs
    mov     bx, 0xff
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     ss, ax
    mov     sp, #0x400             ! arbitrary value >>512
die:jmp     die


.org 510
    .word   0xAA55
