%{
#include <stdio.h>
int a, b;
char op;
%}

%%
[0-9]+  {
    a = atoi(yytext);
    printf("Enter operator and second number: ");
    scanf(" %c %d", &op, &b);

    switch(op)
    {
        case '+': printf("Result = %d\n", a+b); break;
        case '-': printf("Result = %d\n", a-b); break;
        case '*': printf("Result = %d\n", a*b); break;
        case '/': printf("Result = %d\n", a/b); break;
    }
    return 0;
}
%%

int main()
{
    printf("Enter first number: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}