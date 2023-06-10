14.l
%{
#include "y.tab.h"
extern int yyval;
%}
%%
[0-9]+ {yylval=atoi(yytext); return NUM;}
\n return 0;
. return *yytext;
%%
int yywrap(){
return 1;
}
14.y
%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char *);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%right NEGATIVE
%%
S: E {printf("\n");}
;
E: E '+' E {printf("+");}
 | E '*' E {printf("*");}
 | E '-' E {printf("-");}
 |E '/' E {printf("/");}
 | '(' E ')' 
 | '-' E %prec NEGATIVE {printf("-");}
 | NUM {printf("%d",yylval);}
 ;
%%
int main()
{
 yyparse();
}
void yyerror(char *msg)
{
 printf("error YACC: %s\n", msg);
}
