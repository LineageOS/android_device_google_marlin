ifneq ($(filter librecovery_updater_$(TARGET_BOARD_PLATFORM),$(TARGET_RECOVERY_UPDATER_LIBS)),)
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := bootable/recovery \
		    system/core/libsparse
LOCAL_SRC_FILES := gpt-utils.cpp dec.cpp oem-updater.cpp
ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := librecovery_updater_$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_OWNER := qti
include $(BUILD_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := bootable/recovery \
		    system/core/libsparse
LOCAL_SRC_FILES := gpt-utils.cpp
ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif
LOCAL_SHARED_LIBRARIES += liblog libsparse libcutils
LOCAL_MODULE := librecovery_updater_$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_OWNER += qti
LOCAL_COPY_HEADERS_TO := gpt-utils/inc
LOCAL_COPY_HEADERS := gpt-utils.h
include $(BUILD_SHARED_LIBRARY)
endif
