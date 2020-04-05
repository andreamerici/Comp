/* Stampa delle linee che iniziano o terminano con il carattere a */

%{
#include <stdio.h>
%}
%option noyywrap
a_line     ^a.*\n
line_a     .*a\n
%%
{a_line} ECHO;
{line_a} ECHO;
.*\n      ;
%%
void main()
{
   yylex();
}


