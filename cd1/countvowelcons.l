%{
#include <stdio.h>
int v = 0, c = 0;
%}

%%
[aeiouAEIOU]  { v++; }
[a-zA-Z]      { c++; }
.|\n          ;
%%

int main() {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        printf("File not found\n");
        return 1;
    }

    yylex();
    printf("Vowels = %d\nConsonants = %d\n", v, c);
    fclose(yyin);
    return 0;
}

int yywrap() { return 1; }