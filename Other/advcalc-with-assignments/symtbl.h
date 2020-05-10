#define NSYM 30 /* Max number of symbols */

struct symtbl {
  char *name;
  double value;
} symtbl[NSYM];

struct symtbl *symlookup();
