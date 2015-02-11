
$(call inherit-product, device/qcom/common/common64.mk)

PRODUCT_NAME := thulium
PRODUCT_DEVICE := thulium
PRODUCT_BRAND := Android
PRODUCT_MODEL := Thulium for arm64

PRODUCT_BOOT_JARS += tcmiface

# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/thulium/audio_policy.conf:system/etc/audio_policy.conf \
    device/qcom/thulium/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/qcom/thulium/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/qcom/thulium/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
    device/qcom/thulium/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    device/qcom/thulium/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/qcom/thulium/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml

# Listen configuration file
PRODUCT_COPY_FILES += \
    device/qcom/thulium/listen_platform_info.xml:system/etc/listen_platform_info.xml

