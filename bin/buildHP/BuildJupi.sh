
cd $AE_SANDBOX_PATH
echo pwd: $( pwd )
[ $( uname -a | grep hpicorp | grep -v Ubuntu | wc -w ) -gt 0 ] && {
 echo "no Ubuntu, not configuring build"
} || {
  cd work/
  PRODUCT=jupiterPE
  BUILD=dbg # default

  # zynq is a trick case
  if [ $# -gt 0 ] ; then
    [ $1 == dbg -o $1 == peta -o $1 == tasmania -o $1 == zynq7 -o $1 == zynq ] \
      && BUILD=$1 || {
        echo "wrong #1 param, quitting sandbox"
        echo "valid values: dbg, peta, tasmania, zynq7, zynq"
        exit 1 ; }
    #[ $1 == dbg -o $1 == peta -o $1 == tasmania -o $1 == zynq7 -o $1 == zynq ]
  fi

  if [ $BUILD == zynq7 -o $BUILD == zynq ] ; then
    PLATFORM=${BUILD}-threadx
    TARGET=ass
  elif [ $BUILD == dbg ] ; then
    PLATFORM=wrl17-intel
    TARGET=dbg
  elif [ $BUILD == peta ] ; then
    PLATFORM=petalinux-zynq7_tasmania
    TARGET=dbg
  elif [ $BUILD == tasmania ] ; then
    PLATFORM=wrl17-zynq7_tasmania
    # or this: TARGET=dbg
    TARGET=ass
  fi

  echo PLATFORM : $PLATFORM
  echo TARGET : $TARGET
  MODE=${PLATFORM}-${TARGET}
  echo setup mode: $MODE
  . ./setup $MODE $PRODUCT
}

PS1TARGET=$BUILD

[ $# -eq 0 ] && home || { echo pwd: $( pwd ) ; echo PS1TARGET : $PS1TARGET ; }

# if no params given, will not display the build target in PS1
. ~/ps1.sh $*

: "
[gonmarco@npdu472 work] (srecJupi)$ set | grep ^S_
S_PARAMS='zynq7-threadx-ass jupiterPE'
S_PLATFORM=jupiterPE
S_TARGET=zynq7-threadx-ass

[gonmarco@npdu472 work] (srecJupi)$ set | grep ^S_
S_PARAMS='zynq-threadx-ass jupiterPE'
S_PLATFORM=jupiterPE
S_TARGET=zynq-threadx-ass

[gonmarco@npdu472 work] (srecJupi)$ set | grep ^S_
S_PARAMS='wrl17-intel-dbg jupiterPE'
S_PLATFORM=jupiterPE
S_TARGET=wrl17-intel-dbg

(BCD0) $ set | grep ^S_
S_PARAMS='petalinux-zynq7_tasmania-dbg jupiterPE'
S_PLATFORM=jupiterPE
S_TARGET=petalinux-zynq7_tasmania-dbg
(BCD0) $



(BCD0) $ set | grep ^S_
S_PARAMS='wrl17-zynq7_tasmania-ass jupiterPE'
S_PLATFORM=jupiterPE
S_TARGET=wrl17-zynq7_tasmania-ass
(BCD0) $

"

