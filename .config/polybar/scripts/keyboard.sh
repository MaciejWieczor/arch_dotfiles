LANGUAGE=$(setxkbmap -print | awk -F "+" '/xkb_symbols/ {print $2}')

if [[ $LANGUAGE == "pl" ]]; then
  echo PL
elif [[ $LANGUAGE == "us" ]]; then
  echo PL
elif [[ $LANGUAGE == "il" ]]; then
  echo IL
else 
  $LANGUAGE
fi
