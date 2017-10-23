# Ignacio Vargas' .bash_profile

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

# Autostart X at login
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

PATH=$PATH:$HOME/scripts
PATH=$PATH:$HOME/.local/bin/
