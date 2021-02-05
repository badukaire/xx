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
_ae_init_completion() { 
    # If not make %, return 
    if [ "${#COMP_WORDS[@]}" != "2" ] 
    then 
	return 
    fi 
    cur="${COMP_WORDS[1]}" 
    comp=$(ls -l /ae/ | awk '{print $9}' ) 
    local suggestions=($(compgen -W "$comp" -- "$cur")) 
    if [ "${#suggestions[@]}" -eq "1" ] 
    then 
	COMPREPLY=("${suggestions[0]}") 
    else 
	COMPREPLY=("${suggestions[@]}") 
    fi 
} 
complete -F _ae_init_completion ae_init_sandbox 
