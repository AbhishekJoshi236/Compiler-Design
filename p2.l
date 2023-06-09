%{
#include<stdio.h>
%}

%%
[0-9]+ {printf("\n%s is an integer.",yytext);}
[0-9]*"."[0-9]+ {printf("\n%s is an float number.",yytext);}
END {return 0;}
.
%%

int yywrap(){}

int main(){
    printf("Enter a number: \n");
    yylex();

    return 0;
}