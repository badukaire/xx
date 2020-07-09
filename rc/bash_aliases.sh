
# this is for printers
slog() { echo SESSION.$1.LOGS/printer.$1.log.gz ; }
zll() { zless $( slog $1 ) ; }
zgl() { zgrep "$1" $( slog $2 ) ; }

# LS

alias l='ls -CF --color=auto'
alias la='ls -A'
alias lah='ls -Ahl'
alias lh='ls -hl --color=auto'
alias lhr='ls -hlrt --color=auto'
alias lht='ls -hlrt | tail'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'

alias psg='ps ax | grep'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# VIM

alias vx='vim -X'
alias vxw='view -X'


# SVN

alias ss='svn status'
alias ssq='svn status -q'
alias ssu='svn status -u'
alias sup='svnversion ; svn update'

alias sc='svn commit -m'

alias si='svn info'
alias sir='svn info --show-item revision'
alias siu='svn info --show-item repos-root-url'
alias siur='svn info --show-item relative-url'

alias sd='svn diff --diff-cmd ~/bin/diff3wrap.sh'
alias sdk='svn diff --diff-cmd ~/bin/diff3kdiff3.sh'
alias sdv='svn diff --diff-cmd ~/bin/diff3vimdiff.sh'
alias sBC='svn diff --diff-cmd ~/bin/diff3bc.sh'

alias sm='svn merge --diff3-cmd ~/bin/diff3merge.sh'

alias sl='svn log'
alias sl1='svn log --limit 1'
alias sl2='svn log --limit 2'
alias sl3='svn log --limit 3'
alias slh='svn log -r HEAD'
alias sll='svn log --limit'


# GIT

# git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
# git config --global --add alias.low 'log --graph --all --format="%h | %<(21,trunc)%ai | %<(25,trunc)%s"'

# by Olivier Lacan

# https://gist.github.com/olivierlacan/3237765
# git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
# git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
# git config --global alias.mylog "log --pretty=format:'%h %s [%an]' --graph"
# git config --global alias.lo "log --graph --decorate --pretty=oneline --abbrev-commit"

# git config --global alias.lo "log --graph --decorate --pretty=oneline --abbrev-commit"

# different / improved git lol?
# https://gist.github.com/olivierlacan/3237765
# git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
# git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
# git config --global alias.mylog "log --pretty=format:'%h %s [%an]' --graph"


export GRH="refs/heads"
export GRRM=$GRR"/mirror"
export GRR="refs/remotes"

alias g='git status'
alias gu='git status -uno'
alias gmods='git status -uno | grep modified: | cut -c 14- | xargs -n 1 svn log --limit 1 -q'

alias gaA='git add -A'
alias gau='git add -u'
alias gdf='git diff --name-status'
alias gdi='git diff --internal-diff'

alias gdfm='gdf mirror/$( git rev-parse --abbrev-ref HEAD )'
alias gdkm='gdk mirror/$( git rev-parse --abbrev-ref HEAD )'

alias gd='git difftool -t tkdiff'
alias gdg='git difftool -t gvimdiff'
alias gdh='git difftool -t tkdiff HEAD'
alias gdk='git difftool -t kdiff3'
alias gdt='git diff-tree -r --name-only'
alias gdv='git difftool -t vimdiff'

alias gV='git checkout --'
alias gVa='git reset HEAD'

alias gmff='git merge --ff-only'
alias gmk='git mergetool -t kdiff3'

alias gfa='git fetch'
alias gfam='git fetch mirror'

alias gr='git remote -v'

alias gpa='git push --all'
alias gpam='git push --all mirror'
alias gpd='git push --delete'
alias gpdm='git push --delete mirror $( git rev-parse --abbrev-ref HEAD )'
alias gphm='git push mirror HEAD'

alias go='git lo'
alias gl='git lol'
alias gl1='git lol1'
alias gl9='git lol -9'
alias gll='git lol -22'
alias glo='git lo -22'
alias glw='git low'

alias gmm='git commit -m'
alias gma='git commit --amend'

alias gri='git rebase -i'
alias griA='git rebase --abort'
alias griC='git rebase --continue'

alias gur='git update-ref'

alias gShowB='bash $SCRIPTS/showBranch.sh'
alias gUpdtB='bash $SCRIPTS/updateBranch.sh'


