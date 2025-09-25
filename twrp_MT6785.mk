#
# SPDX-FileCopyrightText: 2019 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

##** Inherit from PBRP-common stuff, if building PBRP.
$(call inherit-product-if-exists, vendor/pb/config/common.mk)

##** Inherit from TWRP-common stuff, if building TWRP.
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

##** Inherit from RMX2155L1 device **##
$(call inherit-product, device/realme/MT6785/device.mk)

##** Device Information **##
PRODUCT_DEVICE := MT6785
PRODUCT_NAME := twrp_$(PRODUCT_DEVICE)
PRODUCT_BRAND := realme
PRODUCT_MODEL := $(PRODUCT_DEVICE)
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

PRODUCT_GMS_CLIENTID_BASE := android-$(PRODUCT_BRAND)

PRODUCT_BUILD_PROP_OVERRIDES := PRIVATE_BUILD_DESC="sys_mssi_64_cn_armv82-user 12 SP1A.210812.016 1711679158901 release-keys"
