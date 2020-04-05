bup: lexer.o parser.o tree.o
	cc -g -o bup lexer.o parser.o tree.o

lexer.o: lexer.c parser.h def.h
	cc -g -c lexer.c 

parser.o: parser.c def.h parser.dot
	cc -g -c parser.c
	dot -Tpdf -o parser.pdf parser.dot

tree.o: tree.c def.h
	cc -g -c tree.c

lexer.c: lexer.lex parser.y parser.h parser.c def.h
	flex -o lexer.c lexer.lex

parser.h: parser.y def.h
	bison -vdg -o parser.c parser.y
