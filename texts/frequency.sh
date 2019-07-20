find . -name '*.txt' | xargs cat  |  sed 's/[:,;!?\.()<>]\+/ & /g;s/  */ /g' | tr ' ' '\n' | sort -f | uniq -c | sort -gr
