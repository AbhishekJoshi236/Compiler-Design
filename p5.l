%{
int tot_ch=0;
int word=0;
int white_space=0;
%}

%%
[ \t] {white_space++;}
[^ \n\t]+ {word++; tot_ch+=yyleng;}
%%

int yywrap(){}

int main(){
    extern FILE *yyin;
    yyin = fopen("input.txt","r");
    yylex();
    printf("\n Total characters: %d",tot_ch);
    printf("\n Total words: %d",word);
    printf("\n Total white_spaces: %d",white_space);

    return 0;
}