#include <stdio.h>

#define get_seg_byte(seg, addr) ({                                      \
            register char __res;                                        \
            __asm__("push %%fs; mov %%ax, %%fs; movb %%fs:%2, %%al; pop %%fs;" \
                    : "=a" (__res)                                      \
                    : "0" (seg), "m" (*(addr)));                        \
            __res;})


int main (int argc, char *argv[])
{
    return 0;
}
