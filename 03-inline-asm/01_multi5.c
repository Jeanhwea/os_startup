#include <stdio.h>

#define multi5(x) ({                                                \
            register int __ans;                                     \
            __asm__("leal (%1, %1, 4), %0": "=r"(__ans): "0"(x));   \
            __ans;                                                  \
        })

int main (int argc, char *argv[])
{
    int x, y;
    x = 3;

    // y = x * 5
    y = multi5(x);

    printf("y = %d\n", y);
    return 0;
}
