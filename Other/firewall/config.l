%{
#include <stdio.h>
#include "config.tab.h"
%}

%option noyywrap

%%
allow				return ALLOW;
deny				return DISALLOW;
[a-zA-Z]+[\.a-zA-Z0-9_]*	yylval=strdup(yytext); return USRDOM;
\{				return OPEN_BRACE;
\}				return CLOSE_BRACE;
\@				return ATSYM;
\n				/* Ignore end-of-line */
[ \t]+				/* Ignore whitespace  */
%%
