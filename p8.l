%{
%}
digit [0-9]
alpha [a-zA-Z0-9]
%%
"<"{alpha}*{digit}*">" fprintf(yyout,"%s",yytext);
"<"[/]{alpha}*{digit}*">" fprintf(yyout,"%s",yytext);
. ;
%%
int yywrap(){};
int main()
{
	extern FILE *yyin,*yyout;
	yyin=fopen("htmlin.html","r");
	yyout=fopen("htmlout.html","w");
	yylex();
	return 0;
}










%{
#include<stdio.h>
%}

%%
"<"[^>]*">" fprintf(yyout,"%s",yytext);
. ;
%%

int yywrap(){}

int main(){
    extern FILE *yyin,*yyout;
    yyin = fopen("htmlin.html","r");
    yyout = fopen("htmlout.html","w");
    yylex();

    return 0;
}
