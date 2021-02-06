#!/bin/bash

[ $# -lt 1 ] && { echo "ERROR, missing sandbox / --list option" ; exit 1 ; }

OPT_LIST_BUILD_TYPES="--list"

SB=$1
[ $SB == $OPT_LIST_BUILD_TYPES ] && echo "don't build, just list build types for all product" || {
    echo sandbox $SB ...
    [ -d /local/ae/$SB ] || { echo "ERROR, sandbox $SB not found" ; exit 1 ; }
}

shift
[ $# -ge 1 ] && {
    MY_P=$1
    echo "product (abbreviation?): $MY_P"
    shift
    [ $# -ge 1 ] && {
        MY_BT=$1
        echo "build target (abbreviation?): $MY_BT"
    }
}


LOG=aceBuild.log
ACE=ace
MM="gmake all"
[ $SB == $OPT_LIST_BUILD_TYPES ] || {
    echo "command: $MM"
    echo "proceed? (ctrl-C to cancel)"
    read OK

    >$LOG

    date
}

build()
{
    [ $SB == $OPT_LIST_BUILD_TYPES ] && {
        #echo "listing, check $P ..."
        eval [ $MY_P  ] && { [[ ! $P =~ $MY_P  ]] && return ; }
        echo "$P $B"
        return
    }
    #echo "checking for build $P $B ..."
    eval [ $MY_P  ] && { [[ ! $P =~ $MY_P  ]] && return ; }
    eval [ $MY_BT ] && { [[ ! $B =~ $MY_BT ]] && return ; }
    echo --
    CMD="$ACE -s $SB -p $P -t $B -m \"${MM[@]}\""
    echo $CMD
    ${CMD[@]} 2>&1 >>$LOG
    # TODO : this is a dirty hack, I don't know how to avoid parameter
    # expansion for commands such as "gmake all" / "gmake fast-all" etc
    # so I am forced to append twice the "-m $MM" -m \"${MM[@]}\" stuff
    OK=$?
    date
    [ $OK -eq 0 ] && echo "build OK" || {
        echo "build failed"
        eval [ $MY_P ] && { echo "product $MY_P set, quitting ..." ; exit 1 ; }
    }
}

P=jupiterPE
B=zynq-threadx-ass
build

B=wrl17-intel-dbg
build

P=polestar
B=zynq-threadx-ass
build

B=wrl17-intel_x86_64-dbg
build

P=bluemoon
B=zynq-threadx-ass
build

B=wrl17-intel_x86_64-dbg
build


P=gemini
B=zynq-threadx-ass
build

B=wrl17-intel_x86_64-dbg
build


P=skaar
B=zynq-threadx-ass
build

B=wrl17-haswell-dbg
B=wrl17-intel_x86_64-dbg
build

B=wrl80-haswell-dbg
build

