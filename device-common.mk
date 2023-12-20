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

# Include device-specific build-macros
include device/google/marlin/utils.mk

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    cppreopts.sh \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_ENG += \
    update_engine_client

# AAPT
PRODUCT_AAPT_CONFIG := normal xlarge large
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service.m1s1 \
    android.hardware.audio@6.0-impl:32 \
    android.hardware.audio.effect@6.0-impl:32 \
    audio.bluetooth.default \
    audio.primary.msm8996 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libaudioroute \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle \
    libvolumelistener

PRODUCT_COPY_FILES += \
    device/google/marlin/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    device/google/marlin/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    device/google/marlin/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    device/google/marlin/audio/mixer_paths_tasha_t50.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha_t50.xml \
    device/google/marlin/audio/aanc_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/aanc_tuning_mixer.txt \
    device/google/marlin/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    device/google/marlin/audio/sound_trigger_mixer_paths_tasha_t50.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_tasha_t50.xml \
    device/google/marlin/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    device/google/marlin/audio/audio_platform_info_tasha_$(PRODUCT_HARDWARE).xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha.xml \
    device/google/marlin/audio/audio_platform_info_tasha_t50.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha_t50.xml \
    device/google/marlin/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/google/marlin/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    device/google/marlin/audio/audio_policy_volumes_drc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes_drc.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.1-impl \
    android.hardware.bluetooth@1.0.vendor \
    libbt-vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl:64 \
    android.hardware.boot@1.0-impl.recovery:64 \
    android.hardware.boot@1.0-service \
    bootctrl.msm8996 \
    bootctrl.msm8996.recovery \
    libgptutils.marlin \
    libgptutils.marlin.recovery

PRODUCT_PACKAGES_ENG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    camera.device@3.2-impl \
    camera.msm8996 \
    libminijail_32 \
    libmm-qcamera \
    libmmcamera_interface \
    libmmjpeg_interface \
    libqomx_core \
    libtinyxml \
    libxml2 \
    mm-qcamera-app

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

QCOM_BOARD_PLATFORMS += msm8996

# cgroups
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    libhealthd.msm

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore

# Dalvik
# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m

$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Data
PRODUCT_PACKAGES += \
    ip \
    iptables \
    libext \
    libiprouteutil \
    librmnetctl \
    rmnetcli

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    libcrypto_shim.vendor

# Dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.0-service.marlin

# Filesystem Config
PRODUCT_PACKAGES += \
    fs_config_dirs \
    fs_config_files

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl:64 \
    android.hardware.gatekeeper@1.0-service \
    libion.vendor

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl:64 \
    android.hardware.gnss@1.0-service.m1s1

PRODUCT_COPY_FILES += \
    device/google/marlin/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl:64 \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    gralloc.default \
    gralloc.msm8996 \
    hwcomposer.msm8996 \
    libqdMetaData \
    libqdutils

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

MASTER_SIDE_CP_TARGET_LIST := msm8996

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-m1s1 \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidlmemory.vendor \
    libhidltransport \
    libhwbinder

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    ims-ext-common \
    imssettings \
    libgui_shim \
    PresencePolling \
    RcsService

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml

# Init Files
PRODUCT_COPY_FILES += \
    device/google/marlin/init-files/init.common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.rc \
    device/google/marlin/init-files/init.common.diag.rc.user:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.diag.rc \
    device/google/marlin/init-files/init.common.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.usb.rc \
    device/google/marlin/init-files/init.common.nanohub.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.nanohub.rc \
    device/google/marlin/init-files/ueventd.common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
    device/google/marlin/init-files/init.radio.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.radio.sh \
    device/google/marlin/init-files/init.power.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.power.sh \
    device/google/marlin/init-files/init.mid.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mid.sh \
    device/google/marlin/init-files/init.foreground.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.foreground.sh \
    device/google/marlin/init-files/init.qcom.devstart.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.devstart.sh

PRODUCT_COPY_FILES += \
    device/google/marlin/init-files/fstab.common:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(PRODUCT_HARDWARE) \
    device/google/marlin/init-files/fstab.common:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.$(PRODUCT_HARDWARE) \
    device/google/marlin/recovery/init.recovery.common.rc:recovery/root/init.recovery.$(PRODUCT_HARDWARE).rc

# Input
PRODUCT_COPY_FILES += \
    device/google/marlin/keylayouts/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    device/google/marlin/keylayouts/qpnp_pon.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/qpnp_pon.kl \
    device/google/marlin/keylayouts/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    device/google/marlin/keylayouts/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    device/google/marlin/keylayouts/synaptics_dsxv26.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/synaptics_dsxv26.idc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# IPC Router
PRODUCT_COPY_FILES += \
    device/google/marlin/configs/permissions/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# IRQ
PRODUCT_COPY_FILES += \
    device/google/marlin/thermal/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl:64 \
    android.hardware.keymaster@3.0-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl:64 \
    android.hardware.light@2.0-service \
    lights.msm8996 \
    lights.$(PRODUCT_HARDWARE)

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

# Media
PRODUCT_COPY_FILES += \
    device/google/marlin/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/google/marlin/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/google/marlin/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

PRODUCT_COPY_FILES += \
    device/google/marlin/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.msm8996

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.1-service \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    device/google/marlin/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf \
    device/google/marlin/nfc/libnfc-nxp.$(PRODUCT_HARDWARE).conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    device/google/marlin/nfc/libpn551_fw.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpn551_fw.so

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# OMX
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay-lineage
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/$(PRODUCT_HARDWARE)/overlay

PRODUCT_ENFORCE_RRO_TARGETS := *

# Permissions
PRODUCT_COPY_FILES += \
    device/google/marlin/configs/permissions/default-permissions.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default-permissions/default-permissions.xml

PRODUCT_COPY_FILES += \
    device/google/marlin/configs/permissions/privapp-permissions-marlin.xml:system/etc/permissions/privapp-permissions-marlin.xml

PRODUCT_COPY_FILES += \
    device/google/marlin/configs/permissions/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# PM Service
PRODUCT_PACKAGES += \
    libutils-v33

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service.marlin

# Protobuf
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm/arch-arm-armv7-a-neon/shared/vndk-core/libprotobuf-cpp-lite.so:$(TARGET_COPY_OUT_VENDOR)/lib/libprotobuf-cpp-lite-v29.so \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-core/libprotobuf-cpp-lite.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libprotobuf-cpp-lite-v29.so

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0 \
    android.hardware.radio.deprecated@1.0 \
    android.hardware.radio.config@1.0-service \
    android.hardware.radio@1.4-service.legacy \
    libnetutils.vendor \
    libsqlite.vendor \
    libsysutils.vendor

# Repartition Tools
PRODUCT_PACKAGES += \
    sgdisk.recovery

# Sanitizer Modules
$(call add-product-sanitizer-module-config,hostapd,never)
$(call add-product-sanitizer-module-config,libqcril,never)
$(call add-product-sanitizer-module-config,mm-camera,never)
$(call add-product-sanitizer-module-config,myftm,never)
$(call add-product-sanitizer-module-config,netmgrd,never)
$(call add-product-sanitizer-module-config,thermal-engine,never)
$(call add-product-sanitizer-module-config,toybox_vendor,never)
$(call add-product-sanitizer-module-config,wpa_supplicant,never)

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.contexthub@1.0-impl.nanohub:64 \
    android.hardware.contexthub@1.0-service \
    android.hardware.sensors@1.0-impl:64 \
    android.hardware.sensors@1.0-service \
    sensors.$(PRODUCT_HARDWARE) \
    libpower.vendor \
    libsensorndkbridge \
    nanoapp_cmd

PRODUCT_PACKAGES_ENG += a_sns_test

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

NANOHUB_SENSORHAL_DIRECT_REPORT_ENABLED := true
NANOHUB_SENSORHAL_DYNAMIC_SENSOR_EXT_ENABLED := true
NANOHUB_SENSORHAL_LID_STATE_ENABLED := true
NANOHUB_SENSORHAL_SENSORLIST := $(LOCAL_PATH)/sensorhal/sensorlist.cpp
TARGET_USES_NANOHUB_SENSORHAL := true

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 25

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/google/marlin \
    hardware/google/interfaces \
    hardware/google/pixel

# Splash Screen
PRODUCT_PACKAGES += \
    misc_writer

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.carrierlock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.carrierlock.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service

PRODUCT_COPY_FILES += \
    device/google/marlin/thermal/thermal-engine-marlin.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf \
    device/google/marlin/thermal/thermal-engine-marlin-vr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-vr.conf \
    device/google/marlin/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# TimeKeep
PRODUCT_PACKAGES += \
    TimeKeep \
    timekeep

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.marlin

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# Vendor Security Patch Level
VENDOR_SECURITY_PATCH := 2019-10-06

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.marlin

# VINTF
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := true

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf \
    WifiOverlay

PRODUCT_COPY_FILES += \
    device/google/marlin/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    device/google/marlin/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    device/google/marlin/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/google/marlin/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml
