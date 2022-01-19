screen_shot=$HOME/tmp/locking_screen.png
#overlay_img=$HOME/wallpaper/lock-icon/levi.jpg
overlay_img=$HOME/Pictures/lock-icon/rick-and-morty-1.png
screen_blur=$HOME/tmp/screen_blur.png
lock_screen=$HOME/tmp/screen.png

revert() {
  rm $HOME/tmp/*screen*.png
  xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 0 0 5
# scrot -d 1 $screen_shot
scrot -m -d 1 $screen_shot
convert -blur 0x8 $screen_shot $screen_blur
convert -composite $screen_blur $overlay_img -gravity South -geometry -20x1200 $lock_screen
i3lock -i $lock_screen
revert
