#
# Copyright (C) 2016 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL marlin and sailfish devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/google/marlin-kernel/Image.gz-dtb
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

DEVICE_PACKAGE_OVERLAYS := device/google/marlin/overlay

# Input device files
PRODUCT_COPY_FILES += \
    device/google/marlin/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/google/marlin/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl

# copy customized media_profiles and media_codecs xmls for msm8996
PRODUCT_COPY_FILES += device/google/marlin/media_profiles.xml:system/etc/media_profiles.xml \
                      device/google/marlin/media_codecs.xml:system/etc/media_codecs.xml \
                      device/google/marlin/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, device/google/marlin/common/common64.mk)

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

# Audio configuration file
ifeq ($(TARGET_USES_AOSP), true)
PRODUCT_COPY_FILES += \
    device/google/marlin/common/media/audio_policy.conf:system/etc/audio_policy.conf
else
PRODUCT_COPY_FILES += \
    device/google/marlin/audio_policy.conf:system/etc/audio_policy.conf
endif

PRODUCT_COPY_FILES += \
    device/google/marlin/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    device/google/marlin/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/google/marlin/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/google/marlin/mixer_paths_tasha_t50.xml:system/etc/mixer_paths_tasha_t50.xml \
    device/google/marlin/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    device/google/marlin/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/google/marlin/sound_trigger_mixer_paths_wcd9330.xml:system/etc/sound_trigger_mixer_paths_wcd9330.xml \
    device/google/marlin/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    device/google/marlin/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    device/google/marlin/audio_platform_info_tasha_t50.xml:system/etc/audio_platform_info_tasha_t50.xml \
    device/google/marlin/tfa98xx.cnt:system/etc/firmware/tfa98xx.cnt

# WLAN driver configuration files
PRODUCT_COPY_FILES += \
    device/google/marlin/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf     \
    device/google/marlin/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf     \
    device/google/marlin/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/google/marlin/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# Wi-Fi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Listen configuration file
PRODUCT_COPY_FILES += \
    device/google/marlin/listen_platform_info.xml:system/etc/listen_platform_info.xml

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

# Sensor features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:system/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:system/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# Common sensor packages
PRODUCT_PACKAGES += \
    nanoapp_cmd

# sensor utilities (only for userdebug and eng builds)
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += \
    nanotool \
    sensortest
endif

PRODUCT_COPY_FILES += \
    device/google/marlin/sec_config:system/etc/sec_config

PRODUCT_COPY_FILES += \
    device/google/marlin/i2ctest:system/bin/i2ctest \
    device/google/marlin/libftm_lib_i2c_utility.so:system/lib64/libftm_lib_i2c_utility.so

PRODUCT_SUPPORTS_VERITY := true
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/bootdevice/by-name/system

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/google/marlin/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# init launched script
PRODUCT_COPY_FILES += \
    device/google/marlin/init.class_main.sh:system/bin/init.class_main.sh \
    device/google/marlin/init.qcom.bt.sh:system/bin/init.qcom.bt.sh \
    device/google/marlin/init.qcom.class_core.sh:system/bin/init.qcom.class_core.sh \
    device/google/marlin/init.qcom.post_boot.sh:system/bin/init.qcom.post_boot.sh \
    device/google/marlin/init.qcom.sensors.sh:system/bin/init.qcom.sensors.sh \
    device/google/marlin/init.qcom.sh:system/bin/init.qcom.sh \
    device/google/marlin/init.qcom.usb.sh:system/bin/init.qcom.usb.sh \
    device/google/marlin/init.qcom.zram.sh:system/bin/init.qcom.zram.sh

# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192

PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1

# Set bluetooth soc to rome
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=rome

PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1 \
    persist.radio.RATE_ADAPT_ENABLE=1 \
    persist.radio.ROTATION_ENABLE=1 \
    persist.radio.sw_mbn_update=1 \
    persist.radio.videopause.mode=1 \
    persist.radio.VT_ENABLE=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    persist.rcs.supported=1 \
    rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so

# IMS over WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.iwlan.enable=true

PRODUCT_AAPT_CONFIG += xlarge large

# TODO: move to vendor mk file
### HTC touch ###
#PRODUCT_COPY_FILES += \
#    vendor/google_devices/marlin/prebuilts/tp_SYN3708.img:system/etc/firmware/synaptics.img

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

$(call inherit-product-if-exists, hardware/qcom/msm8996/msm8996.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8996/msm8996-gpu-vendor.mk)

# TODO:
# setup dm-verity configs.
# PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/7464900.sdhci/by-name/system
# $(call inherit-product, build/target/product/verity.mk)

