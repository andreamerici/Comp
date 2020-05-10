#include <stdlib.h>
#include <stdio.h>

extern unsigned charCount, wordCount, lineCount;
extern int yylex ();

main()
{ 
  yylex();
  printf("%d %d %d\n", lineCount, wordCount, charCount); 
}

