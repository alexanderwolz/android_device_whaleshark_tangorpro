# Copyright (C) 2023 Alexander Wolz, mail@alexanderwolz.de
# product based on:
#	- device/google_car/raven_car/device-raven-car.mk
#	- device/google/tangorpro

# This executes the following in device/google/tangorpro/tangorpro/BoardConfig.mk:
# "include vendor/auto/embedded/products/$(PHONE_CAR_BOARD_PRODUCT)/BoardConfig.mk"
PHONE_CAR_BOARD_PRODUCT := whaleshark_tangorpro

$(call inherit-product, packages/services/Car/car_product/build/car.mk)

$(call inherit-product, device/google/tangorpro/device-tangorpro.mk)

PRODUCT_PRODUCT_PROPERTIES+= \
    ro.adb.secure=0

PRODUCT_PACKAGES += \
    librs_jni
