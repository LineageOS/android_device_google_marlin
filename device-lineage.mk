# Google Assistant
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.opa.eligible_device=true

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay-lineage

# Theme
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=org.lineageos.overlay.dark
