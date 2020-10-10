#!/bin/bash -x

echo "Welcome to Flip Coin Combination"

declare -A doublet

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

for ((j=0; j<$flip ;j++))
do
	doublet[$j]="$( coinFlip )""$( coinFlip )"
	if [[ "${doublet[$j]}" == "HH" ]]
	then
		hh=$((hh+1))
		hhd=$( awk 'BEGIN {print ('$hh'/'$flip')*100}')
	elif [[ "${doublet[$j]}" == "TT" ]]
	then
		tt=$((tt+1))
		ttd=$( awk 'BEGIN {print ('$tt'/'$flip')*100}')
	elif [[ "${doublet[$j]}" == "HT" ]]
	then
		ht=$((ht+1))
		htd=$( awk 'BEGIN {print ('$ht'/'$flip')*100}')
	else
		th=$((th+1))
		thd=$( awk 'BEGIN {print ('$th'/'$flip')*100}')
	fi
done
echo ${doublet[@]}

echo "doublet hh count: " $hh
echo "doublet tt count: " $tt
echo "doublet ht count: " $ht
echo "doublet th count: " $th
echo "hh percentage: " $hhd
echo "tt percentage: " $ttd
echo "ht percentage: " $htd
echo "th percentage: " $thd