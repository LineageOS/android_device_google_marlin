# Copyright (C) 2008 The Android Open Source Project
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

LOCAL_PATH:= $(call my-dir)
# HAL module implemenation stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.board.platform>.so
include $(CLEAR_VARS)

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_SRC_FILES := lights.c
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := libc libcutils liblog
LOCAL_HEADER_LIBRARIES := libhardware_headers
LOCAL_CFLAGS := $(common_flags) -DLOG_TAG=\"qdlights\" -DDEFAULT_LOW_PERSISTENCE_MODE_BRIGHTNESS=$(DEFAULT_LOW_PERSISTENCE_MODE_BRIGHTNESS)
LOCAL_MODULE := lights.$(TARGET_DEVICE)_sys
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
