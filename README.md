# Xiaomi Redmi 3 (codenamed ido) OpenSource kernel.
Cloned from `ido-l-oss` branch from [Xiaomi_Kernel_OpenSource git](https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/ido-l-oss).


## Current project status -> WIP
- [x] compile
- [x] generate boot.img

*under testing*
- [ ] generate kernel.zip
- [ ] boots


## How to build
*FIRST TIME ONLY* - Check your OS with this script from @akhilnarang
```
sudo apt-get install curl
curl https://raw.githubusercontent.com/akhilnarang/scripts/master/build-environment-setup.sh | bash
```
1. Clone repository typing `git clone https://github.com/duniel/ido-kernel`

2. Run `autobuild.sh` and follow the steps.

3. Check output/ folder to find boot.img or kernel.zip.


## General info of device
Check specs on gsmarena site [here](http://www.gsmarena.com/xiaomi_redmi_3-7862.php)


##Thanks to
- @Anik1199 for this awesome guide and help in [this thread](http://en.miui.com/thread-293285-1-1.html)
- @ahhilnarang for the [setup scripts](https://github.com/akhilnarang/scripts)
- @MiCode for release [kernel of Xiaomi devices](https://github.com/MiCode/Xiaomi_Kernel_OpenSource)
- @xiaolu for [mkbootimg_tools](https://github.com/xiaolu/mkbootimg_tools)
