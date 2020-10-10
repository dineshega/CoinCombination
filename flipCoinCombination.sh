#!/bin/bash -x

echo "Welcome to Flip Coin Combination"

declare -A singlet
declare -A doublet
declare -A triplet
declare -A doub
declare -A trip
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
if [[ $h -gt $t ]]
then
	echo "head won"
elif [ $h -lt $t ]
then
	echo "tail won"
else
	echo "both won"
fi

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
greatest=0
for m in $hh $tt $ht $th
do
	if [[ $greatest -lt $m ]]
	then
		greatest=$m
	fi
done
echo "Winning combo" $greatest

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

greatest1=0

for n in $hhh $hht $hth $htt $thh $tht $tth $ttt
do
	if [[ $greatest1 -lt $n ]]
	then
		greatest1=$n
	fi
done
echo "Winning combo" $greatest1


