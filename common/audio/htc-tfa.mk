
ifneq ($(strip $(HTC_TFA_FILE_PATH)),)
$(warning AUD: copy TFA from $(HTC_TFA_FILE_PATH) to system/etc/)
PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/tfa9895.config:system/etc/tfa/tfa9895.config \
    $(HTC_TFA_FILE_PATH)/tfa9895.patch:system/etc/tfa/tfa9895.patch

PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/fm.drc:system/etc/tfa/fm.drc \
    $(HTC_TFA_FILE_PATH)/fm.eq:system/etc/tfa/fm.eq \
    $(HTC_TFA_FILE_PATH)/fm.preset:system/etc/tfa/fm.preset

PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/Rec_Video.drc:system/etc/tfa/Rec_Video.drc \
    $(HTC_TFA_FILE_PATH)/Rec_Video.eq:system/etc/tfa/Rec_Video.eq \
    $(HTC_TFA_FILE_PATH)/Rec_Video.preset:system/etc/tfa/Rec_Video.preset

PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/voice.drc:system/etc/tfa/voice.drc \
    $(HTC_TFA_FILE_PATH)/voice.eq:system/etc/tfa/voice.eq \
    $(HTC_TFA_FILE_PATH)/voice.preset:system/etc/tfa/voice.preset \
    $(HTC_TFA_FILE_PATH)/voiceWB.eq:system/etc/tfa/voiceWB.eq \

PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/voip.drc:system/etc/tfa/voip.drc \
    $(HTC_TFA_FILE_PATH)/voip.eq:system/etc/tfa/voip.eq \
    $(HTC_TFA_FILE_PATH)/voip.preset:system/etc/tfa/voip.preset \

#please add woofer at htc_tfa_l.mk, because it is only for dual-speaker
endif

ifneq ($(strip $(HTC_TFA_PLAYBACK_PATH)),)
$(warning AUD: copy TFA PLAYBACK from $(HTC_TFA_PLAYBACK_PATH) to system/etc/)
PRODUCT_COPY_FILES += \
    $(HTC_TFA_PLAYBACK_PATH)/playback.drc:system/etc/tfa/playback.drc \
    $(HTC_TFA_PLAYBACK_PATH)/playback.eq:system/etc/tfa/playback.eq \
    $(HTC_TFA_PLAYBACK_PATH)/playback.preset:system/etc/tfa/playback.preset \
    $(HTC_TFA_PLAYBACK_PATH)/tfa9895.speaker:system/etc/tfa/tfa9895.speaker
endif

ifneq ($(strip $(HTC_TFA_MFG_FILE_PATH)),)
$(warning AUD: copy TFA MFG from $(HTC_TFA_MFG_FILE_PATH) to system/etc/)
PRODUCT_COPY_FILES += \
    $(HTC_TFA_MFG_FILE_PATH)/playbackMFG.drc:system/etc/tfa/playbackMFG.drc \
    $(HTC_TFA_MFG_FILE_PATH)/playbackMFG.eq:system/etc/tfa/playbackMFG.eq \
    $(HTC_TFA_MFG_FILE_PATH)/playbackMFG.preset:system/etc/tfa/playbackMFG.preset \
    $(HTC_TFA_MFG_FILE_PATH)/playbackMFG.config:system/etc/tfa/playbackMFG.config \
    $(HTC_TFA_MFG_FILE_PATH)/tfa9895MFG.patch:system/etc/tfa/tfa9895MFG.patch \
    $(HTC_TFA_PLAYBACK_PATH)/tfa9895.speaker:system/etc/tfa/tfa9895.speaker
endif

