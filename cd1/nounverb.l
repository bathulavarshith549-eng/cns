%{
#include <stdio.h>
%}

%%
(cat|dog|boy|girl|book)  { printf("%s : Noun\n", yytext); }
(run|eat|play|write|read) { printf("%s : Verb\n", yytext); }
[a-zA-Z]+                { printf("%s : Unknown word\n", yytext); }
[ \t\n]+ ;
. ;
%%

int main() {
    printf("Enter a word:\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }