%{
#include<stdio.h>
%}

%%
"//"[^\n]* ;
"/*"([^*]|[*]+[^/])*[*]+"/" ;
. {fprintf(yyout,"%s",yytext);}
%%

int yywrap(){}

int main(){

    extern FILE *yyin, *yyout;
    yyin = fopen("in.c","r");
    yyout = fopen("out.c","w");
    yylex();

    return 0;
}