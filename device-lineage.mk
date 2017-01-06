# Camera
PRODUCT_PACKAGES += \
    libion \
    Snap

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay-lineage

# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload
