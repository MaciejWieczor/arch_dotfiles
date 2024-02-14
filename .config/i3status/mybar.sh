#!/bin/sh

# i3 config in ~/.config/i3/config :
# bar {
#   status_command exec /home/maciej/.config/i3status/mybar.sh
# }

bg_bar_color="#282A36"

red="#ED8796"
orange="#F5A97F"
yellow="#EED49F"
green="#A6DA95"
sky="#91d7e3"
blue="#8AADF4"
cyan="#8BD5CA"
magenta="#F5BDE6"
black="#24273A"
white="#B8C0E0"
mauve="#c6a0f6"

# Print a left caret separator
# @params {string} $1 text color, ex: "#FF0000"
# @params {string} $2 background color, ex: "#FF0000"
separator() {
  echo -n "{"
  echo -n "\"full_text\":\"\"," # CTRL+Ue0b2
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border\":\"$bg_bar_color\","
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  # echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"color\":\"$1\","
  echo -n "\"background\":\"$2\""
  echo -n "}"
}

common() {
  echo -n "\"border\": \"$bg_bar_color\","
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  # echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0"
}

mycrypto() {
  local bg="#FFD180"
  separator $bg $bg_bar_color
  echo -n ",{"
  echo -n "\"name\":\"id_crypto\","
  echo -n "\"full_text\":\" $(/home/maciej/.config/i3status/crypto.py) \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myip_public() {
  local bg=$blue
  separator $bg $mauve
  echo -n ",{"
  echo -n "\"name\":\"ip_public\","
  echo -n "\"full_text\":\" $(/home/maciej/.config/i3status/ip.py) \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myvpn_on() {
  local bg="#424242" # grey darken-3
  local icon=""
  if [ -d /proc/sys/net/ipv4/conf/proton0 ]; then
    bg="#E53935" # rouge
    icon=""
  fi
  separator $bg "#1976D2" # background left previous block
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_vpn\","      
  echo -n "\"full_text\":\" ${icon} VPN \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myip_local() {
  local bg=$blue # vert
  # separator $bg $blue
  echo -n "{"
  echo -n "\"name\":\"ip_local\","
  echo -n "\"full_text\":\"  $(ip route get 1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p') \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

disk_usage() {
  local bg=$green
  separator $bg $blue
  echo -n ",{"
  echo -n "\"name\":\"id_disk_usage\","
  echo -n "\"full_text\":\"  $(/home/maciej/.config/i3status/disk.py)%\","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "}"
}

memory() {
  local bg=$green
  echo -n ",{"
  echo -n "\"name\":\"id_memory\","
  echo -n "\"full_text\":\" |  $(/home/maciej/.config/i3status/memory.py)%\","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "}"
}

cpu_usage() {
  local bg=$green
  echo -n ",{"
  echo -n "\"name\":\"id_cpu_usage\","
  echo -n "\"full_text\":\" |  $(/home/maciej/.config/i3status/cpu.py)% \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

meteo() {
  local bg="#546E7A"
  separator $bg "#3949AB"
  echo -n ",{"
  echo -n "\"name\":\"id_meteo\","
  echo -n "\"full_text\":\" $(/home/maciej/.config/i3status/meteo.py) \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

mydate() {
  local bg=$yellow
  separator $bg $green
  echo -n ",{"
  echo -n "\"name\":\"id_time\","
  echo -n "\"full_text\":\"  $(date "+%a %d/%m %H:%M") \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

battery0() {
  if [ -f /sys/class/power_supply/BAT1/uevent ]; then
    local bg=$orange
    separator $bg $yellow
    bg_separator_previous=$bg
    prct=$(cat /sys/class/power_supply/BAT1/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d'=' -f2)
    charging=$(cat /sys/class/power_supply/BAT1/uevent | grep "POWER_SUPPLY_STATUS" | cut -d'=' -f2) # POWER_SUPPLY_STATUS=Discharging|Charging
    icon=" "
    if [ "$charging" == "Charging" ]; then
      icon=""
    fi
    echo -n ",{"
    echo -n "\"name\":\"battery0\","
    echo -n "\"full_text\":\" ${icon} ${prct}% \","
    echo -n "\"color\":\"#000000\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
  else
    bg_separator_previous="#E0E0E0"
  fi
}

volume() {
  local bg=$red
  separator $bg $bg_separator_previous  
  vol=$(pulseaudio-control --format '${VOL_LEVEL}' output)
  echo -n ",{"
  echo -n "\"name\":\"id_volume\","
  if [ ${#vol} -ge 4 ]; then
    echo -n "\"full_text\":\"  muted \","
    echo -n "\"color\":\"#000000\","
  else
    echo -n "\"full_text\":\"   ${vol}% \","
    echo -n "\"color\":\"#000000\","
  fi
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
  separator $bg_bar_color $bg
}

temp() {
  local bg=$mauve
  local nb=$(cat /sys/class/thermal/thermal_zone2/temp)
  local temp=${nb::-3}
  separator $bg $mauve
  echo -n ",{"
  echo -n "\"name\":\"id_temp\","
  echo -n "\"full_text\":\"  ${temp} \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

systemupdate() {
  local bg=$mauve
  local nb=$(checkupdates | wc -l)
  separator $bg "#000000"
  echo -n ",{"
  echo -n "\"name\":\"id_systemupdate\","
  echo -n "\"full_text\":\"  ${nb} \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

logout() {
  echo -n ",{"
  echo -n "\"name\":\"id_logout\","
  echo -n "\"full_text\":\" Arch Linux -  \""
  echo -n "}"
}

# https://github.com/i3/i3/blob/next/contrib/trivial-bar-script.sh
echo '{ "version": 1, "click_events":true }'     # Send the header so that i3bar knows we want to use JSON:
echo '['                    # Begin the endless array.
echo '[]'                   # We send an empty first array of blocks to make the loop simpler:

# Now send blocks with information forever:
(while :;
do
	echo -n ",["
  systemupdate
  temp
  myip_public
  myip_local
  disk_usage
  memory
  cpu_usage
  mydate
  battery0
  volume
  logout
  echo "]"
	sleep 5
done) &

# click events
while read line;
do
  # echo $line > /home/maciej/gitclones/github/i3/tmp.txt
  # {"name":"id_vpn","button":1,"modifiers":["Mod2"],"x":2982,"y":9,"relative_x":67,"relative_y":9,"width":95,"height":22}

  # VPN click
  #
  if [[ $line == *"name"*"id_vpn"* ]]; then
    alacritty -e /home/maciej/.config/i3status/click_vpn.sh &

  # CHECK UPDATES
  elif [[ $line == *"name"*"id_systemupdate"* ]]; then
    alacritty -e /home/maciej/.config/i3status/click_checkupdates.sh &

  # CPU
  elif [[ $line == *"name"*"id_cpu_usage"* ]]; then
    alacritty -e btop &

  # TIME
  elif [[ $line == *"name"*"id_time"* ]]; then
    alacritty -e /home/maciej/.config/i3status/click_time.sh &

  # METEO
  elif [[ $line == *"name"*"id_meteo"* ]]; then
    xdg-open https://openweathermap.org/city/3099434 > /dev/null &

  # CRYPTO
  elif [[ $line == *"name"*"id_crypto"* ]]; then
    xdg-open https://www.livecoinwatch.com/ > /dev/null &

  # VOLUME
  elif [[ $line == *"name"*"id_volume"* ]]; then
    pavucontrol &

  # LOGOUT
  elif [[ $line == *"name"*"id_logout"* ]]; then
    i3-nagbar -t warning -m 'Log out ?' -b 'yes' 'i3-msg exit' > /dev/null &

  fi  
done
