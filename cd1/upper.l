%{
#include <stdio.h>
int count = 0;
%}

%%
[A-Z]   { count++; }
.|\n    ;
%%

int main() {
    yyin = fopen("input.txt", "r");

    if (!yyin) {
        printf("File not found\n");
        return 1;
    }

    yylex();
    fclose(yyin);

    printf("Uppercase letters = %d\n", count);
    return 0;
}

int yywrap() { return 1; }