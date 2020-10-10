#!/bin/bash -x

echo "Welcome to Flip Coin Combination"

if [ $((RANDOM%2)) -eq 0 ]
then
	echo "HEADS"
else
	echo "TAILS"
fi
