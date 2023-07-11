#include <string.h>
#include <stdio.h>

extern int myadd(int, int, int*);
extern void mywrite(int, char *, int);

int main (int argc, char *argv[])
{
    char buf[1024];
    int a, b, ans;

    char *mystr = "Calculating ...\n";
    char *emsg = "Error in handling\n";

    a = 5, b = 10;
    mywrite(1, mystr, strlen(mystr));
    if (myadd(a, b, &ans)) {
        sprintf(buf, "The answer is %d\n", ans);
        mywrite(1, buf, strlen(buf));
    } else {
        mywrite(1, emsg, strlen(emsg));
    }

    return 0;
}
