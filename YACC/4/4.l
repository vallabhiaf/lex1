%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
%}

%%
"a"|"A" {return A;}
"b"|"B" {return B;}
\n	{return nl;} 
.	{return yytext[0];}
%%

int yywrap()
{
return 1;
}
