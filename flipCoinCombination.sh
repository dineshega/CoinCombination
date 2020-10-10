#!/bin/bash -x

echo "Welcome to Flip Coin Combination"

declare -A singlet

h=0
t=0
read -p "how many times should coin flip: " flip
function coinFlip()
{
  	fliped=$((RANDOM%2))
		if [ $fliped -eq 0 ]
		then
			echo "H"
		else
			echo "T"
		fi
}

for((i=0; i<$flip; i++))
do
	singlet[$i]="$( coinFlip )"
	if [[ "${singlet[$i]}" == "H" ]]
	then
		h=$((h+1))
		hs=$( awk 'BEGIN {print ('$h'/'$flip')*100}')
	else
		t=$((t+1))
		ts=$( awk 'BEGIN {print ('$t'/'$flip')*100}')
	fi
done
echo ${singlet[@]}
echo "singlet head count: " $h
echo "singlet tail count: " $t
echo "head percentage: " $hs
echo "tail percentage: " $ts