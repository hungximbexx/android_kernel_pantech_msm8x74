#!/bin/bash
###############################################################################
#
#                           Kernel Build Script 
#
###############################################################################

##############################################################################
# set toolchain
##############################################################################

export ARCH=arm
export PATH=/home/chautruongthinh/cm13/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:$PATH
export CROSS_COMPILE=arm-linux-androideabi-

##############################################################################
# make zImage
##############################################################################
mkdir -p ./obj/KERNEL_OBJ/
make ARCH=arm O=./obj/KERNEL_OBJ/ cyanogenmod_ef63_defconfig
make -j8 ARCH=arm O=./obj/KERNEL_OBJ/ 2>&1 | tee kernel_log.txt

##############################################################################
# Make dt.img & copy zImage
##############################################################################
./mkdt.sh

