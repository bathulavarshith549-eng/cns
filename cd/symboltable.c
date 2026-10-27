
#include <stdio.h>
#include <string.h>

struct Symbol {
    char name[20];
    char type[10];
    int value;
};

int main() {
    struct Symbol s[10];
    int n = 0, ch, i;
    char key[20];

    while (1) {
        printf("\n1.Insert 2.Display 3.Search 4.Exit\nChoice: ");
        scanf("%d", &ch);

        if (ch == 1) {
            printf("Enter name, type and value: ");
            scanf("%19s %9s %d", s[n].name, s[n].type, &s[n].value);
            n++;
        }
        else if (ch == 2) {
            printf("\nName\tType\tValue\n");
            for (i = 0; i < n; i++)
                printf("%s\t%s\t%d\n", s[i].name, s[i].type, s[i].value);
        }
        else if (ch == 3) {
            printf("Enter name to search: ");
            scanf("%19s", key);
            for (i = 0; i < n; i++)
                if (strcmp(s[i].name, key) == 0) break;

            if (i < n)
                printf("Found: %s %s %d\n", s[i].name, s[i].type, s[i].value);
            else
                printf("Symbol not found\n");
        }
        else if (ch == 4)
            break;
    }
    return 0;
}
