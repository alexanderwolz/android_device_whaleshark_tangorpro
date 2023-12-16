# Copyright (C) 2023 Alexander Wolz, mail@alexanderwolz.de
# product based on:
#	- device/google_car/raven_car/aosp-raven-car.mk
#	- device/google/tangorpro/device-tangorpro.mk

DEVICE_IS_64BIT_ONLY := true

# Analog to google raven car configuration (device rotation)
PRODUCT_PACKAGE_OVERLAYS += device/alexanderwolz/whaleshark/tangorpro/overlay

$(call inherit-product, device/google_car/common/pre_google_car.mk)
$(call inherit-product, device/alexanderwolz/whaleshark/tangorpro/device-tangorpro-car.mk)
# TODO evaluate: already called from device/google/tangorpro/device-tangorpro.mk
# $(call inherit-product-if-exists, vendor/google_devices/tangorpro/proprietary/device-vendor.mk)
$(call inherit-product, device/google_car/common/post_google_car.mk)

# Use common definitions
$(call inherit-product, device/alexanderwolz/whaleshark/common/whaleshark_common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := alexanderwolz
PRODUCT_MANUFACTURER := alexanderwolz
PRODUCT_NAME := whaleshark_tangorpro
PRODUCT_MODEL := Whale Shark AAOS on Tangorpro

# we reuse the original device configuration from device/google_car/tangorpro
# otherwise it complains about "error: cannot assign to readonly variable: PRODUCT_NAME"
PRODUCT_DEVICE := tangorpro
