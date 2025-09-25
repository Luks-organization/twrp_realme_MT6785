#
# SPDX-FileCopyrightText: 2019 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/MT6785

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

##** Shipping API level **##
BOARD_SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 29

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31

##** Property **##
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

##** HACK: Set vendor patch level **##
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31 \
    ro.bootimage.build.date.utc=0 \
    ro.build.date.utc=0

##** Partitions && Property **##
PRODUCT_USE_DYNAMIC_PARTITIONS := true

##** Health **##
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

##** fastbootd **##
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

##** Keymaster **##
PRODUCT_PACKAGES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

##** Keystore Hal **##
PRODUCT_PACKAGES += \
    android.system.keystore2

##** Update sideload **##
PRODUCT_PACKAGES += \
    update_engine_sideload

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
