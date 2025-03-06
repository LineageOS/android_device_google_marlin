# Board
TARGET_BOOTLOADER_BOARD_NAME := sailfish
TARGET_BOARD_INFO_FILE := device/google/marlin/sailfish/board-info.txt

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hardware=sailfish

# Properties
TARGET_VENDOR_PROP += device/google/marlin/sailfish/vendor.prop

include device/google/marlin/BoardConfigCommon.mk
include vendor/google/sailfish/BoardConfigVendor.mk
