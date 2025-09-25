#
# SPDX-FileCopyrightText: 2019 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/MT6785

##** For building with minimal manifest **##
ALLOW_MISSING_DEPENDENCIES := true

##** Build Rules **##
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

##** Architecture **##
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# CPU
TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

##** Bootloader **##
TARGET_BOOTLOADER_BOARD_NAME := RM6785
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

##** Platform **##
TARGET_BOARD_PLATFORM := mt6785
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true

##** Assert **##
TARGET_OTA_ASSERT_DEVICE := RMX2155,RMX2155L1,RMX2151,RMX2151L1,RMX2156L1,RMX2161L1,RMX2163L1,MT6785

##** Kernel Configuration **##
BOARD_KERNEL_VERSION           := 4.14
BOARD_KERNEL_IMAGE_NAME        := Image
BOARD_KERNEL_CONFIG_FILE       := $(KERNEL_CONFIG)

##** Boot Image Header and Memory Layout **##
BOARD_KERNEL_CMDLINE           := bootopt=64S3,32N2,64N2
BOARD_BOOTIMG_HEADER_VERSION   := 2
BOARD_KERNEL_BASE              := 0x40078000
BOARD_KERNEL_OFFSET            := 0x00008000
BOARD_KERNEL_PAGESIZE          := 2048
BOARD_KERNEL_TAGS_OFFSET       := 0x0bc08000
BOARD_RAMDISK_OFFSET           := 0x07c08000
BOARD_KERNEL_SECOND_OFFSET     := 0x00e88000
BOARD_DTB_OFFSET               := 0x0bc08000

##** DTBO / DTB Configuration **##
BOARD_INCLUDE_RECOVERY_DTBO    := true
BOARD_KERNEL_SEPARATED_DTBO    := true
BOARD_INCLUDE_DTB_IN_BOOTIMG   := true

##** Ramdisk **##
BOARD_RAMDISK_USE_LZ4          := true

##** mkbootimg Arguments **##
BOARD_MKBOOTIMG_ARGS := \
    --base $(BOARD_KERNEL_BASE) \
    --pagesize $(BOARD_KERNEL_PAGESIZE) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --second_offset $(BOARD_KERNEL_SECOND_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --header_version $(BOARD_BOOTIMG_HEADER_VERSION) \
    --board ""

##** Kernel - prebuilt **##
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilts/dtb
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo/dtbo.img

##** Metadata **##
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

##** Flash Block Size **##
BOARD_FLASH_BLOCK_SIZE                := 131072  # 128 KB

##** Partition Sizes (in bytes) **##
BOARD_BOOTIMAGE_PARTITION_SIZE        := 33554432     # 32 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 102760448    # ~98 MB
BOARD_DTBOIMG_PARTITION_SIZE          := 8388608      # 8 MB
BOARD_CACHEIMAGE_PARTITION_SIZE       := 452984832    # ~432 MB

##** Partition File System Types **##
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE     := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

##**  Partition Mount Points
TARGET_COPY_OUT_SYSTEM                := system
TARGET_COPY_OUT_VENDOR                := vendor
TARGET_COPY_OUT_PRODUCT               := product
TARGET_COPY_OUT_ODM                   := odm
TARGET_COPY_OUT_SYSTEM_EXT            := system_ext

##** Dynamic Partitions Configuration **##
BOARD_SUPER_PARTITION_SIZE            := 9126805504  # ~8.5 GB
BOARD_SUPER_PARTITION_GROUPS          := main
BOARD_MAIN_SIZE                       := 9122611200  # (9126805504 - 4194304)

##** List of logical partitions **##
BOARD_MAIN_PARTITION_LIST := \
    system \
    vendor \
    product \
    odm \
    system_ext

##** Crypto **##
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_USE_FSCRYPT_POLICY := 2
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_PREPARE_DATA_MEDIA_EARLY := true
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

##** AVB **##
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH)/libinit:libinit_MT6785
TARGET_RECOVERY_DEVICE_MODULES := libinit_MT6785

##** Recovery **##
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
BOARD_SPRUPESS_EMMC_WIPE := true
RECOVERY_SDCARD_ON_DATA := true   
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true                 
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := RGBA_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP := $(DEVICE_PATH)/properties/vendor.prop
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

##** Display Size & Density **##
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_DENSITY := 420

##** Charger **##
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

##** System as root **##
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true

##** Additional binaries & libraries needed for recovery **##
TARGET_RECOVERY_DEVICE_MODULES += \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    libxml2 \
    libkeymaster4 \
    libkeymaster41 \
    libpuresoftkeymasterdevice \
    ashmemd_aidl_interface-cpp \
    libashmemd_client

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so

##** TWRP Configuration	**##
TW_CLOCK_OFFSET := "SAUST-3;SAUDT"																																																																								
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1424
TW_USE_TOOLBOX := true
TW_INCLUDE_FASTBOOTD := true
TW_FRAMERATE := 90
TW_DEFAULT_LANGUAGE := en
TW_OZIP_DECRYPT_KEY := 0000
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_NO_LEGACY_PROPS := true
TW_SKIP_COMPATIBILITY_CHECK := true
TW_EXCLUDE_LPTOOLS := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/power_supply/battery/temp
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
TW_INCLUDE_LOGICAL := my_product my_engineering my_company my_carrier my_region my_heytap my_stock my_preload my_bigball my_manifest
TW_HAS_USB_STORAGE := true
TW_LOAD_VENDOR_BOOT_MODULES := true
TW_FORCE_CPUINFO_FOR_DEVICE_ID := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true 
TARGET_USES_MKE2FS := true
#TW_NEVER_UNMOUNT_SYSTEM := true
TW_USE_NEW_MINADBD := true
#TW_NO_BIND_SYSTEM := true
#TW_SKIP_ADDITIONAL_FSTAB := true
#TW_FORCE_KEYMASTER_VER := true
#TW_FORCE_USE_BUSYBOX := true
#TW_EXCLUDE_SUPERSU := true

##** Resolution **##
TW_THEME := portrait_hdpi

##** Debug flags **##
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

##** Excludes **##
#TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_APEX := true
#TW_EXCLUDE_PYTHON := false

##** resetprop and magiskboot **##
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

##** Configure Status bar icons "TWRP builds only" **##
TW_Y_OFFSET := 28
TW_H_OFFSET := -28
TW_CUSTOM_CPU_POS := 190
#TW_CUSTOM_BATTERY_POS := 916
#TW_CUSTOM_CLOCK_POS := 520
#TW_STATUS_ICONS_ALIGN := center

##** Custom TWRP Versioning **##
##** device version is optional - the default value is "0" if nothing is set in device tree **##
CUSTOM_TWRP_DEVICE_VERSION := RUI_V3.0

##** version prefix is optional - the default value is "LOCAL" if nothing is set in device tree **##
CUSTOM_TWRP_VERSION_PREFIX := By LUKS

include device/common/version-info/custom_twrp_version.mk

ifeq ($(CUSTOM_TWRP_VERSION),)
CUSTOM_TWRP_VERSION := $(shell date +%Y%m%d)-01
endif
