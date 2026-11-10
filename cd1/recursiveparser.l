#include <stdio.h>
#include <string.h>
#include <ctype.h>

char s[100];
int i = 0;

void E();
void T();
void F();

void E() {
    T();
    while (s[i] == '+') {
        i++;
        T();
    }
}

void T() {
    F();
    while (s[i] == '*') {
        i++;
        F();
    }
}

void F() {
    if (s[i] == '(') {
        i++;
        E();
        if (s[i] == ')')
            i++;
        else {
            printf("Invalid Expression");
            return;
        }
    }
    else if (isalpha(s[i])) {
        while (isalnum(s[i]))
            i++;
    }
    else {
        printf("Invalid Expression");
        return;
    }
}

int main() {
    printf("Enter expression: ");
    scanf("%99s", s);

    E();

    if (s[i] == '\0')
        printf("Valid Expression");
    else
        printf("Invalid Expression");

    return 0;
}