%{
#include <stdio.h>
%}

%%
"int"|"float"|"char"|"if"|"else"|"while"|"return"
    { printf("%s : Reserved Keyword\n", yytext); }

[a-zA-Z][a-zA-Z0-9]*
    { printf("%s : Identifier\n", yytext); }

[ \t\n]+ ;
. ;
%%

int main() {
    printf("Enter words:\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }