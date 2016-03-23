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

PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.rc:root/init.sailfish.rc \
    device/google/marlin/fstab.common:root/fstab.sailfish \
    device/google/marlin/ueventd.common.rc:root/ueventd.sailfish.rc

# Sensor hub init script
PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.nanohub.rc:root/init.sailfish.nanohub.rc

# Sensor packages
PRODUCT_PACKAGES += \
    sensors.sailfish \
    activity_recognition.sailfish

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10 \
    telephony.lteOnCdmaDevice=1 \
    persist.radio.mode_pref_nv10=1
