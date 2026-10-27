
%{
#include <stdio.h>
%}
%%
[AEIOUaeiou]  { printf("Vowel: %s\n", yytext); }
[A-Za-z]      { printf("Consonant: %s\n", yytext); }
[ \t\n]+      ;
.             ;
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
