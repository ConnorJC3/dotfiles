# Autostart X on login shell
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx &> /dev/null
fi
