.globl begtext, begdata, begbss, endtext, enddata, endbss ; ld86 linking

.text
begtext:
.data
begdata:
.bss
begbss:

.text

BOOTSEG=0x7c00                  ; BISO start address

entry start
start:
    jmpi go, BOOTSEG
go:
    mov ax, cs
    mov ds, ax
    mov es, ax

    mov [msg1+17], ah
    mov cx, #20
    mov dx, #0x1004
    mov bx, #0x000c
    mov bp, #msg1
    mov ax, #0x1301
    int 0x10

loop1: jmp loop1

msg1:
    .ascii "Loading system..."
    .byte 13, 10

.org 510                        ; start at 0x510
    .word 0xaa55                ; BIOS checksum

.text
endtext:
.data
enddata:
.bss
endbss:
