 # automatically start X in tty1
 { [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ] ;} && ! pidof -s Xorg &> /dev/null && exec startx "$XINITRC" &> /dev/null
