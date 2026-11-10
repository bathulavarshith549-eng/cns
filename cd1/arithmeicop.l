%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
[0-9]+[+\-*/][0-9]+ {
    int a,b;
    char op;
    sscanf(yytext,"%d%c%d",&a,&op,&b);

    switch(op) {
        case '+': printf("Result = %d\n",a+b); break;
        case '-': printf("Result = %d\n",a-b); break;
        case '*': printf("Result = %d\n",a*b); break;
        case '/':
            if(b!=0) printf("Result = %d\n",a/b);
            else printf("Division by zero\n");
            break;
    }
}
\n ;
.  { printf("Invalid input\n"); }
%%

int main() {
    printf("Enter expression: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}