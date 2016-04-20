# set keyboard repeat rate
xset r rate 200 60

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Makes fonts darker and thicker
export INFINALITY_FT_BRIGHTNESS="-10"
# Not too sharp, not too smooth
export INFINALITY_FT_FILTER_PARAMS="16 20 28 20 16"

feh --bg-scale $HOME/.config/bspwm/wallpapers/wallpaper.png

# exec gnome-shell
sxhkd &
urxvt &
exec bspwm

