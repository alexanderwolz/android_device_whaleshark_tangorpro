# Whale Shark - an AAOS device configuration for Google Pixel Tablet (tangorpro)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/alexanderwolz/android_device_whaleshark_tangorpro)
![GitHub](https://img.shields.io/badge/arch-arm64v8-orange)
![GitHub](https://img.shields.io/github/license/alexanderwolz/android_device_whaleshark_tangorpro)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/alexanderwolz/android_device_whaleshark_tangorpro)
![GitHub all releases](https://img.shields.io/github/downloads/alexanderwolz/android_device_whaleshark_tangorpro/total?color=informational)

## 🧑‍💻 About

This device configuration is intented to be run on a *Google Pixel Tablet (tangorpro)*

See also [aosp-docker](https://github.com/alexanderwolz/aosp-docker) for a Docker-based tool chain and [android-build-tools](https://github.com/alexanderwolz/android-build-tools) for additonal sync and flash scripts.


## 🛠️ Setup

### Download AOSP repository

See [here](https://github.com/alexanderwolz/android_device_whaleshark_manifest/tree/android-14) for setup of AOSP repository and dependencies.

### Add binary drivers
1. Download binaries for *tangorpro* from [here](https://developers.google.com/android/drivers?hl=en) according to branch and build id
2. Extract with ```tar -xvf google_devices-tangorpro-*.tgz```
3. Copy *extract-google_devices-tangorpro.sh* to *$AOSP_HOME*
4. Execute with ```bash extract-google_devices-tangorpro.sh```
5. Drivers will be extracted to ```vendor/google_devices/tangorpro```
6. Clean up with ```rm extract-google_devices-tangorpro.sh```


## ⚙️ Build the product

This follows the normal AOSP build approach, e.g.
1. ```cd $AOSP_HOME```
2. ```source build/envsetup.sh```
3. ```lunch whaleshark_tangorpro-userdebug```
4. ```m -j$(nproc --all)```
5. ```m -j$(nproc --all) android.hardware.automotive.vehicle@2.0-default-service```
6. See compiled files at ```$ANDROID_PRODUCT_OUT``` (should be ```out/target/product/tangorpro```)


## ✨ Flash the build using $ANDROID_PRODUCT_OUT

1. Copy or rsync the ```$ANDROID_PRODUCT_OUT``` folder to localhost, if built remotely
2. Check that ```$ANDROID_PRODUCT_OUT``` is set and export otherwise
3. ```adb reboot bootloader```
4. ```fastboot flashing unlock```
5. ```fastboot flash bootloader $ANDROID_PRODUCT_OUT/bootloader.img``` (could be skipped)
6. ```fastboot reboot bootloader```
7. ```fastboot -w flashall```
8. You should see the device booting up, but being stuck at a black screen due to missing vendor sync

## 📦 Update vendor partition
Currently, there is an issue with vendor partition, so it needs to be adb synced manually, but these are the steps:

1. Set ```$ANDROID_PRODUCT_OUT``` to the folder containing the ```vendor``` folder
2. ```adb root```
3. ```adb remount``` (eventually you need to ```adb shell vdc checkpoint commitChanges```)
4. ```adb reboot```
5. ```adb root && adb remount```
6. ```adb synch vendor && adb reboot```
7. The device should now be fully functional and welcoming you with the Dashboard window.

See also [this article](https://source.android.com/docs/automotive/start/pixelxl) as a reference for Nexus and Pixel devices. Additionally you can use my script collection [here](https://github.com/alexanderwolz/android-build-tools) for an automated sync and device flash.


## 🧑‍💻 Known Issues

### General

1. Android Automotive service is not build automatically even though it is set in the product-package definition. 
2. While building the firmware, some vendor files are missing in the image, they must be pushed manually via ```adb sync vendor```
