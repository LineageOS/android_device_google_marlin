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

PRODUCT_SHIPPING_API_LEVEL := 24

DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay

# Input device files
PRODUCT_COPY_FILES += \
    device/google/marlin/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/google/marlin/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl \
    device/google/marlin/uinput-fpc.kl:system/usr/keylayout/uinput-fpc.kl \
    device/google/marlin/uinput-fpc.idc:system/usr/idc/uinput-fpc.idc \
    device/google/marlin/synaptics_dsxv26.idc:system/usr/idc/synaptics_dsxv26.idc

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
PRODUCT_PACKAGES += SSRestartDetector

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += TelephonyMonitor
endif

# graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

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
    device/google/marlin/audio_effects.conf:system/etc/audio_effects_vendor.conf \
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
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle

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

# Audio low latency feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Pro audio feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:system/etc/permissions/android.hardware.audio.pro.xml

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml

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
    device/google/marlin/init.power.sh:system/bin/init.power.sh \
    device/google/marlin/init.mid.sh:system/bin/init.mid.sh \
    device/google/marlin/init.foreground.sh:system/bin/init.foreground.sh

# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192

PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.gyro.android=4 \
    persist.camera.tof.direct=1 \
    persist.camera.tnr.preview=1 \
    persist.camera.tnr.video=1

# Set bluetooth soc to rome
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=rome

PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1 \
    persist.radio.data_ltd_sys_ind=1 \
    persist.radio.is_wps_enabled=true \
    persist.radio.RATE_ADAPT_ENABLE=1 \
    persist.radio.ROTATION_ENABLE=1 \
    persist.radio.sw_mbn_update=1 \
    persist.radio.videopause.mode=1 \
    persist.radio.VT_ENABLE=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    persist.radio.data_con_rprt=true \
    persist.rcs.supported=1 \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.mode=concurrent

# Enable SM log mechanism by default
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.smlog_switch=1 \
    ro.radio.log_prefix="modem_log_"
endif

# Set snapshot timer to 3 second
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.snapshot_enabled=1 \
    persist.radio.snapshot_timer=3

# IMS over WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.iwlan.enable=true

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10 \
    telephony.lteOnCdmaDevice=1

PRODUCT_AAPT_CONFIG += xlarge large
PRODUCT_CHARACTERISTICS := nosdcard

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
PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.diag.rc.userdebug:root/init.common.diag.rc

# Subsystem ramdump
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ssr.enable_ramdumps=1
else
PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.diag.rc.user:root/init.common.diag.rc
endif

# Subsystem silent restart
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ssr.restart_level=venus,AR6320,slpi,modem,adsp

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

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.msm8996 \
    librecovery_updater_msm8996 \
    libsparse_static
PRODUCT_PACKAGES += \
    update_engine_sideload

# Tell the system to enable copying odexes from other partition.
PRODUCT_PACKAGES += \
	cppreopts.sh

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cp_system_other_odex=1

# Script that copies preloads directory from system_other to data partition
PRODUCT_COPY_FILES += \
    device/google/marlin/preloads_copy.sh:system/bin/preloads_copy.sh

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    system

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

PRODUCT_PROPERTY_OVERRIDES += \
    sdm.debug.disable_rotator_split=1 \
    qdcm.only_pcc_for_trans=1 \
    qdcm.diagonal_matrix_mode=1

# Enable low power video mode for 4K encode
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.debug.perf.mode=2

# OEM Unlock reporting
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.oem_unlock_supported=1

# Setup dm-verity configs
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/bootdevice/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/bootdevice/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := \
    device/google/marlin/recovery.wipe.common

# GPS configuration file
PRODUCT_COPY_FILES += \
    device/google/marlin/gps.conf:system/etc/gps.conf

# Default permission grant exceptions
PRODUCT_COPY_FILES += \
    device/google/marlin/default-permissions.xml:system/etc/default-permissions/default-permissions.xml

# A/B OTA dexopt package
PRODUCT_PACKAGES += otapreopt_script

# A/B OTA dexopt update_engine hookup
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

#Reduce cost of scrypt for FBE CE decryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.scrypt_params=13:3:1

# Add minidebug info to the system server to support diagnosing native crashes.
ifneq (,$(filter user userdebug, $(TARGET_BUILD_VARIANT)))
    # System server and some of its services.
    # Note: we cannot use PRODUCT_SYSTEM_SERVER_JARS, as it has not been expanded at this point.
    $(call add-product-dex-preopt-module-config,services,--generate-mini-debug-info)
    $(call add-product-dex-preopt-module-config,wifi-service,--generate-mini-debug-info)
endif

# b/28423767
$(call add-product-sanitizer-module-config,rmt_storage,never)

# b/30302693
$(call add-product-sanitizer-module-config,surfaceflinger libsigchain,never)

# b/28992626
# For Hangouts, make ASAN-lite only sanitize 32-bit.
ifeq (true,$(SANITIZE_LITE))
  SANITIZE_ARCH := 32
endif

# b/30349163
# Set Marlin/Sailfish default log size on userdebug/eng build to 1M
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += ro.logd.size=1M
endif

# b/30022738
# Work around janky screenrecord performance by disabling hardware composer
# virtual displays
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.disable_hwc_vds=1

# b/32109329
# Workaround for audio glitches
PRODUCT_PROPERTY_OVERRIDES += \
    audio.adm.buffering.ms=3
