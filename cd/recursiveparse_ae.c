
#include <stdio.h>
#include <ctype.h>

char s[100];
int i = 0;

int E(), T(), F();

int E() {
    if (!T()) return 0;
    while (s[i] == '+') {
        i++;
        if (!T()) return 0;
    }
    return 1;
}

int T() {
    if (!F()) return 0;
    while (s[i] == '*') {
        i++;
        if (!F()) return 0;
    }
    return 1;
}

int F() {
    if (isalnum(s[i])) {
        i++;
        return 1;
    }
    if (s[i] == '(') {
        i++;
        if (E() && s[i] == ')') {
            i++;
            return 1;
        }
    }
    return 0;
}

int main() {
    printf("Enter expression: ");
    scanf("%99s", s);

    if (E() && s[i] == '\0')
        printf("Valid expression\n");
    else
        printf("Invalid expression\n");

    return 0;
}
