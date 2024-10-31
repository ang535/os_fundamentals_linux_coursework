#!/bin/zsh


echo "Enter the required length of password in the range 12-32:"
read len
#echo $len
count=$len

up_letters=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
low_letters=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")
numbers=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
special_chars="!@#$%^&*()_+-=[]{}|:<>?/"

password=""

if [[ $len -le 32 && $len -ge 12 ]]; then
	echo "Valid Length"

	for (( i=0; i<3; i++ )); do
		index=$(( RANDOM % 26 ))
		password+="${up_letters[index]}"
	done

	for (( i=0; i<3; i++ )); do
		index=$(( RANDOM % 26 ))
		password+="${low_letters[index]}"
	done
	
	for (( i=0; i<3; i++ )); do
		index=$(( RANDOM % 10 ))
		password+="${numbers[index]}"
	done
	
	for (( i=0; i<3; i++ )); do
		index=$(( RANDOM % ${#special_chars} ))
		password+="${special_chars[index]}"
	done

	count=$(( count - 12 ))

	for (( i=0; i<=$count; i++ )); do

		rand_no=$(( RANDOM % 4 + 1 ))

		case $rand_no in
			1)
				index=$(( RANDOM % 26 ))
				password+="${up_letters[index]}"
				;;
			2)
				index=$(( RANDOM % 26 ))
				password+="${low_letters[index]}"
				;;
			3)
				index=$(( RANDOM % 10 ))
				password+="${numbers[index]}"
				;;
			4)
				index=$(( RANDOM % ${#special_chars} ))
				password+="${special_chars[index]}"
				;;
		esac
	done
	
	#echo $password

	shuffled_password=""
	for (( i=0; i<len; i++ )); do
		index=$(( RANDOM % $len ))
		shuffled_password+="${password[index]}"
	done
	echo "Generated password is  $shuffled_password and the length is $len"



else
	echo "Unvalid Length"
fi
