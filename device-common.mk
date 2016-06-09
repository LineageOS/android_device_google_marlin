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

PRODUCT_SHIPPING_API_LEVEL := 24

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay

# Input device files
PRODUCT_COPY_FILES += \
    device/google/marlin/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/google/marlin/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl \
    device/google/marlin/uinput-fpc.kl:system/usr/keylayout/uinput-fpc.kl

# copy customized media_profiles and media_codecs xmls for msm8996
PRODUCT_COPY_FILES += device/google/marlin/media_profiles.xml:system/etc/media_profiles.xml \
                      device/google/marlin/media_codecs.xml:system/etc/media_codecs.xml \
                      device/google/marlin/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m \
    ro.telephony.default_cdma_sub=0

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, device/google/marlin/common/common64.mk)

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

# graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609

# HWUI common settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

# For android_filesystem_config.h
PRODUCT_PACKAGES += fs_config_files \
                    fs_config_dirs

# Audio configuration
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
    device/google/marlin/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    device/google/marlin/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    device/google/marlin/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/google/marlin/mixer_paths_tasha_t50.xml:system/etc/mixer_paths_tasha_t50.xml \
    device/google/marlin/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    device/google/marlin/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/google/marlin/sound_trigger_mixer_paths_tasha_t50.xml:system/etc/sound_trigger_mixer_paths_tasha_t50.xml \
    device/google/marlin/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    device/google/marlin/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    device/google/marlin/audio_platform_info_tasha_t50.xml:system/etc/audio_platform_info_tasha_t50.xml \
    device/google/marlin/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    device/google/marlin/audio_policy_volumes_drc.xml:system/etc/audio_policy_volumes_drc.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml

PRODUCT_PACKAGES += \
    sound_trigger.primary.msm8996

# set audio fluence, ns, aec property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluencepro \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicerec=false

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
    wificond \
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

# Other hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:system/etc/permissions/android.hardware.vr.high_performance.xml

# For SPN display
PRODUCT_COPY_FILES += \
    device/google/marlin/spn-conf.xml:system/etc/spn-conf.xml

# Common sensor packages
TARGET_USES_NANOHUB_SENSORHAL := true
NANOHUB_SENSORHAL_LID_STATE_ENABLED := true
NANOHUB_SENSORHAL_DOUBLE_TOUCH_ENABLED := true
NANOHUB_SENSORHAL_SENSORLIST := $(LOCAL_PATH)/sensorhal/sensorlist.cpp
PRODUCT_PACKAGES += context_hub.default

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

PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/bootdevice/by-name/system

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/google/marlin/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# init launched script
PRODUCT_COPY_FILES += \
    device/google/marlin/init.qcom.qseecomd.sh:system/bin/init.qcom.qseecomd.sh \
    device/google/marlin/init.radio.sh:system/bin/init.radio.sh \
    device/google/marlin/init.power.sh:system/bin/init.power.sh

# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192

PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1 \
    persist.camera.gyro.android=4 \
    persist.camera.tof.direct=1 \
    persist.camera.tnr.preview=1 \
    persist.camera.tnr.video=1

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
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.mode=concurrent

# Enable SM log mechanism by default
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.smlog_switch=1
endif

# IMS over WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.iwlan.enable=true

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10 \
    telephony.lteOnCdmaDevice=1

PRODUCT_AAPT_CONFIG += xlarge large

# Enable camera EIS
# eis.enable: enables electronic image stabilization
# is_type: sets image stabilization type
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.eis.enable=1 \
    persist.camera.is_type=4

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Modem debugger
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += \
    QXDMLogger

PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.diag.rc.userdebug:root/init.common.diag.rc

# Subsystem ramdump
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ssr.enable_ramdumps=1
else
PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.diag.rc.user:root/init.common.diag.rc
endif

PRODUCT_COPY_FILES += \
    device/google/marlin/thermal-engine-marlin.conf:system/etc/thermal-engine.conf

$(call inherit-product-if-exists, hardware/qcom/msm8996/msm8996.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8996/msm8996-gpu-vendor.mk)

# TODO:
# setup dm-verity configs.
# PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/7464900.sdhci/by-name/system
# $(call inherit-product, build/target/product/verity.mk)

#Property of the BDA module path for loading BDA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/sys/module/bdaddress/parameters/bdaddress

# Needed for encryption
PRODUCT_PACKAGES += \
    keystore.msm8996 \
    gatekeeper.msm8996

# Use the A/B updater.
AB_OTA_UPDATER := true
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier
PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    Tag

# NFC/camera interaction workaround - DO NOT COPY TO NEW DEVICES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.camera.notify_nfc=1

PRODUCT_COPY_FILES += \
    device/google/marlin/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/google/marlin/nfc/libpn551_fw.so:$(TARGET_COPY_OUT_VENDOR)/firmware/libpn551_fw.so

# Bootloader HAL used for A/B updates.
PRODUCT_PACKAGES += \
    bootctrl.msm8996
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Storage: for factory reset protection feature
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/platform/soc/624000.ufshc/by-name/frp

# OEM Unlock reporting
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.oem_unlock_supported=1

# Setup dm-verity configs
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/bootdevice/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/bootdevice/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Partitions (listed in the file) to be bricked under recovery.
TARGET_RECOVERY_BRICK := \
    device/google/marlin/recovery.brick.common

# GPS configuration file
PRODUCT_COPY_FILES += \
    device/google/marlin/gps.conf:system/etc/gps.conf

# A/B OTA dexopt A tool
# Note: intermediate step for full support. b/25612095
PRODUCT_PACKAGES += otapreopt_chroot
