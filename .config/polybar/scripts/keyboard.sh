LANGUAGE=$(setxkbmap -print | awk -F "+" '/xkb_symbols/ {print $2}')

if [[ $LANGUAGE == "pl" ]]; then
  echo PL
elif [[ $LANGUAGE == "us" ]]; then
  echo PL
elif [[ $LANGUAGE == "il" ]]; then
  echo IL
elif [[ $LANGUAGE == "ua" ]]; then
  echo UA
elif [[ $LANGUAGE == "ru" ]]; then
  echo RU
else 
  $LANGUAGE
fi
