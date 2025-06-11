alias ll = ls -l
alias la = ls -a

alias lg = lazygit
alias bt = btop --utf-force
# alias bt = btop
alias fk = thefuck

# =============================== Bat =========================================
alias b = bat
alias bn = bat --number
alias bnl = bat --number --line-range
alias bp = bat --plain
alias bpl = bat --plain --line-range
alias bl = bat --line-range

# alias ch = chezmoi
# alias chad = chezmoi add
# alias chap = chezmoi apply
# alias chd = chezmoi diff
# alias chda = chezmoi data
# alias chs = chezmoi status


# =============================== Git =========================================
def git_current_branch [] {
    (gstat).branch
}

def git_main_branch [] {
    git remote show origin
        | lines
        | str trim
        | find --regex 'HEAD .*?[：: ].+'
        | first
        | str replace --regex 'HEAD .*?[：: ]\s*(.+)' '$1'
}

#
# Aliases
# (sorted alphabetically)
#

alias ga = git add
alias gaa = git add --all
alias gapa = git add --patch
alias gau = git add --update
alias gav = git add --verbose
alias gap = git apply
alias gapt = git apply --3way

alias gb = git branch
alias gba = git branch --all
alias gbd = git branch --delete
alias gbD = git branch --delete --force
alias gbl = git blame -b -w
alias gbm = git branch --move
alias gbmc = git branch --move (git_current_branch)
alias gbnm = git branch --no-merged
alias gbr = git branch --remote
alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsn = git bisect new
alias gbso = git bisect old
alias gbsr = git bisect reset
alias gbss = git bisect start

alias gc = git commit --verbose
alias gc! = git commit --verbose --amend
alias gcn = git commit --verbose --no-edit
alias gcn! = git commit --verbose --no-edit --amend
alias gca = git commit --verbose --all
alias gca! = git commit --verbose --all --amend
alias gcan! = git commit --verbose --all --no-edit --amend
alias gcans! = git commit --verbose --all --signoff --no-edit --amend
alias gcam = git commit --all --message
alias gcsm = git commit --signoff --message
alias gcas = git commit --all --signoff
alias gcasm = git commit --all --signoff --message
alias gcb = git checkout -b
alias gcd = git checkout develop
alias gcf = git config --list

alias gcl = git clone --recurse-submodules
alias gclean = git clean --interactive -d
def gpristine [] {
    git reset --hard
    git clean -d --force -x
}
alias gcm = git checkout (git_main_branch)
alias gcmsg = git commit --message
alias gco = git checkout
alias gcor = git checkout --recurse-submodules
alias gcount = git shortlog --summary --numbered
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
alias gcs = git commit --gpg-sign
alias gcss = git commit --gpg-sign --signoff
alias gcssm = git commit --gpg-sign --signoff --message

alias gd = git diff
alias gdca = git diff --cached
alias gdcw = git diff --cached --word-diff
alias gdct = git describe --tags (git rev-list --tags --max-count=1)
alias gds = git diff --staged
alias gdt = git diff-tree --no-commit-id --name-only -r
alias gdup = git diff @{upstream}
alias gdw = git diff --word-diff

alias gf = git fetch
alias gfa = git fetch --all --prune
alias gfo = git fetch origin

alias gg = git gui citool
alias gga = git gui citool --amend

alias ghh = git help

alias gignore = git update-index --assume-unchanged

alias gl = git log
alias glg = git log --stat
alias glgp = git log --stat --patch
alias glgg = git log --graph
alias glgga = git log --graph --decorate --all
alias glgm = git log --graph --max-count=10
alias glo = git log --oneline --decorate
alias glod = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset'
alias glods = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
alias glol = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ar(char rp) %C(char lp)bold blue(char rp)<%an>%Creset'
alias glola = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ar(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --all
alias glols = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ar(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --stat

alias gm = git merge
alias gmtl = git mergetool --no-prompt
alias gmtlvim = git mergetool --no-prompt --tool=vimdiff
alias gma = git merge --abort
def gmom [] {
    let main = (git_main_branch)
    git merge $"origin/($main)"
}

alias gp = git push
alias gpd = git push --dry-run
alias gpf = git push --force-with-lease
alias gpf! = git push --force
alias gpl = git pull
def gpoat [] {
    git push origin --all; git push origin --tags
}
alias gpod = git push origin --delete
alias gpodc = git push origin --delete (git_current_branch)
alias gpr = git pull --rebase
alias gpu = git push upstream
alias gpv = git push --verbose

alias gr = git remote
alias gpra = git pull --rebase --autostash
alias gprav = git pull --rebase --autostash --verbose
alias gprv = git pull --rebase --verbose
alias gpsup = git push --set-upstream origin (git_current_branch)
alias gra = git remote add
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbd = git rebase develop
alias grbi = git rebase --interactive
alias grbm = git rebase (git_main_branch)
alias grbo = git rebase --onto
alias grbs = git rebase --skip
alias grev = git revert
alias grh = git reset
alias grhh = git reset --hard
alias groh = git reset $"origin/(git_current_branch)" --hard
alias grm = git rm
alias grmc = git rm --cached
alias grmv = git remote rename
alias grrm = git remote remove
alias grs = git restore
alias grset = git remote set-url
alias grss = git restore --source
alias grst = git restore --staged
alias grt = cd (git rev-parse --show-toplevel or echo .)
alias gru = git reset --
alias grup = git remote update
alias grv = git remote --verbose

alias gsb = git status --short --branch
alias gsd = git svn dcommit
alias gsh = git show
alias gshs = git show -s
alias gsi = git submodule init
alias gsps = git show --pretty=short --show-signature
alias gsr = git svn rebase
alias gss = git status --short
alias gst = git status

alias gsta = git stash push
alias gstaa = git stash apply
alias gstc = git stash clear
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gsts = git stash show --text
alias gstu = gsta --include-untracked
alias gstall = git stash --all
alias gsu = git submodule update
alias gsw = git switch
alias gswc = git switch --create

alias gts = git tag --sign
def gtv [] {
    git tag | lines | sort
}
alias glum = git pull upstream (git_main_branch)

alias gunignore = git update-index --no-assume-unchanged
alias gup = git pull --rebase
alias gupv = git pull --rebase --verbose
alias gupa = git pull --rebase --autostash
alias gupav = git pull --rebase --autostash --verbose

alias gwch = git whatchanged -p --abbrev-commit --pretty=medium

alias gwt = git worktree
alias gwta = git worktree add
alias gwtls = git worktree list
alias gwtmv = git worktree move
alias gwtrm = git worktree remove

alias gam = git am
alias gamc = git am --continue
alias gams = git am --skip
alias gama = git am --abort
alias gamscp = git am --show-current-patch
