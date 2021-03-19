
export SCRIPTS='/c/Users/gonmarco/devel/gits/notes/scripts'
#export KDIFF='/C/Program\ Files/KDiff3/kdiff3.exe'
export LNKKDIFF='/c/Users/gonmarco/devel/kdiff.lnk'
export KDIFF="start $LNKKDIFF"

# git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
# git config --global --add alias.low 'log --graph --all --format="%h | %<(21,trunc)%ai | %<(25,trunc)%s"'

alias gu='git status -uno'
alias gl='git lol'
alias gll='git lol | head -12'
alias glw='git low'
alias ShowB='bash $SCRIPTS/showBranch.sh'
alias UpdtB='bash $SCRIPTS/updateBranch.sh'
alias gmods='git status -uno | grep modified: | cut -c 14- | xargs -n 1 svn log --limit 1 -q'


alias g='git status'
alias gd='git difftool -t $KDIFF'
alias gdi='git diff --internal-diff'
alias gdg='git difftool -t gvimdiff'
alias gdh='git difftool -t tkdiff HEAD'
alias gdt='git diff'
alias gdv='git difftool -t vimdiff'
alias gdf='git diff --name-status'
alias gl='git lol'
alias gl9='git lol -9'
alias gmm='git commit -m'
alias gr='git remote -v'
#alias grep='grep --color=auto'
alias gu='git status -uno'
alias gaA='git add -A'
alias gau='git add -u'
alias gpd='git push --delete'
alias gpa='git push --all'
alias gpam='git push --all mirror'
alias gfa='git fetch'
alias gfam='git fetch mirror'
alias gur='git update-ref'
alias gri='git rebase -i'
alias griA='git rebase --abort'
alias griC='git rebase --continue'
alias gmff='git merge --ff-only'
alias gmk='git mergetool -t kdiff3'
export GRH="refs/heads"
export GRR="refs/remotes"
export GRRM=$GRR"/mirror"



alias l='ls -CF --color=auto'
alias la='ls -A'
alias lah='ls -Ahl'
alias lh='ls -hl --color=auto'
alias lhr='ls -hlrt --color=auto'
alias lht='ls -hlrt | tail'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
#alias sc='svn commit -m'
alias sd='svn diff --diff-cmd ~/bin/diff3wrap.sh'
alias sdv='svn diff --diff-cmd ~/bin/diff3vimdiff.sh'
alias si='svn info'
alias sir="svn info --show-item revision"
alias siu="svn info --show-item repos-root-url"
alias siur="svn info --show-item relative-url"
alias sl='svn log'
alias sl1='svn log --limit 1'
alias sl2='svn log --limit 2'
alias sl3='svn log --limit 3'
alias slh='svn log -r HEAD'
alias sll='svn log --limit'
#alias sm='svn merge --diff3-cmd ~/bin/diff3merge.sh'
alias ss='svn status'
alias ssq='svn status -q'
alias ssu='svn status -u'
alias sup='svnversion ; svn update'


# git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
# git config --global --add alias.low 'log --graph --all --format="%h | %<(21,trunc)%ai | %<(25,trunc)%s"'


alias psg='ps ax | grep'

# some more ls aliases
alias ll='ls -l --color=auto'
alias lh='ls -hl --color=auto'
alias lhr='ls -hlrt --color=auto'
alias lht='ls -hlrt | tail'
alias la='ls -A'
alias lah='ls -Ahl'
alias l='ls -CF --color=auto'

