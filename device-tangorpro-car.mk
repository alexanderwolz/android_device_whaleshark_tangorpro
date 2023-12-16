# Copyright (C) 2023 Alexander Wolz, mail@alexanderwolz.de
# product based on:
#	- device/google_car/raven_car/device-raven-car.mk
#	- device/google/tangorpro

# This executes the following in device/google/tangorpro/tangorpro/BoardConfig.mk:
# "include vendor/auto/embedded/products/$(PHONE_CAR_BOARD_PRODUCT)/BoardConfig.mk"
# TODO: We need to override the path? 
PHONE_CAR_BOARD_PRODUCT := tangorpro_car

$(call inherit-product, packages/services/Car/car_product/build/car.mk)

$(call inherit-product, device/google/tangorpro/device-tangorpro.mk)

include device/google/gs101/uwb/uwb.mk

TARGET_SCREEN_DENSITY := 320 # from BoardConfig in raven_car, see PHONE_CAR_BOARD_PRODUCT

PRODUCT_PRODUCT_PROPERTIES+= \
    ro.adb.secure=0
