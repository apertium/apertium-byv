#!/bin/bash

TOTAL=`cat texts/*.byv.txt | cut -f2 | sed 's/[:"\.!?;]/ & /g' | sed 's/  */ /g' | tr ' ' '\n' | grep -v '^$' | wc -l`;
KNOWN=`cat texts/*.byv.txt | cut -f2 | sed 's/[:"\.!?;]/ & /g' | sed 's/  */ /g' | tr ' ' '\n' | grep -v '^$' | lt-proc -w byv.automorf.bin  | grep -v '\*' | grep '\$ *$' | wc -l`;
calc "($KNOWN/$TOTAL)*100"
TOTAL=`cat texts/compte.byv.txt | cut -f2 | sed 's/[:"\.!?;]/ & /g' | sed 's/  */ /g' | tr ' ' '\n' | grep -v '^$' | wc -l`;
KNOWN=`cat texts/compte.byv.txt | cut -f2 | sed 's/[:"\.!?;]/ & /g' | sed 's/  */ /g' | tr ' ' '\n' | grep -v '^$' | lt-proc -w byv.automorf.bin  | grep -v '\*' | grep '\$ *$' | wc -l`;
calc "($KNOWN/$TOTAL)*100"
