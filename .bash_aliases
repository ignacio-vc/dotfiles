alias julia='~/Documents/julia/julia'
alias jupyter='~/.local/bin/jupyter-notebook'

alias dotfile='/usr/bin/git --git-dir=~/.myconfig/ --work-tree=~/'
alias lal='ls -al'
alias ds4='sudo ds4drv --hidraw --config ~/.config/ds4drv.conf'

alias sau='sudo aptitude update'
alias sai='sudo aptitude install'
alias sar='sudo aptitude remove'
alias sap='sudo aptitude purge'
alias sac='sudo aptitude autoclean'

alias safe='sudo aptitude safe-upgrade'
alias full='sudo aptitude full-upgrade'

alias sup='sau && safe && sac'
alias eyy='sau && full && sac'

alias off='sudo shutdown -h now'

alias bye='eyy && off' 
