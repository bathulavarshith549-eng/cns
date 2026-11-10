%{
#include <stdio.h>
%}

%%
"int"|"float"|"char"    { printf("%s : KEYWORD\n", yytext); }
[a-zA-Z][a-zA-Z0-9]*    { printf("%s : IDENTIFIER\n", yytext); }
[0-9]+                 { printf("%s : CONSTANT\n", yytext); }
[+\-*/=]               { printf("%s : OPERATOR\n", yytext); }
[ \t\n]+               ;
.                      { printf("%s : SPECIAL SYMBOL\n", yytext); }
%%

int main() {
    printf("Enter input:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}