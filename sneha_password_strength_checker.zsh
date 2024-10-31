#!/bin/zsh



echo "Enter your password"
read PW
#echo $PW
count=${#PW}
points=0
#echo $count

#to check length of password

if [ $count -ge 8 ]; then
	points=$((points + 2))
fi
#echo $points

#atleast one uppercase letter

if [[ $PW =~ [A-Z] ]]; then
	points=$((points + 2))
#	echo "Has uppercase etter"
#else
#	echo "No uppercase letter"
fi
#echo $points

#atleast one lowercase letter

if [[ $PW =~ [a-z] ]]; then
	points=$((points + 2))
#	echo "Has lowercase letter"
#else
#	echo "No lowercase letter"
fi
#echo $points

#atleast one digit

if [[ $PW =~ [0-9] ]]; then
	points=$((points + 2))
	#echo "Has digits"
#else
#	echo "No digits"
fi
#echo $points

sc=0
sp_ch='[!@#$%^&*()_+=\-\[\]{}|;:<>,?/]'

for (( i=0; i<count; i++ )); do
	x="${PW:$i:1}"
	#echo $x
	if [[ $sp_ch =~ $x ]]; then
		sc=$((sc + 1))
	fi
done
#echo $sc

if [ $sc -ge 2 ]; then
	points=$((points + 2))
fi

echo "The strength of your password is: $points"

