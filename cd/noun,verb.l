
%{
#include <stdio.h>
%}
%%
"boy"|"girl"|"book"|"Ram"|"school"  { printf("Noun\n"); }
"run"|"eat"|"play"|"write"|"read"   { printf("Verb\n"); }
[A-Za-z]+                            { printf("Unknown word\n"); }
[ \t\n]+ ;
. ;
%%
int main() { yylex(); return 0; }
int yywrap() { return 1; }
