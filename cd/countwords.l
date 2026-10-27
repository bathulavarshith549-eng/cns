%{
#include <stdio.h>
int w = 0, s = 0, l = 0;
%}

%%
[A-Za-z0-9]+  { w++; }
[^A-Za-z0-9 \t\n]  { s++; }
\n  { l++; }
[ \t]+  ;
%%

int main()
{
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Words = %d\n", w);
    printf("Special characters = %d\n", s);
    printf("Lines = %d\n", l + 1);
    return 0;
}

int yywrap()
{
    return 1;
}