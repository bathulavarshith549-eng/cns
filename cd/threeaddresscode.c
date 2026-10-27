
#include <stdio.h>

int main() {
    char a, b, c;
    printf("Enter expression (a+b*c): ");
    scanf(" %c+%c*%c", &a, &b, &c);

    printf("t1 = %c * %c\n", b, c);
    printf("t2 = %c + t1\n", a);
    return 0;
}
