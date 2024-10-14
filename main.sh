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

rm data.txt

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

./plot.py
