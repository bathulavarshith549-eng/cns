%{
#include <stdio.h>
int c = 0;
%}

%%
[A-Z]  { printf("%s ", yytext); c++; }
.|\n   ;
%%

int main()
{
    yyin = fopen("input.txt", "r");
    yylex();
    printf("\nTotal uppercase letters = %d\n", c);
    return 0;
}

int yywrap()
{
    return 1;
}