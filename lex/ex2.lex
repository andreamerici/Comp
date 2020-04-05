/* Stampa delle linee in posizione dispari */

%{
#include <stdio.h>
int pos = 1;
%}
%option	noyywrap
line	.*\n
%%
{line}	{ if(pos++%2)
            printf("%s", yytext);
        }
%%
void main()
{
  yylex();
}
