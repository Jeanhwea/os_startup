#include <stdio.h>

int main (int argc, char *argv[])
{
    __uint64_t ret;
    __asm__ volatile
        (
         "movq $123456789, %%rax;"
         "movq %%rax, %0"
         :"=r"(ret)
         );

    printf("ret is: %ld\n", ret);
    return 0;
}
