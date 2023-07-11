SYSWRITE = 4
.globl mywrite, myadd

.text
mywrite:
    push %rbp
    mov %rsp, %rbp
    push %rbx
    mov 8(%rbp), %rbx           # int fd
    mov 12(%rbp), %rcx          # char *buf
    mov 16(%rbp), %rdx          # int count
    mov $SYSWRITE, %rax         # sys call number = 4
    int $0x80
    pop %rbx
    mov %rbp, %rsp
    pop %rbp
    ret

myadd:
    push %rbp
    mov %rsp, %rbp
    mov 8(%rbp), %rax           # int a
    mov 12(%rbp), %rdx          # int b
    xor %rcx, %rcx              # overflow if %rcx = 0
    add %rax, %rdx
    jo  1f                      # jmp if overflow
    mov 16(%rbp), %rax
    mov %rdx, (%rax)
    inc %rcx
1:  mov %rcx, %rax
    mov %rbp, %rsp
    pop %rbp
    ret
