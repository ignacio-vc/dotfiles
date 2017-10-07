alias dotfile='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME/'

alias sau='sudo aptitude update'
alias sai='sudo aptitude install'
alias sar='sudo aptitude remove'
alias sap='sudo aptitude purge'
alias sac='sudo aptitude autoclean'

alias safe='sudo aptitude safe-upgrade'
alias full='sudo aptitude full-upgrade'

alias sup='sau && safe'
alias eyy='sau && full'

alias off='sudo shutdown -h now'
alias bye='eyy && off' 

alias julia='~/Documents/julia/julia'
alias jupyter='~/.local/bin/jupyter-notebook' 
alias path='echo $PATH | tr ":" "\n"'
alias vi='vim'
alias :e='vim'
alias ,e='vim $HOME/.vimrc'
alias :q='logout'
alias which='type -a'
alias wget='wget --content-disposition'
