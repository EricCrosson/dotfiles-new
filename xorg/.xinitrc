# set keyboard repeat rate
xset r rate 200 60

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh --bg-scale $HOME/.config/bspwm/wallpapers/wallpaper.png

# exec gnome-shell
sxhkd &
urxvt &
exec bspwm

