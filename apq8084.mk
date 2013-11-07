TARGET_USES_QCOM_BSP := false

ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := apq8084
PRODUCT_DEVICE := apq8084

PRODUCT_BOOT_JARS += qcmediaplayer:oem-services:qcom.fmradio:org.codeaurora.Performance

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/apq8084/audio_policy.conf:system/etc/audio_policy.conf \
    device/qcom/apq8084/mixer_paths.xml:system/etc/mixer_paths.xml


# wlan driver
PRODUCT_COPY_FILES += \
    device/qcom/apq8084/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/qcom/apq8084/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/apq8084/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

# Feature definition files for apq8084
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom
