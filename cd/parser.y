
%{
#include <stdio.h>
int yylex();
void yyerror(const char *s) { }
%}
%token ID
%%
E : E '+' T
  | T
  ;
T : T '*' F
  | F
  ;
F : '(' E ')'
  | ID
  ;
%%
int main() {
    printf("Enter expression: ");
    if (yyparse() == 0)
        printf("Valid expression\n");
    return 0;
}
