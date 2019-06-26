#!/bin/bash
mode=$1
outfile=/tmp/$mode.clean
apertium -d . $mode | apertium-cleanstream -n > $outfile
total=$(grep -c '^\^' $outfile)
unknown=$(grep -c '/\*' $outfile)
bidix_unknown=$(grep -c '/@' $outfile)
known_percent=$(calc -p  "round( 100*($total-$unknown-$bidix_unknown)/$total, 3)")
echo "$known_percent % known tokens ($unknown unknown, $bidix_unknown bidix-unknown of total $total tokens)"
echo "Top unknown words:"
grep '/[*@]' $outfile | sort | uniq -c | sort -nr | head