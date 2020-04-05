/* Conteggio di caratteri, parole e linee (wc); parola = lista di caratteri non bianchi */

%{
#include <stdio.h>
int nc=0, nw=0, nl=0;
%}
%option noyywrap
word	[^ \t\n]+
eol	\n
%%
{word}	{nw++; nc+=yyleng;}
{eol}	{nl++; nc++;}
.	{nc++;}
%%
void main()
{
  yylex();
  printf("%d %d %d\n", nl, nw, nc);
}

