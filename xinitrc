#!/bin/sh
#
# ~/.xinitrc
# Executed by startx (run your window manager from here)
#
# Author:
#	Shashank Chhikara <shanky061@gmail.com>

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -e ~/.Xresources ]] && xrdb -merge ~/.Xresources

# execute i3wm by default
if [ $DISPLAY == ":0" ]; then
	exec i3
fi

# If started for another DISPLAY/tty, open just xterm
if [ $DISPLAY != ":0" ]; then
	# Adjust geometry for font config.
	exec xterm -geometry 170x40+0+0 -e /usr/bin/tmux
fi
