[bits 16]                       ; 设置 16 位汇编
[org 0x7c00]                    ; 设置起始地址, BIOS 默认跳转地址为 0x7c00

;; 入口函数
entry:
    jmp main

;; 清屏
cls:
    pusha
    mov al, 0x03
    mov ah, 0x00
    int 0x10
    popa
    ret

;; 打印字符串
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

;; 主函数
main:
    call cls
    mov cx, 1                   ; 打印的计数器
repeat:
    mov si, msg                 ; 读取 msg 地址到 SI
    call putstr
    dec cx
    cmp cx, 0
    jne repeat
    hlt                         ; 系统休眠

;; 字符串常量定义
msg:
    db 'Hello, Jeffrey!', 0x0d, 0x0a
    db 0                        ; 字符串结束符

    times 510-($-$$) db 0       ; 填充多余的 510 个字节为零值
    dw 0xaa55                   ; BIOS 结束校验码
