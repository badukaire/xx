# HP
alias mmake='make 2>&1 | tee err2.log'
alias cdx='cd $DJRIP_TARGET_ROOT/bin'
alias cdw='cd $DJRIP_SOLUTION_ROOT/work'
alias iTests='time ./internalUnitTests --gtest_output=xml:i.xml ; head -2 i.xml'
alias eTests='time ./externalAPITests --gtest_output=xml:e.xml ; head -2 e.xml'

export ANALYSIS_TESTS_BASEDIR=/ae/testfiles/test-suites


GSOAP_IMPORT=/home/gonmarco/gsoap-2.8/gsoap/import


# legacy
alias ss='svn status'
alias sup='svnversion ; svn update'
alias ssq='svn status -q'
alias ssu='svn status -u'
alias sd='svn diff --diff-cmd ~/bin/diff3wrap.sh'
alias sdv='svn diff --diff-cmd ~/bin/diff3vimdiff.sh'
alias sm='svn merge --diff3-cmd ~/bin/diff3merge.sh'
alias si='svn info'
alias sc='svn commit -m'
alias sl='svn log'
alias sll='svn log --limit'
alias sl1='svn log --limit 1'
alias sl2='svn log --limit 2'
alias sl3='svn log --limit 3'
alias slh='svn log -r HEAD'

# git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
# git config --global --add alias.low 'log --graph --all --format="%h | %<(21,trunc)%ai | %<(25,trunc)%s"'
alias g='git status'
alias gu='git status -uno'
alias gdi='git diff --internal-diff'
alias gd='git difftool -t tkdiff'
alias gdh='git difftool -t tkdiff HEAD'
alias gdv='git difftool -t vimdiff'
alias gdg='git difftool -t gvimdiff'
alias gdt='git diff-tree -r --name-only'
alias gr='git remote -v'
alias gl='git lol'
alias gl9='git lol -9'
alias gll='git lol -22'
alias glw='git low'
alias gmm='git commit -m'
alias gaA='git add -A'
alias gau='git add -u'
alias gpd='git push --delete'
alias gpa='git push --all'
alias gpam='git push --all mirror'
alias gfa='git fetch'
alias gfam='git fetch mirror'
alias gur='git update-ref'
alias gfam='git fetch mirror'
alias gur='git update-ref'
alias gri='git rebase -i'
alias griA='git rebase --abort'
alias griC='git rebase --continue'
alias gmff='git merge --ff-only'
export GRH="refs/heads"
export GRR="refs/remotes"
export GRRM=$GRR"/mirror"
alias gShowB='bash $SCRIPTS/showBranch.sh'
alias gUpdtB='bash $SCRIPTS/updateBranch.sh'

alias psg='ps ax | grep'

# some more ls aliases
alias ll='ls -l --color=auto'
alias lh='ls -hl --color=auto'
alias lhr='ls -hlrt --color=auto'
alias lht='ls -hlrt | tail'
alias la='ls -A'
alias lah='ls -Ahl'
alias l='ls -CF --color=auto'

# TODO update for HP
alias rdt='rdesktop -u remote -d tecsidel -p lediscet -g 1260x940'
alias rdtt='rdesktop -u remote -p lediscet -g 1260x940'





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


