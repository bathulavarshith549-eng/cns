
%{
#include <stdio.h>
%}
%%
"int"|"float"|"char"|"if"|"else"|"while"|"return"|"for"
    { printf("Reserved word: %s\n", yytext); }
[A-Za-z_][A-Za-z0-9_]*
    { printf("Identifier: %s\n", yytext); }
[ \t\n]+ ;
. ;
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
