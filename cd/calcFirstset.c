
#include <stdio.h>
#include <ctype.h>
#include <string.h>

char lhs[] = {'E','E','T','T','F','F'};
char *rhs[] = {"E+T","T","T*F","F","(E)","id"};
char first[3][10] = {"","",""};
char nt[] = {'E','T','F'};

int add(char *set, char c) {
    if (!strchr(set, c)) {
        int n = strlen(set);
        set[n] = c;
        set[n+1] = '\0';
        return 1;
    }
    return 0;
}

int main() {
    int change, i, j, k;
    do {
        change = 0;
        for (i = 0; i < 6; i++) {
            char c = rhs[i][0];
            int a = -1;

            for (j = 0; j < 3; j++)
                if (nt[j] == lhs[i]) a = j;

            if (isupper(c)) {
                for (j = 0; j < 3; j++)
                    if (nt[j] == c)
                        for (k = 0; first[j][k]; k++)
                            change |= add(first[a], first[j][k]);
            } else {
                change |= add(first[a], c == 'i' ? 'i' : c);
            }
        }
    } while (change);

    for (i = 0; i < 3; i++)
        printf("FIRST(%c) = { %s }\n", nt[i], first[i]);

    return 0;
}
