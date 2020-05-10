#!/usr/bin/env python
'''
Semplice programma Python per riconoscere tutte e sole le stringhe
sull'alfabeto {a,b,c} il cui penultimo carattere e' una a
'''

import re, sys

alphabet = ['a','b','c']

def main():
    if len(sys.argv) < 2:
        print "Usage: %s stringa_di_input"\
            %(re.sub('^.*/','',sys.argv[0]))
        sys.exit(1)
    instring = sys.argv[1]

    for c in instring:
        if c not in alphabet:
            print "Input rifiutato"
            sys.exit(1)

    if len(instring)>1 and instring[-2] == 'a':
        print "Input accettato"
    else:
        print "Input rifiutato"
   
if __name__ == '__main__': main()
