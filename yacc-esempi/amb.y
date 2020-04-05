%{
#include <stdio.h>
int yylex();
void yyerror();
%}

%token IF ELSE OTHER

%%

S  :  I
   |  OTHER 
   ;

I  :  IF S 
   |  IF S ELSE S
   ;
        
%%

int yylex()
{ 
  return(0);
}

void yyerror()
{ fprintf(stderr, "Syntax error\n"); }

void main()
{ yyparse(); }

