#include <stdio.h>

#define get_seg_byte(seg, addr) ({                  \
            register char __res;                    \
            __asm__("push %%fs\n\t"                 \
                    "mov %%ax, %%fs\n\t"            \
                    "movb %%fs:%2, %%al\n\t"        \
                    "pop %%fs"                      \
                    : "=a" (__res)                  \
                    : "0" (seg), "m" (*(addr)));    \
            __res;})


int main (int argc, char *argv[])
{
    char esp;
    __asm__("mov ax, esp": "=a" (esp));
    printf("esp = %x\n", esp);

    char seq[10] = {1, 2, 3, 4};
    int i = 2;
    char ans = get_seg_byte(seq, (i+seq));
    printf("ans = %02x\n", ans);
    return 0;
}
