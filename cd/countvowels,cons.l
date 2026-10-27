%{
#include <stdio.h>
int v = 0, c = 0;
%}

%%
[AEIOUaeiou]  { v++; }
[B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z]  { c++; }
.|\n  ;
%%

int main()
{
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Vowels = %d\nConsonants = %d\n", v, c);
    return 0;
}

int yywrap()
{
    return 1;
}