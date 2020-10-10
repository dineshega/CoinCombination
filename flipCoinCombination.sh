#!/bin/bash -x

echo "Welcome to Flip Coin Combination"

declare -A triplet

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
for ((k=0; k<$flip ;k++))
do
	triplet[$k]="$( coinFlip )""$( coinFlip )""$( coinFlip )"
	if [[ "${triplet[$k]}" == "HHH" ]]
	then
		hhh=$((hhh+1))
		hhhtri=$( awk 'BEGIN {print ('$hhh'/'$flip')*100}')
	elif [[ "${triplet[$k]}" == "HHT" ]]
	then
		hht=$((hht+1))
		hhttri=$( awk 'BEGIN {print ('$hht'/'$flip')*100}')
	elif [[ "${triplet[$k]}" == "HTH" ]]
	then
		hth=$((hth+1))
		hthtri=$( awk 'BEGIN {print ('$hth'/'$flip')*100}')
	elif [[ "${triplet[$k]}" == "HTT" ]]
	then
		htt=$((htt+1))
		htttri=$( awk 'BEGIN {print ('$htt'/'$flip')*100}')
	elif [[ "${triplet[$k]}" == "THH" ]]
	then
		thh=$((thh+1))
		thhtri=$( awk 'BEGIN {print ('$thh'/'$flip')*100}')
	elif [[ "${triplet[$k]}" == "THT" ]]
	then
		tht=$((tht+1))
		thttri=$( awk 'BEGIN {print ('$tht'/'$flip')*100}')
	elif [[ "${triplet[$k]}" == "TTH" ]]
	then
		tth=$((tth+1))
		tthtri=$( awk 'BEGIN {print ('$tth'/'$flip')*100}')
	else
		ttt=$((ttt+1))
		ttttri=$( awk 'BEGIN {print ('$ttt'/'$flip')*100}')
	fi
done
echo ${triplet[@]}

echo "triplet hhh count: " $hhh
echo "triplet hht count: " $hht
echo "triplet hth count: " $hth
echo "triplet htt count: " $htt
echo "triplet thh count: " $thh
echo "triplet tht count: " $tht
echo "triplet tth count: " $tth
echo "triplet ttt count: " $ttt
echo "trpliet hhh precentage: " $hhhtri
echo "triplet hht precentage: " $hhttri
echo "triplet hth precentage: " $hthtri
echo "triplet htt precentage: " $htttri
echo "triplet thh precentage: " $thhtri
echo "triplet tht precentage: " $thttri
echo "triplet tth precentage: " $tthtri
echo "triplet ttt precentage: " $ttttri