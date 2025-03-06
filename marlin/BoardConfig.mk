# Board
TARGET_BOOTLOADER_BOARD_NAME := marlin
TARGET_BOARD_INFO_FILE := device/google/marlin/marlin/board-info.txt

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hardware=marlin

# Properties
TARGET_VENDOR_PROP += device/google/marlin/marlin/vendor.prop

include device/google/marlin/BoardConfigCommon.mk
include vendor/google/marlin/BoardConfigVendor.mk
