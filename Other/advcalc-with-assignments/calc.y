%{
	/* From Levine, Mason, Brown, Lex & Yacc, O'Reilly.
           Examples 3.4, 3.5, 3.6, and 3.7, adapted to the LFC
           course by M. Leoncini. */

#include "calc.h"
#include <stdio.h>
%}

%union {
  double dval;
  struct symtbl *symptr;
}
%type <dval> expr
%type <dval> term
%type <dval> factor
%type <dval> power
%token <dval> NUMBER;
%token <symptr> ID;
%token SQRT PI
%token QUIT
%%
session:   session statement '\n'
     |	   session '\n'
     |     session QUIT '\n' { printf("Bye\n"); return SUCCESS; }
     |	   /* empty */
     |	   error '\n' 	     { printf("Please re-enter last line: "); yyerrok; }
     ;
statement: ID '=' expr       { $1->value = $3; printf("= %g\n", $3); }
     |     expr              { printf("= %g\n", $1); }
expr:	   expr '+' term     { $$ = $1 + $3; }
     |	   expr '-' term     { $$ = $1 - $3; }
     |     term              { $$ = $1; }   /* Default action; written for clarity */
     ;
term:      term '*' factor   { $$ = $1 * $3; }
     |     term '/' factor   { if ($3==0.0) printf("Warning: divide by zero\n"); $$ = $1/$3;}
     |     factor            { $$ = $1; }   /* Default action; written for clarity */
     ;
factor:	 power '^' factor    { $$ = pow($1, $3); } 
     |   '-' factor          { $$ = -$2; }
     |   power               { $$ = $1; }   /* Default action; written for clarity */
     ;
power:   '(' expr ')'        { $$ = $2; }
     |   PI                  { $$ = 4*atan(1); }
     |	 SQRT '(' expr ')'   { if ($3<0.0) printf("Warning: negative sqrt argument\n"); 
                                  $$ = sqrt($3); }
     |	 NUMBER              { $$ = $1; }   /* Default action; written for clarity */
     |   ID                  { $$ = $1->value; }
     ;
%%



int main() {
	return yyparse();
}

int yyerror(char* errstr) {
	printf("Error: %s\n", errstr);
	return FAILURE;  
}

