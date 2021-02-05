[ $# -lt 1 ] && { echo "ERROR, missing sandbox" ; exit 1 ; }
SB=$1
echo sandbox $SB ...
[ -d /local/ae/$SB ] || { echo "ERROR, sandbox $SB not found" ; exit 1 ; }

LOG=aceBuild.log
ACE=ace
MM="gmake all"
echo "command: $MM"
echo "proceed? (ctrl-C to cancel)"
read OK

>$LOG

date

build()
{
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

