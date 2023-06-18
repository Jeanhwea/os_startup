[bits 16]                       ; 设置 16 位汇编
[org 0x7c00]                    ; 设置起始地址, BIOS 默认跳转地址为 0x7c00

_start:
    jmp main

putstr:
    pusha
    mov ah, 0x0e                ; 设置中断为输出一个字符, teletype
putc_begin:
    lodsb                       ; 从 SI 中读取 1 byte 到 AL, 然后 SI++
    cmp al, 0                   ; AL 是否为 0
    je putc_end                 ; if AL == 0, 函数返回
    int 0x10                    ; 中断向屏幕输出一个字符
    jmp putc_begin              ; 循环读取下一个字符
putc_end:
    popa
    ret

main:
    mov cx, 5
repeat:
    mov si, msg                 ; 读取 msg 地址到 SI
    call putstr
    dec cx
    cmp cx, 0
    jne repeat
    hlt                         ; 系统休眠

msg:
    db 'Hello, Jeffrey!', 0x0d, 0x0a
    db 0                        ; 字符串结束符

    times 510-($-$$) db 0       ; 填充多余的 510 个字节为零值
    dw 0xaa55                   ; BIOS 结束校验码
