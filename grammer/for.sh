#! /bin/bash

for i in 1 2 3 4 5 6
do
	echo $i
done

list=`ls /root`
for file in `echo $list`
do
	echo $file
done
