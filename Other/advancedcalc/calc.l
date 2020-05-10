%{

	/* From Aho, Lam, Sethi, Ullman, fig. 4.60, p. 295, extended
           by Hans Aberg and adapted to the LFC course by Mauro Leoncini. */


#include "calc.tab.h"

%}

digit		[0-9]
number		{digit}+\.?|{digit}*\.{digit}+

%%

[ \t]		{ /* Skip blanks and tabs. */ }
{number}	{ sscanf(yytext, "%lf", &yylval); return NUMBER; }
sqrt		{ return SQRT; }
sin             { return SIN; }
pi		{ return PI; }
quit|exit	{ return QUIT; }
\n|.		{ return yytext[0]; }

%%

