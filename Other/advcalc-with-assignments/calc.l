%{

	/* From Levine, Mason, Brown, Lex & Yacc, O'Reilly.
           Examples 3.4, 3.5, 3.6, and 3.7, adapted to the LFC
           course by M. Leoncini. */

#include "calc.tab.h"
#include "calc.h"
%}

%option noyywrap

%%

[ \t]		{ /* Skip blanks and tabs. */ }
([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {
                yylval.dval = atof(yytext);
                return NUMBER;
                }
sqrt            { return SQRT; }
pi              { return PI; }
quit|exit	{ return QUIT; }
[A-Za-z][A-Za-z0-9]* { /* return symbol pointer */
                  yylval.symptr = symlookup(yytext);
                  return ID;
                }
\n|.		{ return yytext[0]; }

%%


/* look up a symbol table entry, add if not present */
struct symtbl *symlookup(s) char *s; {
   char *p;
   struct symtbl *sp;
   for (sp = symtbl; sp < &symtbl[NSYM]; sp++) {
          /* is it already here? */
          if (sp->name && !strcmp(sp->name, s))
                return sp;
          /* is it free? */
          if(!sp->name) {
                sp->name = strdup(s);
                return sp;
          }
          /* otherwise continue to next */
   }
   yyerror("Too many symbols") ;
   exit(FAILURE); /* cannot continue */
} /* Symlookup */
