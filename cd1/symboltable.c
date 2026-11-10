
#include <stdio.h>
#include <string.h>

struct Symbol {
    char name[20], type[20];
    int value;
};

int main() {
    struct Symbol s[50];
    int n = 0, ch, i;
    char key[20];

    while (1) {
        printf("\n\n1.Insert  2.Display  3.Search  4.Exit");
        printf("\nEnter choice: ");

        if (scanf("%d", &ch) != 1)
            return 0;

        switch (ch) {

        case 1:
            if (n == 50) {
                printf("Symbol table is full!");
                break;
            }

            printf("Enter name, type and value: ");
            scanf("%19s %19s %d",
                  s[n].name, s[n].type, &s[n].value);
            n++;
            printf("Inserted successfully!");
            break;

        case 2:
            printf("\nName\tType\tValue\n");
            for (i = 0; i < n; i++)
                printf("%s\t%s\t%d\n",
                       s[i].name, s[i].type, s[i].value);
            break;

        case 3:
            printf("Enter name to search: ");
            scanf("%19s", key);

            for (i = 0; i < n; i++) {
                if (strcmp(s[i].name, key) == 0) {
                    printf("Found: %s %s %d",
                           s[i].name, s[i].type, s[i].value);
                    break;
                }
            }

            if (i == n)
                printf("Symbol not found!");
            break;

        case 4:
            return 0;

        default:
            printf("Invalid choice!");
        }
    }
}
