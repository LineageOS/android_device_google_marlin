# Lights
PRODUCT_PACKAGES += \
    lights.sailfish_sys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.lights=sailfish_sys

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/sailfish/overlay-lineage

$(call inherit-product, device/google/marlin/device-lineage.mk)
