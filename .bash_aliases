# Ignacio Vargas' .bash_aliases

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

# CLI
alias g='grep'
alias h='history'
alias hg='history | grep'
alias ie='alias'
alias rs='source $HOME/.bashrc'
alias rr='xrdb $HOME/.Xresources'

# Directories
alias dirs='dirs -v'
alias mkdir='mkdir -pv'
alias l='ls -xFX --group-directories-first'
alias ld='ls -hoFX --group-directories-first'
alias lh='ls -xdFX .* --group-directories-first'
alias lhd='ls -hodFX .* --group-directories-first'
alias la='ls -xAFX --group-directories-first'
alias lad='ls -hoAFX --group-directories-first'
alias ll='ls -hlAFX --group-directories-first'

# Dotfile Management with a bare Git repository
alias dot='/usr/bin/git --git-dir=$HOME/.config/dotgit --work-tree=$HOME/'

# File Editing
alias v='vim'
alias :e='vim'
alias vv='gvim'
alias g:e='gvim'
alias e='emacs'
alias ,a='vim $HOME/.bash_aliases'
alias ,p='vim $HOME/.bash_profile'
alias ,b='vim $HOME/.bashrc'
alias ,i='vim $HOME/.config/i3/config'
alias ,c='vim $HOME/.config/compton.conf'
alias ,e='vim $HOME/.emacs.d/init.el'
alias ,g='vim $HOME/.gitconfig'
alias ,n='vim $HOME/.gitignore'
alias ,vv='vim $HOME/.gvimrc'
alias ,s='vim $HOME/.ssh/config'
alias ,t='vim $HOME/.tmux.conf'
alias ,v='vim $HOME/.vimrc'
alias ,x='vim $HOME/.xinitrc'
alias ,r='vim $HOME/.Xresources'
alias diff='colordiff'

# Internet
alias myip='curl https://wtfismyip.com/text; echo'
alias ofi='lsof -i'
alias ports='netstat -tulanp'
alias wget='wget -c --content-disposition'

# Programs
alias julia='$HOME/julia/julia'
alias jupyter='$HOME/.local/bin/jupyter-notebook'
alias r='ranger'
alias dorf='bash $HOME/df_linux/df'

# Safety Nets
alias cp='cp -i'
alias del='rm -I --preserve-root'
alias grp='chgrp --preserve-root'
alias mod='chmod --preserve-root'
alias mv='mv -i'
alias ln='ln -i'
alias own='chown --preserve-root'

# System
alias df='pydf'
alias dft='\df -Tha --total'
alias du='du -ach | sort -h'
alias free='free -mt'
alias ka='killall'
alias mount='mount | column -t'
alias nf='neofetch && sensors'
alias off='sudo shutdown -h now'
alias path='echo $PATH | tr ":" "\n"'
alias ps='ps auxf'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias top='htop'
