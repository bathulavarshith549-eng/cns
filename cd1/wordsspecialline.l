%{
#include <stdio.h>
int words=0, special=0, lines=0;
%}

%%
[A-Za-z0-9]+  { words++; }
\n            { lines++; }
[^A-Za-z0-9 \t\n] { special++; }
[ \t]+        ;
%%

int main() {
    yyin = fopen("input.txt", "r");

    if (!yyin) {
        printf("File not found\n");
        return 1;
    }

    yylex();

    printf("Words = %d\n", words);
    printf("Special Characters = %d\n", special);
    printf("Lines = %d\n", lines + 1);

    fclose(yyin);
    return 0;
}

int yywrap() { return 1; }