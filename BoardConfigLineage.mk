# Common board config for marlin, sailfish

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Disable dex pre-opt
WITH_DEXPREOPT := false

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_CONFIG := lineageos_marlin_defconfig
TARGET_KERNEL_SOURCE := kernel/google/marlin

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# Sepolicy
BOARD_SEPOLICY_DIRS += device/google/marlin/sepolicy-lineage

# Snapdragon LLVM
TARGET_USE_SDCLANG := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

-include vendor/google/marlin/BoardConfigVendor.mk
