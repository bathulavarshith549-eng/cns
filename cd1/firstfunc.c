#include <stdio.h>
#include <ctype.h>

char p[10][20];
int n, f[26][128];

int main() {
    printf("Enter number of productions: ");
    scanf("%d", &n);

    printf("Enter productions (A=ab|#):\n");
    for (int i = 0; i < n; i++)
        scanf("%s", p[i]);

    int change = 1;

    while (change) {
        change = 0;

        for (int i = 0; i < n; i++) {
            int a = p[i][0] - 'A';

            for (int j = 2; p[i][j]; j++) {
                if (p[i][j] == '|')
                    continue;

                char c = p[i][j];

                if (!isupper(c)) {
                    if (!f[a][(int)c])
                        f[a][(int)c] = change = 1;
                    while (p[i][j+1] && p[i][j+1] != '|')
                        j++;
                    continue;
                }

                int b = c - 'A';
                for (int k = 0; k < 128; k++)
                    if (f[b][k] && !f[a][k]) {
                        f[a][k] = 1;
                        change = 1;
                    }
            }
        }
    }

    char c;
    printf("Enter non-terminal: ");
    scanf(" %c", &c);

    printf("FIRST(%c) = { ", c);
    for (int i = 0; i < 128; i++)
        if (f[c-'A'][i])
            printf("%c ", i);
    printf("}");

    return 0;
}