void swap(int *a, int *b)
{
    int c;
    c = *a; *a = *b; *b = c;
}

int main (int argc, char *argv[])
{
    int a, b;
    a = 16; b = 32;
    swap(&a, &b);
    return (a - b);
}
