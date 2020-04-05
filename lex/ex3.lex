/* Sostituzione dei numeri dalla notazione decimale a quella esadecimale + 
   stampa del numero di sostituzioni effettive */
%{                                                                                           
#include  <stdio.h>
#include  <stdlib.h>
int cont  = 0;
%}
%option noyywrap
digit     [0-9]
num       {digit}+
%%
{num} {   int n = atoi(yytext);
          printf("%x", n);
          if (n > 9) cont++; }
%%
void main()
{
   yylex();
   fprintf(stderr, "Tot sostituzioni = %d\n", cont);
}

