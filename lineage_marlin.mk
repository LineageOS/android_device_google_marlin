# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit AOSP configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/device-marlin.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_marlin
PRODUCT_BRAND := google
PRODUCT_DEVICE := marlin
PRODUCT_MODEL := Pixel XL
PRODUCT_MANUFACTURER := Google
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="marlin-user 10 QP1A.191005.007.A3 5972272 release-keys" \
    BuildFingerprint=google/marlin/marlin:10/QP1A.191005.007.A3/5972272:user/release-keys \
    DeviceName=marlin

$(call inherit-product, vendor/google/marlin/marlin-vendor.mk)
