%{
#include<stdio.h>
#include<string.h>
char stk[20],optr[20][20],opnd[20][20];
int top=-1,v=1,i=0,j=0;
%}

%%
"(" {stk[++top]='(';}
"[" {stk[++top]='[';}
"{" {stk[++top]='{';}

")" { if(stk[top]!='(')
      {
      	v=0;
      	return;
      }
      else
      	  top-=1;
    }
    
"]" { if(stk[top]!='[')
      {
      	v=0;
      	return;
      }
      else
      	  top-=1;
    }

"}" { if(stk[top]!='{')
      {
      	v=0;
      	return;
      }
      else
      	  top-=1;
    }
    
"+"|"-"|"*"|"/"	{strcpy(optr[i++],yytext);}
[0-9]+|[a-zA-Z][a-zA-Z0-9_]*	{strcpy(opnd[j++],yytext);}
.|\n {}

%%

int yywrap()
{
return 1;
}

void main()
{
printf("enter expression:");
yylex();

if(v==1 && (j-i==1))
{
printf("\nVALID Expression\n");
printf("\noperators:");
for(int k=0;k<i;k++)
printf("%s ",optr[k]);

printf("\noperand:");
for(int k=0;k<j;k++)
printf("%s ",opnd[k]);
}
else
printf("\nINVALID Expression.");
}
