%{
#include <stdio.h>
#include <ctype.h>
extern int yydebug;
int yylex();
void yyerror();
%}

%token DIGIT

%%

line    :   expr '\n'  { printf("%d\n", $1); } 
        ;
expr    :   expr '+' term  { $$ = $1 + $3; } 
        |   term
        ;
term    :   term '*' factor  { $$ = $1 * $3; } 
        |   factor
        ;
factor  :   '(' expr ')' { $$ = $2; } 
        |   DIGIT
        ;
        
%%

int yylex()
{ int c;

  c = getchar(); 
  if (isdigit(c)){
    yylval = c - '0';
    return(DIGIT);
  }
  return(c);
}

void yyerror()
{ fprintf(stderr, "Syntax error\n"); }

void main()
{ yydebug = 1;
  yyparse(); }

