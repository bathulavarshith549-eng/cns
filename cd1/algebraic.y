%{
#include <stdio.h>
%}
%token NUM
%left '+' '-'
%left '*' '/'

%%
E : E '+' E { $$=$1+$3; }
  | E '-' E { $$=$1-$3; }
  | E '*' E { $$=$1*$3; }
  | E '/' E { $$=$1/$3; }
  | '(' E ')' { $$=$2; }
  | NUM { $$=$1; }
  ;
%%

int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}
int yyerror(char *s) {
    printf("Invalid expression\n");
    return 0;
}