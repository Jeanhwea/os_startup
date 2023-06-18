[bits 16]                       ; 设置 16 位汇编
[org 0x7c00]                    ; 设置起始地址, BIOS 默认跳转地址为 0x7c00

entry _start
_start:
    mov ax, #BOOTSEG
