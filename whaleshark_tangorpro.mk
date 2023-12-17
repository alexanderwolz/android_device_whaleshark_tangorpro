# Copyright (C) 2023 Alexander Wolz, mail@alexanderwolz.de
# product based on:
#	- device/google_car/tangorpro_car/aosp_tangorpro_car

# Since Android 14: derive directly from automotive tangorpro definition
$(call inherit-product, device/google_car/tangorpro_car/aosp_tangorpro_car.mk)

# Use common definitions
$(call inherit-product, device/alexanderwolz/whaleshark/common/whaleshark_common.mk)

# see also https://source.android.com/docs/automotive/start/pixelxl?hl=en
# vehicle service (VHAL) needs to be built with this product, normally this is done by Automotive OEMs
# we want to use the default stubbed service here, so we need to manually build it:
# m -j$(nproc --all) android.hardware.automotive.vehicle@2.0-default-service
# -> already included in device/google_car/common/pre_google_car.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := alexanderwolz
PRODUCT_MANUFACTURER := alexanderwolz
PRODUCT_NAME := whaleshark_tangorpro
PRODUCT_MODEL := Whale Shark AAOS on Tangorpro

# we reuse the original device configuration from device/google_car/tangorpro
# otherwise it complains about "error: cannot assign to readonly variable: PRODUCT_NAME"
PRODUCT_DEVICE := tangorpro
