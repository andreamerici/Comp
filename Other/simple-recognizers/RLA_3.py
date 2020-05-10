#!/usr/bin/env python
'''
Semplice programma Python per riconoscere tutte e sole le stringhe
sull'alfabeto {a,b,c} il cui penultimo carattere e' una a.
Legge i caratteri sequenzialmente e usa una quantita' costante di 
memoria RAM.
'''

import re, sys

alphabet = ['a','b','c']  # alfabeto di input
eos = '\n'                # end of string

def next():
    global inputfile
    return inputfile.read(1)

def scan():
    # Se in input non ci sono almeno due caratteri, oppure c'e' qualche carattere
    # non appartenente all'alfabeto, allora l'input e' rifiutato
    secondlast = next()
    if secondlast==eos or secondlast not in alphabet:
        print "Input rifiutato"
        return
    last = next()
    if last==eos or last not in alphabet:
        print "Input rifiutato"
        return
    # Se ci sono almeno due caratteri, si tiene traccia degli ultimi due (last e secondlast)
    # finche' non viene letto il fine linea (interpretato come fine stringa). A quel punto
    # si controlla se il penultimo e' una 'a'
    c = next()
    while c != eos:
        if c not in alphabet:
            print "Input rifiutato"
            return
        secondlast = last
        last = c
        c = next()
    if secondlast == 'a':
        print "Input accettato"
    else:
        print "Input rifiutato"
    return

def main():
    global inputfile
    if len(sys.argv) < 2:
        print "Usage: %s file_di_input"\
            %(re.sub('^.*/','',sys.argv[0]))
        sys.exit(1)
    inputfile = open(sys.argv[1])

    scan()
   
if __name__ == '__main__': main()
