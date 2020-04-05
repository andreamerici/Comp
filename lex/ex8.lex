/* Sostituzione lettere maiuscole con minuscole, eccetto quelle nei commenti Pascal */

%{
#include <stdio.h>
#include <ctype.h>
%}
%option noyywrap
%%
[A-Z]	    {putchar(tolower(yytext[0]));}
\{[^\}]*\}  ECHO;
%%
void main()
{
  yylex();
}

