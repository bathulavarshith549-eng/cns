#include <stdio.h>
#include <ctype.h>

char s[100];
int i = 0;

void S();
void L();
void L1();

void S() {
    if (isalpha(s[i])) {
        i++;
        while (isalnum(s[i]))
            i++;
    }
    else {
        printf("Invalid");
    }
}

void L() {
    S();
    L1();
}

void L1() {
    if (s[i] == ',') {
        i++;
        S();
        L1();
    }
}

int main() {
    printf("Enter list: ");
    scanf("%99s", s);

    L();

    if (s[i] == '\0')
        printf("Valid List");
    else
        printf("Invalid List");

    return 0;
}