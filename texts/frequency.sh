find . -name '*.txt' | xargs cat  |  sed 's/[:,;!?\.()<>]\+/ & /g;s/  */ /g' | tr '[\t ]' '\n' | sort -f | uniq -c | sort -gr
