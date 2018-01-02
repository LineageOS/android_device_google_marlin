# Led packages
PRODUCT_PACKAGES += \
    lights.marlin_sys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.lights=marlin_sys

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/marlin/overlay-lineage

$(call inherit-product, device/google/marlin/device-lineage.mk)
