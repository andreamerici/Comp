/* Sostituzione dei numeri con valore >= 10 da notazione decimale a esadecimale + 
   stampa del numero di sostituzioni */
%{                                                                                           
#include  <stdio.h>
#include  <stdlib.h>
int cont  = 0;
%}
%option noyywrap
digit     [0-9]
num       {digit}{digit}+
%%
{num} {   int n = atoi(yytext);
          printf("%x", n);
          cont++; }
%%
void main()
{
   yylex();
   fprintf(stderr, "Tot sostituzioni = %d\n", cont);
}

