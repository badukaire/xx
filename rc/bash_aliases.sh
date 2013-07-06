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

alias bdk='bzr diff --using kdiff3'
alias bl='bzr log | more'
alias bs='bzr status'

alias psg='ps ax | grep'

# some more ls aliases
alias ll='ls -l --color=auto'
alias lh='ls -hl --color=auto'
alias lhr='ls -hlrt --color=auto'
alias lht='ls -hlrt | tail'
alias la='ls -A'
alias lah='ls -Ahl'
alias l='ls -CF --color=auto'


alias rdtwin='rdesktop -u gonzalezc -p fontvella -d TECSIDEL 172.18.136.60 -g 1240x940'
alias rdtfj='rdesktop -u remote -p lediscet -d OSLORING 172.24.16.2 -g 1240x940'
alias rdtalg='rdesktop -u remote -p lediscet 10.4.$SITE.132 -g 1240x940'
alias rdtDalen='rdesktop -u remote -p lediscet 10.120.5.4 -g 1240x940'

