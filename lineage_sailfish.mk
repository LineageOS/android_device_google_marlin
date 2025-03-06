# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit AOSP configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/device-sailfish.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_sailfish
PRODUCT_BRAND := google
PRODUCT_DEVICE := sailfish
PRODUCT_MODEL := Pixel
PRODUCT_MANUFACTURER := Google
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sailfish-user 10 QP1A.191005.007.A3 5972272 release-keys" \
    BuildFingerprint=google/sailfish/sailfish:10/QP1A.191005.007.A3/5972272:user/release-keys \
    DeviceName=sailfish

$(call inherit-product, vendor/google/sailfish/sailfish-vendor.mk)
