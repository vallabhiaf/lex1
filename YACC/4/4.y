%{
#include<stdio.h>
#include<stdlib.h>
%}

%token A B nl
%left A B
%%
stmt:s nl	{printf("valid\n");exit(0);};
s:A s|s B|;
%%

int yyerror()
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
