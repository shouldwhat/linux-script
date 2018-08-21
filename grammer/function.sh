#!/bin/sh

#
# Define function
#
function funcA {
	echo "funcA calling"
}

function funcB {
	echo "funcB calling"
}

function funcC {
	echo $1
	echo $2
}

#
# Call function
#
funcA
funcB
funcC arg1 arg2
funcC arg3
