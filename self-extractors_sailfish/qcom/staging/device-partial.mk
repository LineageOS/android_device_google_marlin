# Copyright 2015 The Android Open Source Project
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

# AOSP packages required by the blobs
PRODUCT_PACKAGES := \
    com.android.ims.rcsmanager.xml \
    com.android.ims.rcsmanager

#  blob(s) necessary for Sailfish hardware
PRODUCT_COPY_FILES := \
    vendor/qcom/sailfish/proprietary/pktlogconf:system/bin/pktlogconf:qcom \
    vendor/qcom/sailfish/proprietary/ATT_profiles.xml:system/etc/cne/Nexus/ATT/ATT_profiles.xml:qcom \
    vendor/qcom/sailfish/proprietary/ROW_profiles.xml:system/etc/cne/Nexus/ROW/ROW_profiles.xml:qcom \
    vendor/qcom/sailfish/proprietary/VZW_profiles.xml:system/etc/cne/Nexus/VZW/VZW_profiles.xml:qcom \
    vendor/qcom/sailfish/proprietary/qcrilhook.jar:system/framework/qcrilhook.jar:qcom \
    vendor/qcom/sailfish/proprietary/libclcore_neon.bc:system/lib/libclcore_neon.bc:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libiperf.so:system/lib64/libiperf.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libminui.so:system/lib64/libminui.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libbcc.so:system/lib64/libbcc.so:qcom \
    vendor/qcom/sailfish/proprietary/libion.so:system/lib/libion.so:qcom \
    vendor/qcom/sailfish/proprietary/libiperf.so:system/lib/libiperf.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libLLVM_android.so:system/lib64/libLLVM_android.so:qcom \
    vendor/qcom/sailfish/proprietary/libminui.so:system/lib/libminui.so:qcom \
    vendor/qcom/sailfish/proprietary/iperf3:system/xbin/iperf3:qcom \
    vendor/qcom/sailfish/proprietary/sanitizer-status:system/xbin/sanitizer-status:qcom \
    vendor/qcom/sailfish/proprietary/lib64/vendor.qti.atcmdfwd@1.0.so:system/lib64/vendor.qti.atcmdfwd@1.0.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/vendor.qti.qcril.am@1.0.so:system/lib64/vendor.qti.qcril.am@1.0.so:qcom \

