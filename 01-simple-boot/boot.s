[bits 16]    ; 设置 16 位汇编
[org 0x7c00] ; 设置起始地址

init:
  mov SI, msg  ; 读取 msg 地址到 SI
  mov AH, 0x0e ; teletype

print_char:
  lodsb          ; 从 SI 中读取 1 byte 到 AL, 然后 SI++
  cmp AL, 0      ; AL 是否为 0
  je done        ; if AL == 0, jump to "done"
  int 0x10       ; 中断向屏幕输出一个字符
  jmp print_char ; 循环读取下一个字符
done:
  hlt            ; 停止

msg:
    db "Hello world!",
    db 0 ; we need to explicitely put the zero byte here

times 510-($-$$) db 0 ; 填充多余的 510 个字节为零值
dw 0xaa55             ; BIOS 结束校验码
