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
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

-include device/google/marlin/device-common.mk

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/sailfish/overlay

# display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420

PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.rc:root/init.sailfish.rc \
    device/google/marlin/init.common.usb.rc:root/init.sailfish.usb.rc \
    device/google/marlin/fstab.common:root/fstab.sailfish \
    device/google/marlin/ueventd.common.rc:root/ueventd.sailfish.rc \
    device/google/marlin/init.recovery.common.rc:root/init.recovery.sailfish.rc

# Audio tfa9891 firmware and config
PRODUCT_COPY_FILES += \
    device/google/marlin/sailfish/audio/TFA9891_S1.cnt:system/etc/firmware/tfa98xx.cnt

# Audio ACDB
PRODUCT_COPY_FILES += \
    device/google/marlin/sailfish/audio/Bluetooth_cal.acdb:system/etc/acdbdata/Bluetooth_cal.acdb \
    device/google/marlin/sailfish/audio/General_cal.acdb:system/etc/acdbdata/General_cal.acdb \
    device/google/marlin/sailfish/audio/Global_cal.acdb:system/etc/acdbdata/Global_cal.acdb \
    device/google/marlin/sailfish/audio/Handset_cal.acdb:system/etc/acdbdata/Handset_cal.acdb \
    device/google/marlin/sailfish/audio/Hdmi_cal.acdb:system/etc/acdbdata/Hdmi_cal.acdb \
    device/google/marlin/sailfish/audio/Headset_cal.acdb:system/etc/acdbdata/Headset_cal.acdb \
    device/google/marlin/sailfish/audio/Speaker_cal.acdb:system/etc/acdbdata/Speaker_cal.acdb

# Sensor hub init script
PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.nanohub.rc:root/init.sailfish.nanohub.rc

# Sensor packages
PRODUCT_PACKAGES += \
    sensors.sailfish \
    activity_recognition.sailfish

# NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.sailfish

PRODUCT_COPY_FILES += \
    device/google/marlin/nfc/libnfc-nxp.sailfish.conf:system/etc/libnfc-nxp.conf

