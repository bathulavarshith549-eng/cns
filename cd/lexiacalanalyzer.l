
%{
#include <stdio.h>
%}
%%
"int"|"float"|"char"|"if"|"else"|"while"|"return"  { printf("Keyword: %s\n", yytext); }
[A-Za-z_][A-Za-z0-9_]*  { printf("Identifier: %s\n", yytext); }
[0-9]+                  { printf("Number: %s\n", yytext); }
[+*/=-]                 { printf("Operator: %s\n", yytext); }
[ \t\n]+                ;
.                       { printf("Special: %s\n", yytext); }
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
