
%{
#include <stdio.h>
int yylex();
void yyerror(const char *s) { printf("Invalid expression\n"); }
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
input : E '\n' { printf("Result = %d\n", $1); }
      ;
E : E '+' E { $$ = $1 + $3; }
  | E '-' E { $$ = $1 - $3; }
  | E '*' E { $$ = $1 * $3; }
  | E '/' E { $$ = $1 / $3; }
  | '(' E ')' { $$ = $2; }
  | NUM { $$ = $1; }
  ;
%%
int main() {
    printf("Enter expression: ");
    return yyparse();
}



