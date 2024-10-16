#!/usr/bin/env sh

the_eqn() {
  if [ $(expr "$num" % 2 ) = 0 ]; then
    num=$(expr "$num" / 2 )
  else
    num=$(expr 3 \* "$num" + 1 )
  fi

  printf "%s\n" "$num"
  steps="$steps $num"
}

rm data.txt || printf "%s\n" "data.txt is not present"

printf "%s" "Enter a number: " && read -r num

while [ $num != 1 ]; do
  the_eqn
done

printf "%s\n" "Sequence: $steps"

i=0

for step in $steps; do
  echo "$i $step" >> data.txt
  i=$(expr $i + 1 )
done

gnuplot -p -e "
    set title 'Collatz Conjecture Sequence';
    set xlabel 'Steps';
    set ylabel 'Number';
    set grid;
    set key off;
    plot 'data.txt' using 1:2 with linespoints linewidth 2 pointtype 7 pointsize 0.8"
