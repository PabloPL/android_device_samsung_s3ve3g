# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from msm8226-common
-include device/samsung/msm8226-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := s3ve3g,s3ve3gds,s3ve3gjv

LOCAL_PATH := device/samsung/s3ve3g

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/s3ve3g/cmhw

# Init
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_s3ve3g.c
TARGET_UNIFIED_DEVICE := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
TARGET_KERNEL_SOURCE := kernel/samsung/s3ve3g
TARGET_KERNEL_CONFIG := msm8226-sec_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8226-sec_s3ve3g_defconfig

# NFC
BOARD_NFC_CHIPSET := pn547

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A7DEA0
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12562627584

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/twrp.fstab

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/s3ve3g

# SELinux
-include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/samsung/s3ve3g/sepolicy

BOARD_SEPOLICY_UNION += \
       hostapd.te \
       platform_app.te

# TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_SAMSUNG := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p26"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,noauto_da_alloc,journal_async_commit,errors=panic wait,check,encryptable=footer"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

# Multirom
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := $(LOCAL_PATH)/mr_init_devices.c
MR_RD_ADDR := 0x82500000
MR_DPI := hdpi
MR_DPI_FONT := 216
MR_FSTAB := $(LOCAL_PATH)/recovery/twrp.fstab
MR_KEXEC_MEM_MIN := 0x85000000
# MR_INFOS := d$(LOCAL_PATH)/mrom_infos
