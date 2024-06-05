FILE_OFFSET=/home/maciej/.wallpaper_offset
FILE_WALLPAPER=/home/maciej/.wallpaper_name

if [ ! -f "$FILE_OFFSET" ]; then
	touch $FILE_OFFSET
	echo 0 > $FILE_OFFSET
fi

if [ ! -f "$FILE_WALLPAPER" ]; then
	touch $FILE_WALLPAPER
	echo "/home/maciej/Obrazy/wallpapers/1.png" > $FILE_WALLPAPER
fi

OFFSET=$(cat ~/.wallpaper_offset)
IMG=$(cat ${FILE_WALLPAPER})

feh --no-fehbg --bg-fill $IMG -g +$OFFSET
