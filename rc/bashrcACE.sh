PS1="\[[91;1m\]\u@ACE\$ \[[m\]"
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
export `gnome-keyring-daemon`
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
 
if [ -d /etc/profile.d ]; then
    for i in /etc/profile.d/*.sh; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### ADDED BY MARC -- BEGIN

if [ -f ~/git-prompt.sh ]; then
    . ~/git-prompt.sh
    # git prompt
    #PS1='[\u@\h \W$(__git_ps1 " ($AE_SANDBOX:%s)")]\$ '
    #PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

if [ -f ~/git-completion.sh ]; then
    . ~/git-completion.sh
fi

### ADDED BY MARC -- END

_make_completion() {
    if [ "${#COMP_WORDS[@]}" != "2" ]
    then
        return
    fi
    cur="${COMP_WORDS[1]}"
    if [ -f $AE_SANDBOX_PATH/work/build_output/$NEW_SETUP_PLATFORM/$NEW_SETUP_TARGET/build/Makefile ]
    then
        comp=`cat $AE_SANDBOX_PATH/work/build_output/$NEW_SETUP_PLATFORM/$NEW_SETUP_TARGET/build/Makefile | grep ".PHONY : " | grep -v "/fast" | sed "s/\.PHONY : //" && cat $AE_SANDBOX_PATH/foundation/cmake/Makefile | grep -oE "^[a-zA-Z0-9_.-]+:" | grep -v "PHONY" | sed "s/://"`
    else
        comp=`cat $AE_SANDBOX_PATH/foundation/cmake/Makefile | grep -oE "^[a-zA-Z0-9_.-]+:" | grep -wv "A"   | grep -wv "PHONY" | grep -wv ".DEFAULT" | grep -wv ".NOTPARALLEL" | sed "s/://"` 
    fi
    local suggestions=($(compgen -W "$comp" -- "$cur"))
    if [ "${#suggestions[@]}" -eq "1" ] 
    then
        COMPREPLY=("${suggestions[0]}") 
    else
        COMPREPLY=("${suggestions[@]}") 
    fi
}
complete -F _make_completion make
