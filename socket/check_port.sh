

PORT=$1
#echo $PORT

COMMAND="lsof -i:$PORT"
#echo $COMMAND
exec $COMMAND

