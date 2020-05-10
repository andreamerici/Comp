all: firewall

firewall: lex.yy.o config.tab.o
	gcc -o firewall lex.yy.o config.tab.o

lex.yy.o: lex.yy.c config.tab.h
	gcc -c lex.yy.c

config.tab.o: config.tab.c
	gcc -c config.tab.c

lex.yy.c: config.l
	flex config.l

config.tab.c config.tab.h: config.y
	bison -d config.y

clean-object:
	rm -f lex.yy.o config.tab.o

clean-lexer:
	rm -f lex.yy.c

clean-parser:
	rm -f config.tab.c config.tab.h

clean: clean-object clean-lexer clean-parser 
	rm -f firewall *~
