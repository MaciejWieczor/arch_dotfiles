EASYRETURN=$(pgrep -l easyeffects)
echo $EASYRETURN

if [[ -z $EASYRETURN ]]; then
    easyeffects &
else
    easyeffects -w &
fi
