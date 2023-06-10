15.l
%{
#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
%%
[a-z] {yylval=*yytext-'a'; return id;}
[0-9]+ {yylval=atoi(yytext); return digit;}
[-+()=/*\n] {return *yytext;}
[ \t] ;
. {printf("Invalid character\n"); exit(0);}
%%
int yywrap(){
return 1;
}
15.y
%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex();
int sym[26]={0};
%}
%token id digit
%left '+' '-'
%left '*' '/'
%%
P: P S '\n'
| ;
S: E {printf("Output: %d\n",$1);}
| id '=' E {sym[$1]=$3;}
E: digit {$$=$1;}
 |id {$$=sym[$1];}
 |E '+' E {$$=$1+$3;}
 |E '-' E {$$=$1-$3;}
 |E '*' E {$$=$1*$3;}
 |E '/' E {if($3) $$=$1/$3;
 else{yyerror("Error.. Division By Zero!!\n");}}
 | '(' E ')' {$$=$2;}
 ;
%%
int main()
{
 yyparse();
 return 0;
}
void yyerror(char *msg)
{
 fprintf(stderr,"%s\n", msg);
 exit(0);
}
