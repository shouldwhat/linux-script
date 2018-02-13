
# get input arguments
HOSTNAME=$1
COMMAND=$2
WARG=$3
CARG=$4

# define result code
RESULT_OK=0
RESULT_WARNING=1
RESULT_CRITICAL=2
RESULT_UNKNOWN=3

# calling diagnosis api
OUTPUT=$(curl -s -m 5 http://192.168.1.180:8080/host/$HOSTNAME/command/$COMMAND/warg/$WARG/carg/$CARG)

# return result code
if echo "$OUTPUT" | grep 'OK'; then
	exit $RESULT_OK
elif echo "$OUTPUT" | grep 'WARNING'; then
	exit $RESULT_WARNING
elif echo "$OUTPUT" | grep 'CRITICAL'; then
	exit $RESULT_CRITICAL
else echo "$OUTPUT"
	exit $RESULT_UNKNOWN
fi
