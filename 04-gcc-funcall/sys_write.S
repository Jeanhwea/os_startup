SYSWRITE = 4
.globl mywrite, myadd

.text
mywrite:
    push %rbp
    mov %rsp, %rbp
    push %rbx
    mov 8(%rbp), %ebx           # int fd
    mov 12(%rbp), %ecx          # char *buf
    mov 16(%rbp), %edx          # int count
    mov $SYSWRITE, %eax         # sys call number = 4
    int $0x80
    pop %rbx
    mov %rbp, %rsp
    pop %rbp
    ret

myadd:
    push %rbp
    mov %rsp, %rbp
    mov %esi, %eax              # int a
    mov %edi, %edx              # int b
    xor %ecx, %ecx              # overflow if %rcx = 0
    add %eax, %edx
    jo  1f                      # jmp if overflow
    mov 22(%rbp), %rax
    mov %edx, (%rax)
1:  mov %ecx, %eax
    mov %rbp, %rsp
    pop %rbp
    ret
