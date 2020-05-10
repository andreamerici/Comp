%{
        /* From Aho, Lam, Sethi, Ullman, fig. 4.61, p. 296, extended by Hans Aberg
           and adapted to the LFC course by Mauro Leoncini. */
#include <math.h>
#include <stdio.h>

#define YYSTYPE double
#define SUCCESS 0
#define FAILURE 1
%}

%token NUMBER
%token SQRT PI SIN
%token QUIT

%%
session: session expr '\n' { printf("%.12g\n", $2); }
     |	 session '\n'
     |   session QUIT '\n' { printf("Bye\n"); return SUCCESS; }
     |	 /* empty */
     |	 error '\n' 	   { printf("Please re-enter last line: "); yyerrok; }
     ;
expr:	 expr '+' term	   { $$ = $1 + $3; }
     |	 expr '-' term	   { $$ = $1 - $3; }
     |   term              { $$ = $1; }   /* Default action; written for clarity */
     ;
term:    term '*' factor   { $$ = $1 * $3; }
     |   term '/' factor   { if ($3==0.0) printf("Warning: divide by zero\n");  
                             $$ = $1 / $3; }
     |   factor            { $$ = $1; }   /* Default action; written for clarity */
     ;
factor:	 power '^' factor  { $$ = pow($1, $3); } 
     |   '-' factor        { $$ = -$2; }
     |   power             { $$ = $1; }   /* Default action; written for clarity */
     ;
power:   '(' expr ')'      { $$ = $2; }
     |   PI                { $$ = 4*atan(1); }
     |	 SQRT '(' expr ')' { if ($3<0.0) printf("Warning: negative sqrt argument\n"); 
                             $$ = sqrt($3); }
     |   SIN  '(' expr ')' { $$ = sin($3); }
     |	 NUMBER            { $$ = $1; }   /* Default action; written for clarity */
     ;
%%

int main() {
	return yyparse();
}

int yyerror(char* errstr) {
	printf("Error: %s\n", errstr);
	return FAILURE;  
}

