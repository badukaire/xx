[ $# -lt 1 ] && { echo "ERROR, missing sandbox" ; exit 1 ; }
SB=$1
echo sandbox $SB ...
[ -d /local/ae/$SB ] || { echo "ERROR, sandbox $SB not found" ; exit 1 ; }

MM="gmake all"
echo "command: $MM"
echo "proceed? (ctrl-C to cancel)"
read OK

LOG=aceBuild.log
>$LOG

#ACE=/home/gonmarco/github/xx/bin/buildHP/ace1
ACE=ace
P=jupiterPE
B=zynq-threadx-ass
CMD="$ACE -s $SB -p $P -t $B"
echo $CMD -m \"${MM[@]}\"
#/home/gonmarco/github/xx/bin/buildHP/ace1 -s $SB -p $P -t $B -m \'$( echo $MM )\'
#/home/gonmarco/github/xx/bin/buildHP/ace1 -s $SB -p $P -t $B -m \'$( echo $MM )\'
#/home/gonmarco/github/xx/bin/buildHP/ace1 -s $SB -p $P -t $B -m \"$( echo $MM )\"

$CMD -m "${MM[@]}" 2>&1 >>$LOG
#$CMD -m "${MM[@]}"
#/home/gonmarco/github/xx/bin/buildHP/ace1 -s $SB -p $P -t $B -m "${MM[@]}"
OK=$?
date
[ $OK -eq 0 ] || { echo "failed, quitting" ; exit 1 ; }
echo OK

B=wrl17-intel-dbg
CMD="$ACE -s $SB -p $P -t $B"
echo $CMD -m \"${MM[@]}\"
$CMD -m "${MM[@]}" 2>&1 >>$LOG
OK=$?
date
[ $OK -eq 0 ] || { echo "failed, quitting" ; exit 1 ; }
echo OK
#ace -s $SB -m $T -p jupiterPE -t zynq-threadx-ass
#ace -s $SB -m $T -p jupiterPE -t wrl17-intel-dbg


P=polestar

B=zynq-threadx-ass

CMD="$ACE -s $SB -p $P -t $B"
echo $CMD -m \"${MM[@]}\"
$CMD -m "${MM[@]}" 2>&1 >>$LOG
OK=$?
date
[ $OK -eq 0 ] || { echo "failed, quitting" ; exit 1 ; }
echo OK


B=wrl17-intel_x86_64-dbg

CMD="$ACE -s $SB -p $P -t $B"
echo $CMD -m \"${MM[@]}\"
$CMD -m "${MM[@]}" 2>&1 >>$LOG
OK=$?
date
[ $OK -eq 0 ] || { echo "failed, quitting" ; exit 1 ; }
echo OK

#ace -s $SB -m $T -p polestar -t zynq-threadx-ass
#ace -s $SB -m $T -p polestar -t wrl17-intel_x86_64-dbg

exit 0
ace -s $SB -m $T -p bluemoon -t zynq-threadx-ass
ace -s $SB -m $T -p bluemoon -t wrl17-intel_x86_64-dbg

