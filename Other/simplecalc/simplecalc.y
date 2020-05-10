%{

                    /* From Aho, Lam, Sethi, Ullman, fig. 4.58 page 289 */
#include <ctype.h>
#include <stdio.h>
%}

%token DIGIT

%%
line   : expr '\n'       { printf("%d\n", $1); }
       ;
expr   : expr '+' term   { $$ = $1 + $3; }
       | term            { $$ = $1; }
       ;
term   : term '*' factor { $$ = $1 * $3; }
       | factor          { $$ = $1; }
       ;
factor : '(' expr ')'    { $$ = $2; }
       | DIGIT           { $$ = $1; }
       ;
%%
yylex (){
  int c;
  c = getchar();
  if (isdigit(c)) {
    yylval = c-'0';
    return DIGIT;
  }
  return c;
}

int yyerror(char* errstr) {
        printf("Error: %s\n", errstr);
        return 1;  
}

int main() {
  return yyparse();
}
