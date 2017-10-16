# Camera
PRODUCT_PACKAGES += libion

# GApps
GAPPS_VARIANT := stock
GAPPS_EXCLUDED_PACKAGES := EditorsDocs EditorsSheets EditorsSlides PrebuiltNewsWeather
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true
$(call inherit-product,vendor/opengapps/build/opengapps-packages.mk)

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay-lineage

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload
