alias core-cd = cd 
alias ll = ls -l
alias la = ls -a

alias lg = lazygit
alias bt = btop --utf-force 
alias fk = thefuck

alias b = bat
alias bn = bat --number
alias bnl = bat --number --line-range
alias bp = bat --plain
alias bpl = bat --plain --line-range
alias bl = bat --line-range

alias gc = git clone

export alias ch = chezmoi
export alias chad = chezmoi add
export alias chade = chezmoi add --encrypt
export alias chap = chezmoi apply
export alias chd = chezmoi diff
export alias chda = chezmoi data
export alias chs = chezmoi status

export alias "chezmoi cd" = cd $'(chezmoi source-path)'
export alias "chcd" = cd $'(chezmoi source-path)'
