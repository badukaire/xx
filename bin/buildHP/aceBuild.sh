#!/bin/bash

usage()
{
    cat <<EOF

Usage #1: aceBuild.sh --help
Usage #2: aceBuild.sh --list [<product abbrev>] [<build target abbrev>]
Usage #3: aceBuild.sh [--command=<make target>] <sandbox> \\
          [<product abbrev>] [<build target abbrev>]
EOF
}

help_description()
{
    cat <<EOF
Wrapper script for the ACE sandbox build instance commands.

Provides an easier user interface, a meaningful and cleaner output. Can
list the long build target names and allows them to be loosely typed.

The script requires a file targets.txt with your preferred products and build
target combinations. The lines of this file must be colon-separated pairs of
<product>:<build target> (see provided example files), and can be commented with '#'.

The build output is sent to the aceBuild.log file.
EOF
}

help_examples()
{
    cat <<EOF

Examples:

$ aceBuild.sh --list          # lists all available products/build targets
$ aceBuild.sh --list polestar # lists the polestar build targets
$ aceBuild.sh --list pole     # should do the same as above
$ aceBuild.sh BCD2            # builds all available products/targets in sandbox BCD2
$ aceBuild.sh BCD2 polestar   # builds all polestar targets (gmake all)
$ aceBuild.sh BCD2 pole       # should do the same as above
$ aceBuild.sh BCD2 pole zynq  # builds all the polestar zynq targets
$ aceBuild.sh --command=fast-product BCD2 blue dbg   ## if command not specified => 'all'
$ aceBuild.sh --command=MediaTrackingManagerMalt BCD2 pole dbg
$ aceBuild.sh --command=fast-gtest_patum_MediaTrackingManagerMalt_gtest_a_u BCD2 jupi dbg
EOF
}

help()
{
    help_description
    usage
    help_examples
}


[ $# -lt 1 ] && { echo "ERROR, missing sandbox / --list option" ; usage ; exit 1 ; }

OPT_HELP="--help"
OPT_MAKE_TARGET_COMMAND="--command"
OPT_LIST_BUILD_TYPES="--list"

SB=$1
[ $SB == $OPT_HELP ] && { help ; exit 0 ; }

[[ $SB == "${OPT_MAKE_TARGET_COMMAND}="* ]] && {
    echo "make target opt & parameter: $SB"
    MAKE_TARGET_COMMAND=`echo $SB | cut -d = -f 2`
    echo "make target command: $MAKE_TARGET_COMMAND"
    shift # pick the sandbox for the next check
    SB=$1
}

[ $SB == $OPT_LIST_BUILD_TYPES ] || {
    [ -d /local/ae/$SB ] || { echo "ERROR, sandbox $SB not found" ; usage ; exit 1 ; }
    echo "using sandbox: $SB"
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
eval [ $MAKE_TARGET_COMMAND ] && MM="gmake $MAKE_TARGET_COMMAND" || MM="gmake all"
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
    CMD="$ACE -s $SB -p $P -t $B"
    # TODO : this is a dirty hack, I don't know how to avoid parameter
    # expansion for commands such as "gmake all" / "gmake fast-all" etc
    # so I am forced to append twice the "-m $MM" -m \"${MM[@]}\" stuff
    echo $CMD -m \"${MM[@]}\"
    $CMD -m "${MM[@]}" 2>&1 >>$LOG
    OK=$?
    date
    [ $OK -eq 0 ] && echo "build OK" || {
        echo "build failed"
        eval [ $MY_P ] && { echo "product $MY_P set, quitting ..." ; exit 1 ; }
    }
}


FILE_TARGETS=targets.txt
[ -f $FILE_TARGETS ] || { echo "file $FILE_TARGETS with products / build targets not found" ; exit 1 ; }

while read PT <&3 # read lines, trimming whitespace, not using stdin
do
    PTL=`echo $PT | cut -d# -f1`
    P=`echo $PTL | cut -d: -f1`
    [ -z $P ] && continue
    B=`echo $PTL | cut -d: -f2`
    [ -z $B ] && continue
    build
done 3< $FILE_TARGETS

