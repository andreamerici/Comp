/* Stampa delle linee precedute dal numero della loro posizione */

%{
#include <stdio.h>
int pos = 1;
%}
%option	noyywrap
line	.*\n
%%
{line}	{printf("%d %s", pos++, yytext);}
%%
void main()
{ 
  yylex(); 
}
