DIX=apertium-byv.byv.lexc
BIN=byv.automorf.hfst

cat ~/apertium-languages/apertium-byv-fra/corpora/byv_bible.csv |  sed "s/\([^ ]\)['’]\([^ ]\)/\1ʼ\2/g"  | apertium-destxt | nice -n 19 hfst-proc -w $BIN | apertium-retxt | sed 's/\$\W*\^/$\n^/g' > /tmp/byv.coverage.txt

EDICT=`cat $DIX | grep '^[^:]\+:[^ ]\+ *[A-Z]' | wc -l`
EPARA=`cat $DIX | grep -o 'LEXICON ' | wc -l`;
TOTAL=`cat /tmp/byv.coverage.txt | wc -l`;
KNOWN=`cat /tmp/byv.coverage.txt | grep -v '\*' | wc -l`;
COVER=`calc $KNOWN / $TOTAL`;
DATE=`date`;

echo -e $DATE"\t"$EPARA":"$EDICT"\t"$KNOWN"/"$TOTAL"\t"$COVER >> history.log
tail -1 history.log

cat /tmp/byv.coverage.txt | cut -f2 -d'^' | cut -f1 -d'/' | sort -f | uniq -c | sort -gr | grep -v '[0-9] [0-9]' > byv.hitparade.txt

cat byv.hitparade.txt | apertium-destxt |  hfst-proc -w  byv.automorf.hfst | apertium-retxt