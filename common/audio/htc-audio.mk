# Can remove htc_audio.h if nobody will include it.
# Now keep to avoid somewhere meet build break.
HEADER := device/qcom/common/audio/htc_audio.h
HEADER_TEMP := $(HEADER).tmp

$(shell cat /dev/null > $(HEADER_TEMP))

define toUpper
$(shell echo $1 | tr [a-z] [A-Z])
endef

define append
$(shell echo $1 >> $(HEADER_TEMP))
endef

define append_def
$(call append, \#define $1)
endef

$(call append, \#ifndef HTC_AUDIO_H)
$(call append, \#define HTC_AUDIO_H)
$(call append, \#endif //HTC_AUDIO_H)

# include QCT platform features
-include device/qcom/common/audio/qcom-$(TARGET_BOARD_PLATFORM)-audio.mk

#
# include below hTC features
#

ifeq ($(BOARD_USES_LPA_3_5),true)
HTC_INTERNAL_CDEFS += -DSUPPORT_LPA_3_5
endif

ifeq ($(BOARD_USES_ALSA_AUDIO),true)
    ifneq ($(ENABLE_OFFLOAD_VISUALIZER_EFFECT),true)
        HTC_INTERNAL_CDEFS += -DSUPPORT_ALSA_PCM
    endif
endif

ifeq ($(BOARD_USES_TINYALSA),true)
HTC_INTERNAL_CDEFS += -DUSE_TINY_ALSA
endif

ifeq ($(call is-chipset-in-board-platform,msm8660),true)
HTC_INTERNAL_CDEFS += -DMSM8X60_PROXY_PORT
endif

ifeq ($(strip $(ENABLE_SRS_EFFECT)), true)
HTC_INTERNAL_CDEFS += -DENABLE_SRS_EFFECT
endif

#Using MBHC feature
ifeq ($(strip $(BOARD_USES_MBHC_AUDIO)),true)
HTC_INTERNAL_CDEFS += -DUSES_MBHC_AUDIO
endif

# Use sEarpieceVoiceVolumeCurve to fix MEM notification volume too loud in phone call issue
ifeq ($(TARGET_PRODUCT), $(filter $(TARGET_PRODUCT), htc_memul htc_memwl))
HTC_INTERNAL_CDEFS += -DMEM_NOTIFICATION_SOUND_LOUD
endif

ifeq ($(strip $(ENABLE_GLOBAL_EFFECT_BACKEND_BOOST)), true)
HTC_INTERNAL_CDEFS += -DENABLE_GLOBAL_EFFECT_BACKEND_BOOST
endif

ifneq ($(wildcard mfg/.patched),)
HTC_INTERNAL_CDEFS += -DBOARD_MFG_BUILD
else ifeq ($(strip $(BOARD_MFG_BUILD)), true)
HTC_INTERNAL_CDEFS += -DBOARD_MFG_BUILD
else ifeq ($(CONFIG_BOARD_MFG),y)
HTC_INTERNAL_CDEFS += -DBOARD_MFG_BUILD
endif

ifeq ($(strip $(USE_SW_ALT)), true)
HTC_INTERNAL_CDEFS += -DENABLE_SW_ALT
endif

ifeq ($(strip $(USE_SW_AOLC)), true)
HTC_INTERNAL_CDEFS += -DENABLE_AOLC
endif

ifeq ($(strip $(USE_VOL_RAMP)), true)
HTC_INTERNAL_CDEFS += -DENABLE_EFFECT_CHAIN_RAMPING
endif

ifeq ($(strip $(ENABLE_NON_BLOCK_ROUTE)), true)
HTC_INTERNAL_CDEFS += -DENABLE_NON_BLOCK_ROUTE
endif

ifeq ($(strip $(ENABLE_BT_HW_AEC)), true)
HTC_INTERNAL_CDEFS += -DENABLE_BT_HW_AEC
endif

ifeq ($(strip $(ENABLE_GET_ACDB_BY_SKU)), true)
HTC_INTERNAL_CDEFS += -DENABLE_GET_ACDB_BY_SKU
endif

ifeq ($(strip $(ENABLE_24BIT_AUDIO)), true)
HTC_INTERNAL_CDEFS += -DENABLE_24BIT
endif

ifeq ($(strip $(ENABLE_MIRRORLINK_RECORD)), true)
HTC_INTERNAL_CDEFS += -DENABLE_MIRRORLINK_RECORD
endif

ifeq ($(strip $(ENABLE_ACOUSTIC_SHOCK_WITHOUT_NXP)), true)
HTC_INTERNAL_CDEFS += -DENABLE_ACOUSTIC_SHOCK_WITHOUT_NXP
endif

ifeq ($(strip $(ENABLE_ACOUSTIC_SHOCK2)), true)
HTC_INTERNAL_CDEFS += -DENABLE_ACOUSTIC_SHOCK2
endif

ifeq ($(strip $(ENABLE_ACOUSTIC_SHOCK3)), true)
HTC_INTERNAL_CDEFS += -DENABLE_ACOUSTIC_SHOCK3
endif

ifeq ($(strip $(ENABLE_SRS_FOR_ALL_STREAM)), true)
HTC_INTERNAL_CDEFS += -DENABLE_SRS_FOR_ALL_STREAM
endif

ifeq ($(strip $(ENABLE_FASTMIXER)), true)
HTC_INTERNAL_CDEFS += -DENABLE_FASTMIXER
endif

ifeq ($(ENABLE_GLOBAL_EFFECT),true)
HTC_INTERNAL_CDEFS += -DENABLE_GLOBAL_EFFECT
endif

ifeq ($(Q6_EFFECT_POPP_ENABLE),true)
ifeq ($(ENABLE_BEATS_EFFECT), true)
HTC_INTERNAL_CDEFS += -DQ6_EFFECT_POPP_ENABLE
endif
endif

ifeq ($(ENABLE_GLOBAL_SRS_EFFECT),true)
HTC_INTERNAL_CDEFS += -DENABLE_GLOBAL_SRS_EFFECT
endif

ifeq ($(DISABLE_SRS_GEQ),true)
HTC_INTERNAL_CDEFS += -DDISABLE_SRS_GEQ
endif

ifeq ($(ENABLE_BEATS_EFFECT),true)
HTC_INTERNAL_CDEFS += -DENABLE_BEATS_EFFECT
endif

ifeq ($(ENABLE_HARMAN_SD_EFFECT),true)
HTC_INTERNAL_CDEFS += -DENABLE_HARMAN_SD_EFFECT
endif

ifeq ($(ENABLE_HARMAN_HHS_EFFECT),true)
HTC_INTERNAL_CDEFS += -DENABLE_HARMAN_HHS_EFFECT
endif

ifeq ($(ENABLE_HARMAN_SPK),true)
HTC_INTERNAL_CDEFS += -DENABLE_HARMAN_SPK
endif

ifeq ($(ENABLE_SURROUND_SOUND),true)
HTC_INTERNAL_CDEFS += -DENABLE_SURROUND_SOUND
endif

ifeq ($(ADAPTIVESOUND_ENABLE),true)
HTC_INTERNAL_CDEFS += -DADAPTIVESOUND_ENABLE
endif

ifeq ($(ENABLE_ONEDOTONE_CHANNEL),true)
HTC_INTERNAL_CDEFS += -DENABLE_ONEDOTONE_CHANNEL
endif

ifeq ($(ENABLE_STEREO2MONO),true)
HTC_INTERNAL_CDEFS += -DENABLE_STEREO2MONO
endif

ifeq ($(ENABLE_AUDIO_BALANCE),true)
HTC_INTERNAL_CDEFS += -DENABLE_AUDIO_BALANCE
endif

ifeq ($(ENABLE_HD_AUDIO),true)
HTC_INTERNAL_CDEFS += -DHD_AUDIO
endif

ifeq ($(QCOM_FM_ENABLED),true)
HTC_INTERNAL_CDEFS += -DFM_VOL_CONTROL
endif

ifeq ($(ENABLE_MULTI_INPUT),true)
HTC_INTERNAL_CDEFS += -DENABLE_MULTI_INPUT
endif

ifeq ($(HTC_32BIT_EFFECT),true)
HTC_INTERNAL_CDEFS += -DHTC_32BIT_EFFECT
endif

ifeq ($(ENABLE_OFFLOAD_VISUALIZER_EFFECT),true)
HTC_INTERNAL_CDEFS += -DENABLE_OFFLOAD_VISUALIZER_EFFECT
endif

ifeq ($(MSM8974_QCT_RIVA),true)
HTC_INTERNAL_CDEFS += -DUSE_QCT_RIVA
endif

ifeq ($(USES_NXP_SPEAKER_49V),true)
HTC_INTERNAL_CDEFS += -DUSES_NXP_SPEAKER_49V
endif

ifeq ($(ENABLE_24BITS_RECORD),true)
HTC_INTERNAL_CDEFS += -DENABLE_24BITS_RECORD
endif

#set tfa98xx TFA98XX_DCDCBOOST register at AHAL
# 5 -> 4.9V, 6 -> 5.1V, 7 -> 5.3V
# default is 4.9V
ifneq ($(HTC_TFA98XX_DCDCBOOST_LEVEL),)
HTC_INTERNAL_CDEFS += -DHTC_TFA98XX_DCDCBOOST_LEVEL="$(HTC_TFA98XX_DCDCBOOST_LEVEL)"
endif

ifeq ($(BOARD_USES_TFA9888_AUDIO),true)
HTC_INTERNAL_CDEFS += -DUSES_TFA9888_AUDIO
endif

ifeq ($(NO_SOUND_DETECT),true)
HTC_INTERNAL_CDEFS += -DENABLE_NO_SOUND_DETECT
endif

ifeq ($(USES_NXP_DUAL_SPEAKER),true)
HTC_INTERNAL_CDEFS += -DUSES_NXP_DUAL_SPEAKER
    ifeq ($(ENABLE_HARMAN_EFFECT),true)
         PRODUCT_COPY_FILES += \
            device/qcom/common/audio/HARMAN_default_vol_level.conf:system/etc/default_vol_level.conf
    else
         PRODUCT_COPY_FILES += \
            device/qcom/common/audio/DULTFA_default_vol_level.conf:system/etc/default_vol_level.conf
    endif
else
     PRODUCT_COPY_FILES += \
        device/qcom/common/audio/NOTFA_default_vol_level.conf:system/etc/default_vol_level.conf
endif

ifeq ($(ENABLE_AUDIOVIDEO_TUNNEL),true)
HTC_INTERNAL_CDEFS += -DENABLE_AUDIOVIDEO_TUNNEL
endif

#p-sensor type dectection for acoustic shock
ifeq ($(BOARD_VENDOR_USE_SENSOR_HAL), sensor_hub)
HTC_INTERNAL_CDEFS += -DUSE_ACOUSTIC_SHOCK_PSENSOR_SENSOR_HUB
endif


ifeq ($(TARGET_PRODUCT), $(filter $(TARGET_PRODUCT), cp3dcg cp3dtg cp3dug cp3u))
HTC_INTERNAL_CDEFS += -DFM_VOL_CONTROL
endif

ifeq ($(ENABLE_ENFORCE_AUDIO),true)
HTC_INTERNAL_CDEFS += -DENABLE_ENFORCE_AUDIO
endif

ifeq ($(USES_TFA9887_LEFT),true)
     PRODUCT_COPY_FILES += \
        device/qcom/common/audio/DULTFA_default_vol_level.conf:system/etc/default_vol_level.conf
else
     PRODUCT_COPY_FILES += \
        device/qcom/common/audio/TFA_default_vol_level.conf:system/etc/TFA_default_vol_level.conf
     PRODUCT_COPY_FILES += \
        device/qcom/common/audio/NOTFA_default_vol_level.conf:system/etc/NOTFA_default_vol_level.conf
endif

ifneq ($(CODEC_REG_PATH),)
HTC_INTERNAL_CDEFS += -DCODEC_REG_PATH="$(CODEC_REG_PATH)"
endif

ifeq ($(strip $(ENABLE_HTC_SUBWOOFER)), true)
HTC_INTERNAL_CDEFS += -DENABLE_HTC_SUBWOOFER
HTC_INTERNAL_CDEFS += -DSUBWOOFER_BUF_MAX="$(SUBWOOFER_BUF_MAX)"
HTC_INTERNAL_CDEFS += -DSUBWOOFER_BUF_LEVEL_0="$(SUBWOOFER_BUF_LEVEL_0)"
HTC_INTERNAL_CDEFS += -DSUBWOOFER_BUF_LEVEL_1="$(SUBWOOFER_BUF_LEVEL_1)"
HTC_INTERNAL_CDEFS += -DSUBWOOFER_BUF_LEVEL_2="$(SUBWOOFER_BUF_LEVEL_2)"
endif

ifeq ($(strip $(TARGET_APQ8064_ONLY)), true)
HTC_INTERNAL_CDEFS += -DQCOM_CSDCLIENT_ENABLED
endif

ifeq ($(TARGET_MSM8930_ONLY),true)
HTC_INTERNAL_CDEFS += -DTARGET_BOARD_PLATFORM_MSM8930
endif

ifeq ($(strip $(ENABLE_AUDIOHOOKCLIENT)), true)
HTC_INTERNAL_CDEFS += -DENABLE_AUDIOHOOKCLIENT
endif

#avoid recompile due to header timestamp change
REPLACE := $(shell if ! cmp $(HEADER_TEMP) $(HEADER) ; then cp $(HEADER_TEMP) $(HEADER) ; fi)

COMMON_GLOBAL_CFLAGS += $(HTC_INTERNAL_CDEFS)
COMMON_GLOBAL_CPPFLAGS += $(HTC_INTERNAL_CDEFS)

# Summary
# -------------------------------------------------------------------------------------------
# -DAAA = "123" => equals #define AAA 123 (int)
# -DAAA = \"123\" => equals #define AAA "123" (char*)

# Enhance - Avoid didn't include htc_audio.h and cause Build flag didn't align
# -------------------------------------------------------------------------------------------
# Parsing htc_audio.h if need
#    VARIABLE=$(shell cat ${HEADER})
#    $(warning VARIABLE=$(VARIABLE))
#    HTC_INTERNAL_CDEFS += $(foreach t,$(VARIABLE),$(if $(filter-out \#define ,$(t)),-D$(t)))

# debug using - $(warning HTC_INTERNAL_CDEFS=$(HTC_INTERNAL_CDEFS))
# -------------------------------------------------------------------------------------------

ifeq ($(ENABLE_GLOBAL_SRS_EFFECT),true)
# When enable ENABLE_GLOBAL_SRS_EFFECT,
PRODUCT_COPY_FILES += \
       frameworks/av/services/srs_processing/license/srsmodels.lic:system/etc/soundimage/srsmodels.lic
$(warning ENABLE_GLOBAL_SRS_EFFECT: COPY SRS licence)
endif

PRODUCT_COPY_FILES += device/qcom/common/audio/audio_effects.conf:system/etc/htc_audio_effects.conf
$(warning AUD: COPY common/audio/audio_effects.conf to system/etc/htc_audio_effects.conf)

include device/qcom/common/audio/htc-audio-effects.mk
