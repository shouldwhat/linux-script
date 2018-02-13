#! /bin/bash

echo -n "input number : "

read input

# input > 0
if [ $input -gt 0  ]
then
	echo "input > 0"

# input < 0
elif [ $input -lt 0 ]
then
	echo "input < 0"

# input = 0
elif [ $input -eq 0 ]
then
	echo "input = 0"

else
	echo "else"
fi

# 문자 비교
# [ "A" = "B" ]
# [ "A" ! "B" ]

# 조건연산자
# -a (AND)
# -o (OR)


