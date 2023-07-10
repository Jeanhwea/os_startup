    .intel_syntax noprefix
    .section .text
    .global main

main:
    mov al, 0x65
    mov ah, 0xa3
    add ah, al

    mov ebx, 0
    mov eax, 1
    int 0x80
