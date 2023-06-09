%{
#include<stdio.h>
%}

%s A B C DEAD

%%
<INITIAL>a BEGIN C;
<INITIAL>b BEGIN A;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>[\n] BEGIN INITIAL; {printf("\nACCEPTED\n");}

<A>a BEGIN B;
<A>b BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;
<A>[\n] BEGIN INITIAL; {printf("\nNOT ACCEPTED\n");}

<B>a BEGIN A;
<B>b BEGIN C;
<B>[^ab\n] BEGIN DEAD;
<B>[\n] BEGIN INITIAL; {printf("\nNOT ACCEPTED\n");}

<C>a BEGIN INITIAL;
<C>b BEGIN B;
<C>[^ab\n] BEGIN DEAD;
<C>[\n] BEGIN INITIAL; {printf("\nNOT ACCEPTED\n");}
%%

int yywrap(){}

int main(){
    printf("Enter a string: \n");
    yylex();
    return 0;
}