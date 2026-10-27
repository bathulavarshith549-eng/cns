
%{
#include <stdio.h>
int yylex();
void yyerror(const char *s) { printf("Invalid variable\n"); }
%}
%token ID INVALID
%%
start : ID { printf("Valid variable\n"); }
      | INVALID { printf("Invalid variable\n"); }
      ;
%%
int main() {
    printf("Enter variable: ");
    yyparse();
    return 0;
}
