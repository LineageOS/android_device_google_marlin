# config.mk
#
# Product-specific compile-time definitions
#

TARGET_BOARD_PLATFORM := msm8996
TARGET_BOOTLOADER_BOARD_NAME := marlin
TARGET_BOARD_INFO_FILE := device/google/marlin/marlin/board-info.txt

TARGET_USES_AOSP := true
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
#TODO: add kryo support? TARGET_CPU_VARIANT := kryo
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
ifneq ($(TARGET_USES_AOSP), true)
TARGET_2ND_CPU_VARIANT := cortex-a53
else
TARGET_2ND_CPU_VARIANT := cortex-a9
endif

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
BOOTLOADER_GCC_VERSION := arm-eabi-4.8
# use msm8996 LK configuration
BOOTLOADER_PLATFORM := msm8996

TARGET_USES_OVERLAY := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096

BOARD_USES_GENERIC_AUDIO := true

BOARD_USES_ALSA_AUDIO := true

USE_CAMERA_STUB := true
-include $(QCPATH)/common/msm8996/BoardConfigVendor.mk

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_USES_WIPOWER := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/google/marlin/common

BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"

USE_OPENGL_RENDERER := true
BOARD_USE_LEGACY_UI := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x04000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2457600000
#BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := squashfs
#BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
#BOARD_SYSTEMIMAGE_SQUASHFS_COMPRESSOR := lz4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
ifneq ($(TARGET_USES_AOSP),true)
TARGET_USES_QCOM_BSP := true
endif

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=marlin user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=16M@0-0xffffffff androidboot.selinux=permissive

BOARD_SEPOLICY_DIRS += device/google/marlin/sepolicy

BOARD_EGL_CFG := device/google/marlin/egl.cfg
BOARD_KERNEL_SEPARATED_DT := true

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x02000000
BOARD_RAMDISK_OFFSET     := 0x02200000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := false

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_NO_RPC := true

TARGET_PLATFORM_DEVICE_BASE := /devices/soc/
TARGET_INIT_VENDOR_LIB := libinit_msm

#Enable Peripheral Manager
TARGET_PER_MGR_ENABLED := true

#Enable HW based full disk encryption
# TODO: disable due to compile error due to mismatch with system/vold
# TARGET_HW_DISK_ENCRYPTION := true

#Enable SW based full disk encryption
TARGET_SWV8_DISK_ENCRYPTION := false

#Enable PD locater/notifier
TARGET_PD_SERVICE_ENABLED := true

BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_BOOTIMG_SIGNED := true

WITH_DEXPREOPT_BOOT_IMG_ONLY := true
WITH_DEXPREOPT := false
WITH_DEXPREOPT_PIC := false
## Enable dex pre-opt to speed up initial boot
#ifeq ($(HOST_OS),linux)
#    ifeq ($(WITH_DEXPREOPT),)
#      WITH_DEXPREOPT := true
#      WITH_DEXPREOPT_PIC := true
#      ifneq ($(TARGET_BUILD_VARIANT),user)
#        # Retain classes.dex in APK's for non-user builds
#        DEX_PREOPT_DEFAULT := nostripping
#      endif
#    endif
#endif

# Enable sensor multi HAL
USE_SENSOR_MULTI_HAL := true

# HTC_SENSOR_HUB
LIBHTC_SENSORHUB_PROJECT := g_project

#TARGET_LDPRELOAD := libNimsWrap.so

# TARGET_COMPILE_WITH_MSM_KERNEL := true

TARGET_KERNEL_APPEND_DTB := true
# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := false

#Add NON-HLOS files for ota upgrade
ADD_RADIO_FILES := true
#TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_msm
#TARGET_RECOVERY_UI_LIB := librecovery_ui_msm

TARGET_CRYPTFS_HW_PATH := device/google/marlin/common/cryptfs_hw

#Add support for firmare upgrade on 8996
HAVE_SYNAPTICS_DSX_FW_UPGRADE := true

# Enable MDTP (Mobile Device Theft Protection)
TARGET_USE_MDTP := true

TARGET_BOARD_KERNEL_HEADERS := device/google/marlin/kernel-headers

-include vendor/google_devices/marlin/BoardConfigVendor.mk
