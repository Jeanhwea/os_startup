global _main

_main:
    mov edx, 13
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ebx, 0
    mov eax, 1
    int 0x80

msg:
    db "XXXXXXXX", 10
