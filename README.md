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

See [here](https://github.com/alexanderwolz/android_device_whaleshark_manifest/tree/android-13) for setup of AOSP repository and dependencies.

### Add binary drivers
1. Download binaries for *tangorpro* from [here](https://developers.google.com/android/drivers?hl=en) according to branch and build id
2. Extract with ```tar -xvf google_devices-tangorpro-*.tgz```
3. Copy *extract-google_devices-tangorpro.sh* to *$AOSP_HOME*
4. Execute with ```bash extract-google_devices-tangorpro.sh```
6. Drivers will be extracted to ```vendor/google_devices/tangorpro```
7. Clean up with ```rm extract-google_devices-tangorpro.sh```

## ⚙️ Build the product

This follows the normal AOSP build approach, e.g.
1. ```cd $AOSP_HOME```
1. ```source build/envsetup.sh```
2. ```lunch whaleshark-userdebug```
3. ```make clobber``` (optionally, cleans target folder)
4. ```m -j$(nproc --all)```
6. See compiled files at ```$ANDROID_PRODUCT_OUT``` (should be ```out/target/product/tangorpro```)
