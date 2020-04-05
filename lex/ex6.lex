/* Stampa delle linee che iniziano e terminano con il carattere a
   e contengono altri caratteri, tutti diversi da a  */

%{
#include <stdio.h>
%}
%option noyywrap
a_line_a     ^a[^a\n]+a\n
%%
{a_line_a} ECHO;
.*\n      ;
%%
void main()
{
   yylex();
}


