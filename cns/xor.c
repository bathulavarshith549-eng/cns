#include <stdio.h>

int main() {
    char s[] = "Hello World";
    int i;

    for(i = 0; s[i] != '\0'; i++)
        printf("%c", s[i] ^ 0);

    return 0;
}