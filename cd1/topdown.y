%{
#include <stdio.h>
%}

%token NUM

%%
E : E '+' T
  | T
  ;

T : T '*' F
  | F
  ;

F : '(' E ')'
  | NUM
  ;
%%

int main() {
    printf("Enter expression: ");
    if (yyparse() == 0)
        printf("Valid Expression\n");
    return 0;
}

int yyerror(char *s) {
    printf("Invalid Expression\n");
    return 0;
}