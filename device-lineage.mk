# Camera
PRODUCT_PACKAGES += \
    libmm-qcamera

# Carrier apps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/carrier_apps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/carrier_apps.xml

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.1-service.clearkey

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    media.mediadrmservice.enable=true

# Google Assistant
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.opa.eligible_device=true

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay-lineage

# Sensors
PRODUCT_PACKAGES += \
    libsensorndkbridge

# Tool
PRODUCT_PACKAGES += \
    libtinyxml

# VR Services
PRODUCT_PACKAGES += \
    bufferhubd \
    performanced \
    virtual_touchpad \
    vr_hwc
