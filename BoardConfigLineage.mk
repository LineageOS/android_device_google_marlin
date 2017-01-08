# Common board config for marlin, sailfish

# Disable dex pre-opt
WITH_DEXPREOPT := false

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_CONFIG := lineageos_marlin_defconfig
TARGET_KERNEL_SOURCE := kernel/google/marlin

-include vendor/google/marlin/BoardConfigVendor.mk
