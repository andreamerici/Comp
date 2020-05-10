#!/usr/bin/env python
'''
Semplice programma Python per riconoscere tutte e sole le stringhe
sull'alfabeto {0,1} di lunghezza 2
'''

import re, sys

language = ['00','01','10','11']

def main():
    if len(sys.argv) < 2:
        print "Usage: %s stringa_di_input"\
            %(re.sub('^.*/','',sys.argv[0]))
        sys.exit(1)
    instring = sys.argv[1]

    if instring in language:
        print "Input accettato"
    else:
        print "Input rifiutato"
   
if __name__ == '__main__': main()
