

for i in {5..1}
do

  if [ "$1" == "shutdown" ]; then
    dunstify -h string:x-powermenu:shutdown "Wyłączanie komputera"
  elif [ "$1" == "hibernate" ]; then
    dunstify -h string:x-powermenu:hibernate "Hibernacja komputera"
  elif [ "$1" == "suspend" ]; then
    dunstify -h string:x-powermenu:hibernate "Uśpienie komputera"
  elif [ "$1" == "reboot" ]; then
    dunstify -h string:x-powermenu:hibernate "Restart komputera"
  fi

  dunstify -h string:x-countdown:$1 "Operacja za $i sekund"
  sleep 1
  dunstctl close-all

done
