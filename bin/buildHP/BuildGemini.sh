
# gemini
# --------------------------------------------------------------------------------
# Targets:  wrl17-intel_x86_64(dbg ass opt), zynq-threadx(dbg ass opt)
# Products: gemini


cd $AE_SANDBOX_PATH
echo pwd: $( pwd )
[ $( uname -a | grep hpicorp | grep -v Ubuntu | wc -w ) -gt 0 ] && {
 echo "no Ubuntu, not configuring build"
} || {
  cd work/
  PRODUCT=gemini
  BUILD=dbg # default

  # zynq is a trick case
  if [ $# -gt 0 ] ; then
    [ $1 == dbg -o $1 == peta -o $1 == tasmania -o $1 == zynq ] \
      && BUILD=$1 || {
        echo "wrong #1 param, quitting sandbox"
        echo "valid values: dbg, zynq"
        exit 1 ; }
    #[ $1 == dbg -o $1 == zynq ]
  fi

  if [ $BUILD == zynq ] ; then
    PLATFORM=${BUILD}-threadx
    TARGET=ass
  elif [ $BUILD == dbg ] ; then
    PLATFORM=wrl17-intel_x86_64
    TARGET=dbg
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
[gonmarco@npdu472 work] (nvmHandlerPixartFakeCaiera)$ set | grep ^S_
S_PARAMS='wrl17-intel_x86_64-dbg gemini'
S_PLATFORM=gemini
S_TARGET=wrl17-intel_x86_64-dbg
[gonmarco@npdu472 work] (nvmHandlerPixartFakeCaiera)$

[gonmarco@npdu472 work] (nvmHandlerPixartFakeCaiera)$ set | grep ^S_
S_PARAMS='zynq-threadx-ass gemini'
S_PLATFORM=gemini
S_TARGET=zynq-threadx-ass
[gonmarco@npdu472 work] (nvmHandlerPixartFakeCaiera)$

"

