all: calc

calc: lex.yy.o calc.tab.o
	gcc -o calc lex.yy.o calc.tab.o -lm

lex.yy.o: lex.yy.c calc.tab.h
	gcc -c lex.yy.c -lm

calc.tab.o: calc.tab.c calc.tab.h
	gcc -c calc.tab.c -lm

lex.yy.c: calc.l calc.h
	flex calc.l

calc.tab.c calc.tab.h: calc.y calc.h
	bison -d calc.y

clean-object:
	rm -f lex.yy.o calc.tab.o

clean-lexer:
	rm -f lex.yy.c

clean-parser:
	rm -f calc.tab.c calc.tab.h

clean: clean-object clean-lexer clean-parser 
	rm -f calc *~
