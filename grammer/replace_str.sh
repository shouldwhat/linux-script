#./bin/bash

DIRPATH=/root/ntreek
FILENAME=a.xml

SRCSTR=wkkim
DESTSTR=wkkimwkkim

echo $SRCSTR
echo $DESTSTR

QUERY=s/$SRCSTR/$DESTSTR/g
FILEPATH=$DIRPATH/$FILENAME

echo $QUERY
echo $FILEPATH

sed -i $QUERY $FILEPATH

# -i : realtime works with file
# s : replace
# g : global
# sed -i 's/aaa/bbb/g' a.xml
