cd $AE_SANDBOX_PATH
# TODO : dbg 32 bits is no longer allowed in PS BCD
# TODO : add help
# TODO : make UI more intuitive
# TODO : explain the optional ps1.sh
echo pwd: $( pwd )
[ $( uname -a | grep hpicorp | grep -v Ubuntu | wc -w ) -gt 0 ] && {
 echo "no Ubuntu, not configuring build"
} || {
 cd work/
 BASEMODE=wrl17-intel
 #wrl17-intel_x86_64-dbg
 #wrl17-intel_x86_64-dbg
 TARGET=dbg

 # from setup error message:
 #zynq-threadx(dbg ass opt)
 #Targets:  wrl17-intel_x86_64(dbg ass opt), wrl17-intel(dbg ass opt), zynq-threadx(dbg ass opt)

 export PS1TARGET=$TARGET
 # zynq is a trick case
 if [ $# -gt 0 ] ; then
   [ $1 == dbg -o $1 == ass -o $1 == opt -o $1 == zynq ] && TARGET=$1 || { echo "wrong #1 param, quitting sandbox" ; exit 1 ; }
 else # workaround for default to be dbg-64
   BASEMODE=${BASEMODE}"_x86_64" && PS1TARGET=${PS1TARGET}-$2
 fi

 [ $TARGET == zynq ] && BASEMODE="zynq-threadx" && PS1TARGET=$1 && TARGET="ass" # special case, TARGET should be "ass"
 if [ $# -gt 1 ] ; then
   [ $2 == "64" -o $2 == "zynq" ] || { echo "wrong #2 param, quitting sandbox" ; exit 1 ; }
   [ $2 == "64" ] && BASEMODE=${BASEMODE}"_x86_64" && PS1TARGET=${PS1TARGET}-$2
   [ $2 == "zynq" ] && BASEMODE="zynq-threadx" && TARGET="ass" # TARGET should be "ass"
 fi
 echo PLATFORM : $BASEMODE
 echo TARGET : $TARGET
 MODE=${BASEMODE}-${TARGET}
 echo setup mode: $MODE
 . ./setup $MODE polestar
}

[ $# -eq 0 ] && home || { echo pwd: $( pwd ) ; echo PS1TARGET : $PS1TARGET ; }

# if no params given, will not display the build target in PS1
# TODO : do not run if ps1 does not exist (or not given)
. ~/ps1.sh $*


# is it required to set the proxy???
#export http_proxy=http://web-proxy.il.hpicorp.net:8080
#export https_proxy=$http_proxy
#export ftp_proxy=$http_proxy


#polestar  
#--------------------------------------------------------------------------------
#Targets:  wrl17-intel_x86_64(dbg ass opt), wrl17-intel(dbg ass opt), zynq-threadx(dbg ass opt)
#Products: polestar



#. /$AE_SANDBOX_PATH/ps1.sh 

# # first, run setup / . ./Build.sh
# runQtCreator -compiledatlas -p polestar -pl wrl17-intel-dbg
# runQtCreator -compiledatlas -p polestar -pl wrl17-intel-ass

# ./configure -p polestar

# PIP=15.83.11.237   # LP6303
# PIP=15.83.19.110
# PIP=15.83.18.222
# PIP=15.83.8.155
# PIP=15.83.5.74
# PIP=15.83.5.142
# PIP=15.83.6.8
# PIP=15.83.21.217

# PIP=15.83.22.3 # JAGUAR Jordi Bas


# PIP=15.87.227.205 # Printer IP
# PIP=15.87.226.91  # Printer IP


# build paths

# cd build_output/polestar/wrl17-intel-dbg/polestar/RPMS/
# ./build_output/polestar/zynq-threadx-ass/foundation/home/etc/product.ist.reference
# ./build_output/polestar/wrl17-intel-dbg/foundation/home/etc/product.ist.reference


# target paths


# # update product signature stamp with svn revision

# work && find . -name ProductSignature.h 2>/dev/null | grep $S_TARGET | xargs -n 1 rm


# # PARTIAL BUILDS
# gmake FL_MediaSystemMalt
# gmake FL_ServoMotorPaperMalt
# gmake FL_PaperAxisMalt
# gmake FL_MechanicalInitiatorFake
# gmake FL_MechanicalInitiatorPolestar
# gmake libFL_MechanicalInitiatorPolestar

# deploy the product.ist.reference
# gmake fast-product_isd
# gmake product_isd

# install without gmake fast-all:
# gmake INSTALL_WITHOUT_DEPENDENCIES=YES install

# gmake, force omes regeneration
# rm out.md5 (./build_output/polestar/wrl17-intel_x86_64-dbg/patum/home/ws/out.md5)
# gmake omes


# gmake help-omes
# gmake patum_libraries 

# # CREATE a TASK:
#
# copy:
# ae_task create ipg-atlas /branches/POLESTAR_00_19_13 shaun_testbed_19-07

#
# checkout:
# ae_make_sandbox ipg-atlas /branches/POLESTAR_00_19_13/tasks/shaun_testbed_19-07 shaunBD8_1

# # GENERIC BUILDS
# gmake PARALLEL=YES patum  # build
# gmake PARALLEL=YES baobab # link

# gmake PARALLEL=YES patum && gmake PARALLEL=YES baobab

# DEPLOYING TO TARGET
# ae_tupdate -op target $PIP
# gmake PARALLEL=YES patum && gmake PARALLEL=YES baobab && ae_tupdate -op target $PIP
# ssh root@$PIP reboot

# full build / tupdate / reboot with messages
# gmake PARALLEL=YES patum && { echo PATUM OK ; gmake PARALLEL=YES baobab ; } && { echo "LINK OK, ping to [$PIP]" ; ping -c 2 $PIP ; } && { echo printer responds OK ; ae_tupdate -op target $PIP ; } && { echo TUPDATE OK, REBOOT ... ; ssh root@$PIP reboot ; }

# reactivate mar menor files:
# ServicingEngine reloadModule


# MANUAL DEPLOY
# ae_tarbuilder -op fmw

