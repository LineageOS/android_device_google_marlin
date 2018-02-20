# Common board config for marlin, sailfish

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_CONFIG := lineageos_marlin_defconfig
TARGET_KERNEL_SOURCE := kernel/google/marlin

# Telephony
TARGET_PROVIDES_TELEPHONY_EXT := true

-include vendor/google/marlin/BoardConfigVendor.mk
