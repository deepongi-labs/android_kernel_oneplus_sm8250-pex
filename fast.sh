#!/bin/bash
export KERNEL_DIR="/home/deepongi/Android/IllusionX_sm8250"
export KBUILD_OUTPUT="/home/deepongi/Android/IllusionX_sm8250/out"
export ZIP_DIR="/home/deepongi/Android/AnyKernel3"
export ZIP_OUT_DIR="/home/deepongi/Android/Out_Zips"
#make O=$KBUILD_OUTPUT mrproper
rm -rf out
export USE_CCACHE=1
export ARCH=arm64
export VARIANT="deepongi-kernel-r01"
export HASH=`git rev-parse --short=4 HEAD`
export KERNEL_ZIP="$VARIANT-$HASH"
export LOCALVERSION=~`echo $KERNEL_ZIP`
make O=$KBUILD_OUTPUT CC=clang vendor/kona-perf_defconfig
make -j$(nproc --all) O=$KBUILD_OUTPUT CC=clang CROSS_COMPILE=/mnt/Hawai/toolchains/gcc-linaro-12.2.1-2023.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- CROSS_COMPILE_ARM32=/mnt/Hawai/toolchains/gcc-linaro-12.2.1-2023.01_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
cp -v $KBUILD_OUTPUT/arch/arm64/boot/Image $ZIP_DIR/
cd $ZIP_DIR
zip -r9 $VARIANT-$HASH.zip *
mv -v $VARIANT-$HASH.zip $ZIP_OUT_DIR/
echo -e "${green}"
echo "-------------------"
echo "Build Completed"
echo "-------------------"
echo -e "${restore}"
echo "                                                     "
echo "  _       __        _          _     _      _        "
echo " (_)_ _  / _|___ __| |_ ___ __| |___| |__ _| |__ ___ "
echo " | | ' \|  _/ -_) _|  _/ -_) _  |___| / _  | '_ (_-< "
echo " |_|_||_|_| \___\__|\__\___\__,_|   |_\__,_|_.__/__/ "
echo "                                                     "
echo "                                                     "
                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
