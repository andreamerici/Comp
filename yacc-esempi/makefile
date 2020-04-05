all: amb calc calcdebug

amb: amb.o
	cc -g -o amb amb.o

calc: calc.o
	cc -g -o calc calc.o

calcdebug: calcdebug.o
	cc -g -o calcdebug calcdebug.o

amb.o: amb.c amb.dot
	cc -g -c amb.c
	dot -Tpdf -o amb.pdf amb.dot

amb.c: amb.y
	bison -vg -o amb.c amb.y 

calc.o: calc.c calc.dot
	cc -g -c calc.c
	dot -Tpdf -o calc.pdf calc.dot

calcdebug.o: calcdebug.c calcdebug.dot
	cc -DYYDEBUG -g -c calcdebug.c
	dot -Tpdf -o calcdebug.pdf calcdebug.dot

calc.c: calc.y
	bison -vdg -o calc.c calc.y 

calcdebug.c: calcdebug.y
	bison -vg -o calcdebug.c calcdebug.y 

