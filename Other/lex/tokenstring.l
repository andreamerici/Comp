%option noyywrap

/* regular definitions */
delim	 [ \t\n]
ws	 {delim}+
letter	 [A-Za-z]
digit    [0-9]
id	 {letter}({letter}|{digit})*
number	 [+-]?{digit}+(\.{digit}+)?(E[+-]?{digit}+)?
%%
{ws}	 { }
if	 {printf("IF ");}
then	 {printf("THEN ");}
else	 {printf("ELSE ");}
{id}	 {printf("ID ");}
{number} {printf("NUMBER ");}
"<"	 {printf("RELOP ");}
"<="	 {printf("RELOP ");}
"="	 {printf("RELOP ");}
"<>"	 {printf("RELOP ");}
">"	 {printf("RELOP ");}
">="	 {printf("RELOP ");}
":="	 {printf("ASSIGNMENT ");}
%%
main(void)
{ 
  yylex();
  printf("\n"); 
}
