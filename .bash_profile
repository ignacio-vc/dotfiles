# .bash_profile
# Runs on login.

default_dir=/usr/local/lib/

if [ -n "$PS1" ]; then
	PS1='\u@\h(\#)\$ '
	IGNOREEOF=3
fi

LOGIN_SHELL=true

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
elif [ -f ${default_dir}Bashrc ]; then
	. ${default_dir}Bashrc;
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.config/scripts" ] ; then
    export PATH="$PATH:$HOME/.config/scripts"
fi

#if [ -d "$HOME/.rbenv" ] ; then
#    export PATH="$PATH:$HOME/.rbenv"
#    eval "$(rbenv init -)"
#fi

#if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
#    export PATH="$PATH:$HOME/adb-fastboot/platform-tools"
#fi

# Autostart X at login
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    startx
fi
