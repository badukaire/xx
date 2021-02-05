[ $# -lt 1 ] && { echo "ERROR, missing sandbox" ; exit 1 ; }
SB=$1
echo sandbox $SB ...
[ -d /local/ae/$SB ] || { echo "ERROR, sandbox $SB not found" ; exit 1 ; }

OPT_LIST_BUILD_TYPES="--list"

shift
[ $# -ge 1 ] && {
    MY_P=$1
    echo "product: $MY_P"
    [ $MY_P == $OPT_LIST_BUILD_TYPES ] && {
        echo "don't build, just list build types for all product"
        MY_BT=$OPT_LIST_BUILD_TYPES
    } || {
        shift
        [ $# -ge 1 ] && {
            MY_BT=$1
            [ $MY_BT == $OPT_LIST_BUILD_TYPES ] && echo "don't build, just list build types for product $MY_P" || echo "build type: $MY_BT"
            shift
        }
    }
}


LOG=aceBuild.log
ACE=ace
MM="gmake all"
#eval [ $MY_BT ] && echo eval MY_BT || echo NO eval MY_BT
eval [ $MY_BT ] && [ $MY_BT == $OPT_LIST_BUILD_TYPES ] || {
    echo "command: $MM"
    echo "proceed? (ctrl-C to cancel)"
    read OK

    >$LOG

    date
}

build()
{
    eval [ $MY_BT ] && {
        [ $MY_BT == $OPT_LIST_BUILD_TYPES ] && {
            #echo "check $P ..."
            [ $MY_P == $OPT_LIST_BUILD_TYPES -o $MY_P == $P ] && {
                #echo "MY_P: $MY_P - P: $P"
                echo "$P $B"
            }
            return
        }
    }
    #echo "checking for build $P $B ..."
    eval [ $MY_P ] && { [ ! $P == $MY_P ] && return ; }
    eval [ $MY_BT ] && { [ ! $B == $MY_BT ] && return ; }
    CMD="$ACE -s $SB -p $P -t $B"
    echo $CMD -m \"${MM[@]}\"
    $CMD -m "${MM[@]}" 2>&1 >>$LOG
    OK=$?
    date
    [ $OK -eq 0 ] || { echo "failed, quitting" ; exit 1 ; }
    echo OK
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

