# .bash_aliases

# Aptitude Package Manager
alias sau='sudo aptitude update'
alias sai='sudo aptitude install'
alias sar='sudo aptitude remove'
alias sap='sudo aptitude purge'
alias sac='sudo aptitude autoclean'
alias safe='sudo aptitude safe-upgrade'
alias full='sudo aptitude full-upgrade'
alias sup='sau && safe'
alias eyy='sau && full'
alias sea='aptitude search'
alias sho='aptitude show'
alias ver='aptitude versions'
alias nope='sudo aptitude forbid-version'
alias why='aptitude why'
alias whynot='aptitude why-not'

# CLI
alias g='grep'
alias h='history'
alias hg='history | grep'
alias ie='alias'
alias rs='source $HOME/.bashrc'
alias rr='xrdb $HOME/.Xresources'
alias palette='(x=`tput op` y=`printf %76s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done)'

# Directories
alias dirs='dirs -v'
alias mkdir='mkdir -pv'
alias l='ls -xF --group-directories-first'
alias la='ls -xFX --group-directories-first'
alias ld='ls -hoFX --group-directories-first'
alias lh='ls -xdFX .* --group-directories-first'
alias lhd='ls -hodFX .* --group-directories-first'
alias lad='ls -hoAFX --group-directories-first'
alias ll='ls -hlAFX --group-directories-first'

# Dotfile Management with a bare Git repository
alias dot='/usr/bin/git --git-dir=$HOME/.config/dotgit --work-tree=$HOME/'
alias dash='dot pull origin master --rebase'
alias slash='dot push origin master'

# File Editing
alias v='vim'
alias gv='gvim'
alias e='emacs'
alias ,a='vim $HOME/.bash_aliases'
alias ,p='vim $HOME/.profile'
alias ,y='vim $HOME/.config/polybar/config'
alias ,b='vim $HOME/.bashrc'
alias ,i='vim $HOME/.config/i3/config'
alias ,c='vim $HOME/.config/compton.conf'
alias ,e='vim $HOME/.emacs.d/init.el'
alias ,g='vim $HOME/.gitconfig'
alias ,n='vim $HOME/.gitignore'
alias ,gv='vim $HOME/.gvimrc'
alias ,s='vim $HOME/.ssh/config'
alias ,t='vim $HOME/.tmux.conf'
alias ,v='vim $HOME/.vimrc'
alias ,x='vim $HOME/.xsession'
alias ,r='vim $HOME/.Xresources'
alias diff='vimdiff'
alias gdiff='gvimdiff'

# Internet
alias myip='curl https://wtfismyip.com/text; echo'
alias ofi='lsof -i'
alias ports='netstat -tulanp'
alias wget='wget -c --content-disposition'
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias ethspeed="speedometer -r eno1"
alias wifispeed="speedometer -r wlp3s0"
alias tpbs="clear && figlet -c TPB Search && ~/.config/Scripts/tpb.sh" # Pirate Bay search

# Programs
alias julia-stable='$HOME/data/julia-stable/julia'
alias julia-unstable='$HOME/data/julia-unstable/julia'
alias julia-oldstable='$HOME/data/julia-oldstable/julia'
alias jupyter='$HOME/.local/bin/jupyter-notebook'
alias bw='wal -ci ~/.config/wallpaper.jpg'

# Entretainment
alias doom='crispy-doom -iwad ~/Vidya/Native/Doom/IWADS/doom.wad'
alias doom2='crispy-doom -iwad ~/Vidya/Native/Doom/IWADS/doom2.wad'
alias tnt='gzdoom -iwad tnt -file smoothdoom.pk3 doomsfx healthwarning.pk3 ~/Vidya/Native/Doom/MusicPacks/tnt-music/'
alias wads='clear && printf "DOOM WADs\n" && printf "\nIWADS\n" && l ~/Vidya/Native/Doom/IWADS/ && printf "\nPWADS/Cosmetic\n" && l ~/Vidya/Native/Doom/PWADS/Cosmetic && printf "\nPWADS/Expansions\n" && l ~/Vidya/Native/Doom/PWADS/Expansions && printf "\nPWADS/Gameplay\n" && l ~/Vidya/Native/Doom/PWADS/Gameplay && printf "\nPWADS/Maps\n" && l ~/Vidya/Native/Doom/PWADS/Maps && printf "\nPWADS/TotalConversions\n" && l ~/Vidya/Native/Doom/PWADS/TotalConversions && printf "\n"'
alias quake='quakespasm -basedir ~/Vidya/Native/Quake/'
alias arcane='quakespasm -basedir ~/Vidya/Native/Quake/ -game ad'
alias xcom='~/Vidya/Native/OpenXcom/OpenXcom*'
alias dorf='st -e $HOME/Vidya/Native/DwarfFortress/df_linux/dfhack & st -e $HOME/Vidya/Native/DwarfFortress/DwarfTherapist'

# Safety Nets
alias cp='cp -i -v'
alias del='rm -I -v  --preserve-root'
alias grp='chgrp --preserve-root'
alias mod='chmod --preserve-root'
alias mx='mod +x'
alias mv='mv -i -v'
alias ln='ln -i -v'
alias own='chown --preserve-root'

# System
alias df='pydf'
alias dft='\df -Tha --total'
alias du='du -ach | sort -h'
alias top='htop'
alias free='free -mt'
alias ka='killall'
alias mount='mount | column -t'
alias nf='neofetch && sensors'
alias off='sudo shutdown -h now'
alias path='echo $PATH | tr ":" "\n"'
alias ps='ps auxf'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias pwrmax='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias pwrmin='echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias pwrchk='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor'
alias reportnames='printf "\nMy DISPLAY is $DISPLAY \nMy XDG_VTNR is $XDG_VTNR \n\n"'
