include $(CLEAR_VARS)

PREBUILT_PATH := $(strip $(wildcard \
        $(HTC_PREBUILT_SUBSYS_PATH) \
        $(TARGET_DEVICE_DIR)/prebuilt_images \
        device/htc/prebuilts/$(if $(value HTC_BOARD_PLATFORM),$(shell echo $(HTC_BOARD_PLATFORM)),$(shell echo $(TARGET_BOARD_PLATFORM)))))

LOCAL_MODULE := htc-subsys-images

IMG := \
	*.img \

IMG_OUT := $(PRODUCT_OUT)
IMG_RESUFFIX :=

SYM := \
	*.elf \
	*.map \
	*.sym \

SYM_OUT := $(PRODUCT_OUT)/symbols/subsys
SYM_RESUFFIX :=

_local_images :=
define htc-copy-subsys-image
$(foreach _path,$(PREBUILT_PATH), \
$(foreach _src,$(wildcard $(addprefix $(_path)/,$(1))), \
	$(eval _dst := $(addprefix $(2)/,$(notdir $(_src)))) \
	$(eval _dst := $(if $(3),$(basename $(_dst)).$(3),$(_dst))) \
	$(eval $(if $(filter $(_dst),$(_local_images)),, \
		$(eval $(call copy-one-file,$(_src),$(_dst))) \
		$(eval _local_images += $(_dst)) \
		$(eval $(if $(filter true,$(4)), \
			$(eval INSTALLED_RADIOIMAGE_TARGET += $(_dst)),)) \
		$(eval $(LOCAL_MODULE): $(_dst)) \
	)) \
))
endef

$(call htc-copy-subsys-image,$(IMG),$(IMG_OUT),$(IMG_RESUFFIX),true)
$(call htc-copy-subsys-image,$(SYM),$(SYM_OUT),$(SYM_RESUFFIX),false)

.PHONY: $(LOCAL_MODULE)
ALL_DEFAULT_INSTALLED_MODULES += $(LOCAL_MODULE)
