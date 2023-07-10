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
    return 0;
}
