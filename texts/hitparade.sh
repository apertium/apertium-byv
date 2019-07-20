sh frequency.sh | sed 's/$/@@@/g' | apertium-destxt | hfst-proc -w ../byv.automorf.hfst | apertium-retxt | sed 's/@@@//g'
