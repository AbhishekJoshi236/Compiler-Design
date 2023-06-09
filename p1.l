%{
int line_count = 0;
int space_count = 0;
int tab_count = 0;
int other_count = 0;
%}

%%
\n    { line_count++; }
[ ]   { space_count++; }
\t    { tab_count++; }
END   {return 0;}
.     { other_count++; }
%%

int yywrap(){}

int main() {
    yylex();
    printf("Line count: %d\n", line_count);
    printf("Space count: %d\n", space_count);
    printf("Tab count: %d\n", tab_count);
    printf("Other count: %d\n", other_count);
    return 0;
}
