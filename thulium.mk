TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# copy customized media_profiles and media_codecs xmls for thulium
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/qcom/thulium/media_profiles.xml:system/etc/media_profiles.xml \
                      device/qcom/thulium/media_codecs.xml:system/etc/media_codecs.xml
endif  #TARGET_ENABLE_QC_AV_ENHANCEMENTS

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
ifeq ($(TARGET_USES_AOSP), true)
PRODUCT_COPY_FILES += \
    device/qcom/common/media/audio_policy.conf:system/etc/audio_policy.conf
else
PRODUCT_COPY_FILES += \
    device/qcom/thulium/audio_policy.conf:system/etc/audio_policy.conf
endif

PRODUCT_COPY_FILES += \
    device/qcom/thulium/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    device/qcom/thulium/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/qcom/thulium/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/qcom/thulium/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
    device/qcom/thulium/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    device/qcom/thulium/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    device/qcom/thulium/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/qcom/thulium/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    device/qcom/thulium/audio_platform_info.xml:system/etc/audio_platform_info.xml

# WLAN driver configuration files
PRODUCT_COPY_FILES += \
    device/qcom/thulium/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/qcom/thulium/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

# Listen configuration file
PRODUCT_COPY_FILES += \
    device/qcom/thulium/listen_platform_info.xml:system/etc/listen_platform_info.xml

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app
