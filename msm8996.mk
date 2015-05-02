TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
BOARD_HAVE_QCOM_FM := true

# copy customized media_profiles and media_codecs xmls for msm8996
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/qcom/msm8996/media_profiles.xml:system/etc/media_profiles.xml \
                      device/qcom/msm8996/media_codecs.xml:system/etc/media_codecs.xml
endif  #TARGET_ENABLE_QC_AV_ENHANCEMENTS

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, device/qcom/common/common64.mk)

PRODUCT_NAME := msm8996
PRODUCT_DEVICE := msm8996
PRODUCT_BRAND := Android
PRODUCT_MODEL := MSM8996 for arm64

PRODUCT_BOOT_JARS += tcmiface
ifneq ($(strip $(QCPATH)),)
PRODUCT_BOOT_JARS += WfdCommon
endif

ifeq ($(strip $(BOARD_HAVE_QCOM_FM)),true)
PRODUCT_BOOT_JARS += qcom.fmradio
endif #BOARD_HAVE_QCOM_FM

# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

ifneq ($(TARGET_USES_AOSP),true)
TARGET_USES_QCOM_BSP := true
endif

# Audio configuration file
ifeq ($(TARGET_USES_AOSP), true)
PRODUCT_COPY_FILES += \
    device/qcom/common/media/audio_policy.conf:system/etc/audio_policy.conf
else
PRODUCT_COPY_FILES += \
    device/qcom/msm8996/audio_policy.conf:system/etc/audio_policy.conf
endif

PRODUCT_COPY_FILES += \
    device/qcom/msm8996/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    device/qcom/msm8996/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/qcom/msm8996/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/qcom/msm8996/mixer_paths_tasha.xml:system/etc/mixer_paths_tasha.xml \
    device/qcom/msm8996/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
    device/qcom/msm8996/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    device/qcom/msm8996/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    device/qcom/msm8996/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/qcom/msm8996/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    device/qcom/msm8996/audio_platform_info.xml:system/etc/audio_platform_info.xml

# WLAN driver configuration files
PRODUCT_COPY_FILES += \
    device/qcom/msm8996/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/qcom/msm8996/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

# Listen configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8996/listen_platform_info.xml:system/etc/listen_platform_info.xml

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

# Sensor HAL conf file
PRODUCT_COPY_FILES += \
    device/qcom/msm8996/sensors/hals.conf:system/etc/sensors/hals.conf
