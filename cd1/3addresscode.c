#include <stdio.h>
#include <string.h>
#include <ctype.h>

char s[256], v[200][40];
int pos = 0, n = 0, temp = 1, error = 0;

void space() {
    while (isspace(s[pos])) pos++;
}

int value(char *x) {
    strcpy(v[n], x);
    return n++;
}

int expr();

int factor() {
    char x[40];
    int i = 0, r;

    space();

    if (s[pos] == '(') {
        pos++;
        r = expr();
        space();

        if (s[pos] == ')') pos++;
        else error = 1;

        return r;
    }

    if (!isalnum(s[pos]) && s[pos] != '_') {
        error = 1;
        return 0;
    }

    while (isalnum(s[pos]) || s[pos] == '_') {
        if (i < 38) x[i++] = s[pos];
        pos++;
    }

    x[i] = '\0';
    return value(x);
}

int term() {
    int a = factor(), b;
    char op, t[40];

    space();

    while (s[pos] == '*' || s[pos] == '/') {
        op = s[pos++];
        b = factor();

        sprintf(t, "t%d", temp++);
        printf("%s = %s %c %s\n", t, v[a], op, v[b]);
        a = value(t);
    }

    return a;
}

int expr() {
    int a = term(), b;
    char op, t[40];

    space();

    while (s[pos] == '+' || s[pos] == '-') {
        op = s[pos++];
        b = term();

        sprintf(t, "t%d", temp++);
        printf("%s = %s %c %s\n", t, v[a], op, v[b]);
        a = value(t);
    }

    return a;
}

int main() {
    printf("Enter expression: ");
    fgets(s, sizeof(s), stdin);

    int r = expr();
    space();

    if (error || s[pos] != '\0')
        printf("Invalid Expression\n");
    else
        printf("Final Result: %s\n", v[r]);

    return 0;
}