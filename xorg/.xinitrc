#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
fi

# user init scripts and settings
[ -r /etc/X11/xinit/.Xmodmap ] && xmodmap /etc/X11/xinit/.Xmodmap
[ -r $HOME/.Xmodmap ] && xmodmap $HOME/.Xmodmap
[ -r $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources
[ -r $HOME/.xprofile ] && . $HOME/.xprofile

# session
exec dbus-launch --exit-with-session startdwm
