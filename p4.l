%{
#include <stdio.h>
%}

%%
"+"|"-"|"*"|"/"        { printf("Operator: %s\n", yytext); }
"=="|"<"|">"|"<="|">=" { printf("Operator: %s\n", yytext); }
"="                    { printf("Assignment Operator\n"); }
"(" | ")" | "{" | "}"  { printf("Separator: %s\n", yytext); }
"if"|"else"|"while"    { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[ \t\n]                { /* Ignore whitespace and newlines */ }
.                      { printf("Unknown Token: %s\n", yytext); }
%%

int yywrap(){}

int main() {
    printf("Enter an expression: \n");
    yylex();
    return 0;
}
