#! /bin/bash

A=2
B=4

echo "A=$A"
echo "B=$B"

SUM=`expr $A + $B`
echo "A+B=$SUM"

MUL=`expr $A \* $B`
echo "A*B=$MUL"

#MUL=`expr $A * $B`
#echo "A*B=$MUL"


