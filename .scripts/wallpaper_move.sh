FILE_OFFSET=/home/maciej/.wallpaper_offset

if [ ! -f "$FILE_OFFSET" ]; then
	touch $FILE_OFFSET
	echo 0 > $FILE_OFFSET
fi

OFFSET=$(cat "$FILE_OFFSET")

if [ $1 == "+" ]; then
	OFFSET=$((OFFSET + $2))
else
	OFFSET=$((OFFSET - $2))
fi

printf $OFFSET'\n'
echo "$OFFSET" > $FILE_OFFSET
source ~/.scripts/wallpaper_long.sh
