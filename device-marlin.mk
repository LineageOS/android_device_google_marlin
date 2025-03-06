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

# This file includes all definitions that apply to ALL marlin devices
#
# Everything in this directory will become public

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

-include device/google/marlin/device-common.mk

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/marlin/overlay

PRODUCT_COPY_FILES += \
    device/google/marlin/init-files/fstab.common:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.marlin \
    device/google/marlin/init-files/fstab.common:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.marlin \
    device/google/marlin/audio/audio_platform_info_tasha_marlin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha.xml \
    device/google/marlin/recovery/init.recovery.common.rc:recovery/root/init.recovery.marlin.rc

# Sensor packages
PRODUCT_PACKAGES += \
    sensors.marlin

PRODUCT_COPY_FILES += \
    device/google/marlin/nfc/libnfc-nxp.marlin.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# Led packages
PRODUCT_PACKAGES += \
    lights.marlin

$(call add-product-sanitizer-module-config,wpa_supplicant,never)
$(call add-product-sanitizer-module-config,toybox_vendor,never)
$(call add-product-sanitizer-module-config,thermal-engine,never)
$(call add-product-sanitizer-module-config,netmgrd,never)
$(call add-product-sanitizer-module-config,mm-camera,never)
$(call add-product-sanitizer-module-config,myftm,never)
$(call add-product-sanitizer-module-config,libqcril,never)
$(call add-product-sanitizer-module-config,hostapd,never)
