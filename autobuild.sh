#!/bin/bash
clear

#env values, edit if necessary
arch=arm64
subarch=arm64
toolchain=${PWD}/toolchain/bin/aarch64-linux-android-
defconfig=wt88509_64-perf_defconfig

#initial setup & config
imgtools=${PWD}/imgtools
output=${PWD}/output
cores=`grep -c processor /proc/cpuinfo`
touch ${output}/compile.log
touch ${output}/errors.log
log=${output}'/compile.log'
errors=${output}'/errors.log'
blog=${output}'/bootimg.log'
image=${PWD}/arch/arm64/boot/Image
imagegz=${PWD}/arch/arm64/boot/Image.gz

#delete previous image builds
if [ -e $image ]; then
	rm $image
fi
if [ -e $imagegz ]; then
	rm $imagegz
fi
if [ -e ${output}/boot.img ]; then
	rm ${output}/boot.img
fi

#apply env conf
echo '--Applying env conf...'
echo '======================'
export ARCH="$arch"
export SUBARCH="$subarch"
export CROSS_COMPILE="$toolchain"
echo
echo '--Environment config applied.'
echo '============================='

#compile kernel
echo
echo
echo '--Cleaning previous builds...' | tee ${log} ${errors}
echo '=============================' | tee -a ${log} ${errors}
make clean >> ${log} 2>> ${errors}
echo
echo '--Making defconfig...' | tee -a ${log} ${errors}
echo '======================' | tee -a ${log} ${errors}
make $defconfig >> ${log} 2>> ${errors}
echo
echo '--Making kernel image...' | tee -a ${log} ${errors}
echo '========================' | tee -a ${log} ${errors}
make -j${cores} >> ${log} 2>> ${errors}

echo 
echo

if ! [ -e $image ]; then
	echo '--Something went wrong... check the logs on '$output;
exit 1
fi
echo '--Kernel image compiled :)'
echo '=========================='

# make boot.img
echo
echo
echo '--Creating boot.img...'
echo '======================'
cp ${imagegz} ${imgtools}/bootimg/kernel
cd ${imgtools}
bash mkboot bootimg boot.img > ${blog}
mv boot.img ${output}/boot.img
rm ${imgtools}/bootimg/kernel
echo
echo '--boot.img created...'
echo '====================='

# WIP - make kernel.zip

# BYE BYE
echo
echo 
echo
echo 'Build finished! Check output folder!...'
echo '======================================='
echo '      script by duniel - adios :D      '