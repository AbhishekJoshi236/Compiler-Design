%{
#include<stdio.h>
int id_count= 0 ;
%}

%%
("int")|("float")|("double")|("if")|("else")|("switch")|("case")|("default") {}
[a-zA-Z_][a-zA-Z0-9_]* {id_count++; printf("\n %s is an identifier",yytext);}
END {return 0;}
.
%%

int yywrap(){}

int main(){
    printf("Enter a string: \n");
    yylex();

    printf("\nTotal no of identifier are %d",id_count);
    return 0;
}