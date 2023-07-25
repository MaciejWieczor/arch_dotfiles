mkdir -p ~/bin
export PATH=$PATH:~/bin
curl -L https://github.com/mpv-player/mpv/raw/master/TOOLS/umpv > ~/bin/umpv
cat << EOF > "$HOME/.config/nnn/plugins/addtoplaylist"
#!/usr/bin/env sh
player="umpv"
selection=${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection}
if [ -s "$selection" ]; then
  xargs -0 "$player" < "$selection"
else
  "$player" "$1"
fi
EOF
chmod +x "$HOME/.config/nnn/plugins/addtoplaylist"
export NNN_PLUG="$NNN_PLUG;p:addtoplaylist"
