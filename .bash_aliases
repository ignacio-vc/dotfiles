## Ignacio Vargas' .bash_aliases

# Aptitude Package Manager
## Shortcuts for upgrading, installing, and uninstalling packages
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
## Shorthand to interact with commands previously typed
### Remember you can also use things like !, !!, and !*
alias g='grep'
alias h='history'
alias hg='history | grep'
alias ie='alias'
alias rs='source $HOME/.bashrc'
alias rr='xrdb $HOME/.Xresources'

# Directories
## Commands that create and display directories
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
## Learn how it works here:
### https://news.ycombinator.com/item?id=11071754
### https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
### https://github.com/Snaipe/dot-git
alias dot='/usr/bin/git --git-dir=$HOME/.config/dotgit --work-tree=$HOME/'

# File Editing + Configurations (14)
## For text editing
alias ,a=':e $HOME/.bash_aliases'
alias ,p=':e $HOME/.bash_profile'
alias ,b=':e $HOME/.bashrc'
alias ,i=':e $HOME/.config/i3/config'
alias ,c=':e $HOME/.config/compton.conf'
alias ,e=':e $HOME/.emacs.d/init.el'
alias ,g=':e $HOME/.gitconfig'
alias ,n=':e $HOME/.gitignore'
alias ,vg=':e $HOME/.gvimrc'
alias ,s=':e $HOME/.ssh/config'
alias ,t=':e $HOME/.tmux.conf'
alias ,v=':e $HOME/.vimrc'
alias ,x=':e $HOME/.xinitrc'
alias ,r=':e $HOME/.Xresources'
alias diff='colordiff'

# Internet
## To find out current IP, port status, and download stuff
alias myip='curl https://wtfismyip.com/text; echo'
alias ofi='lsof -i'
alias ports='netstat -tulanp'
alias wget='wget -c --content-disposition'

# Programs
## Commonly used programs
alias :e='vim'
alias g:e='gvim'
alias julia='$HOME/julia/julia'
alias jupyter='$HOME/.local/bin/jupyter-notebook'
alias r='ranger'

# Safety Nets
## Nuclear disarmament. Prevents me from accidentally the whole thing.
### rm and ch commands are changed because I don't
### want to get used to the vanilla ones being safe on
### my computers and then killing someone else's because
### they didn't have similar safeguards to me
alias cp='cp -i'
alias del='rm -I --preserve-root'
alias grp='chgrp --preserve-root'
alias mod='chmod --preserve-root'
alias mv='mv -i'
alias ln='ln -i'
alias own='chown --preserve-root'

# System
## System monitoring tools (disk, RAM, mounts, processes...)
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
