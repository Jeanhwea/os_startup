#include <string.h>
#include <stdio.h>

extern int myadd(int, int, int*);
extern void mywrite(int, char *, int);

int main (int argc, char *argv[])
{
    int a, b, ans;

    a = 1, b = 2;
    printf("addr = %p\n", (void *)&ans);
    myadd(a, b, &ans);
    printf("ans = %d\n", ans);

    // char buf[1024];
    // char *mystr = "Calculating ...\n";
    // char *emsg = "Error in handling\n";

    // mywrite(1, mystr, strlen(mystr));
    // if (myadd(a, b, &ans)) {
    //     sprintf(buf, "The answer is %d\n", ans);
    //     mywrite(1, buf, strlen(buf));
    // } else {
    //     mywrite(1, emsg, strlen(emsg));
    // }

    return 0;
}
