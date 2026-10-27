
%{
#include <stdio.h>
int yylex();
void yyerror(const char *s) { printf("Invalid expression\n"); }
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
input : expr '\n' { printf("Result = %d\n", $1); }
      ;
expr  : expr '+' expr { $$ = $1 + $3; }
      | expr '-' expr { $$ = $1 - $3; }
      | expr '*' expr { $$ = $1 * $3; }
      | expr '/' expr { $$ = $1 / $3; }
      | '(' expr ')'  { $$ = $2; }
      | NUM           { $$ = $1; }
      ;
%%
int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}
