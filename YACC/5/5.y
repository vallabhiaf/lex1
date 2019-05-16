%{
#include<stdlib.h>
#include<stdio.h>
%}

%token num nl

%%
stmt: num num num num s nl	{printf("vaild\n");exit(0);};
s: num|num s;
%%

int yyerror(char * msg)
{
printf("invalid\n");
return 1;
}

int main()
{
printf("enter expression:");
yyparse();
return 0;
}
