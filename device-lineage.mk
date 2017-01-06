# Fingerprint sensor type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.fingerprint=fpc

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay-lineage

# Snap
PRODUCT_PACKAGES += Snap

# Update engine
PRODUCT_PACKAGES += brillo_update_payload
