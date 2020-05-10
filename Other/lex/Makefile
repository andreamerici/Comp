all: scan wc

scan:	scan.o
	gcc -o scan scan.o -lm -lfl

scan.o:	scan.c
	gcc -c scan.c

scan.c:	tokenstring.l
	flex -o scan.c tokenstring.l

wc:	wc.o
	gcc -o wc wc.o -lm -lfl

wc.o:	wc.c
	gcc -c wc.c

wc.c:	wc.l
	flex -o wc.c wc.l

wcc:	wc-main.o wc-no-main.o
	gcc -o wcc wc-main.o wc-no-main.o -lfl

wc-main.o: wc-main.c
	gcc -c wc-main.c

wc-no-main.o:	wc-no-main.c
	gcc -c wc-no-main.c

wc-no-main.c:	wc-no-main.l
	flex -o wc-no-main.c wc-no-main.l

cleano:	
	rm -f *.o

cleanc:	
	rm -f scan.c wc.c wc-no-main.c

clean: 	cleano cleanc 
	rm -f *~ a.out scan wc wcc
