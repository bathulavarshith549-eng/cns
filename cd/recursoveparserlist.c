
#include <stdio.h>
#include <ctype.h>

char s[100];
int i = 0;

int S(), L();

int S() {
    if (isalpha(s[i])) {
        i++;
        return 1;
    }
    return 0;
}

int L() {
    if (!S()) return 0;

    while (s[i] == ',') {
        i++;
        if (!S()) return 0;
    }
    return 1;
}

int main() {
    printf("Enter list: ");
    scanf("%99s", s);

    if (L() && s[i] == '\0')
        printf("Valid string\n");
    else
        printf("Invalid string\n");

    return 0;
}
