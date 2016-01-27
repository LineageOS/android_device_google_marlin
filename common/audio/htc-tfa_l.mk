
ifneq ($(strip $(HTC_TFA_FILE_PATH)),)
$(warning AUD: copy TFA from $(HTC_TFA_FILE_PATH) to system/etc/)
PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/fm_l.drc:system/etc/tfa/fm_l.drc \
    $(HTC_TFA_FILE_PATH)/fm_l.eq:system/etc/tfa/fm_l.eq \
    $(HTC_TFA_FILE_PATH)/fm_l.preset:system/etc/tfa/fm_l.preset

PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/Rec_Video_l.drc:system/etc/tfa/Rec_Video_l.drc \
    $(HTC_TFA_FILE_PATH)/Rec_Video_l.eq:system/etc/tfa/Rec_Video_l.eq \
    $(HTC_TFA_FILE_PATH)/Rec_Video_l.preset:system/etc/tfa/Rec_Video_l.preset

PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/voice_l.drc:system/etc/tfa/voice_l.drc \
    $(HTC_TFA_FILE_PATH)/voice_l.eq:system/etc/tfa/voice_l.eq \
    $(HTC_TFA_FILE_PATH)/voice_l.preset:system/etc/tfa/voice_l.preset \
    $(HTC_TFA_FILE_PATH)/voiceWB_l.eq:system/etc/tfa/voiceWB_l.eq \

PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/voip_l.drc:system/etc/tfa/voip_l.drc \
    $(HTC_TFA_FILE_PATH)/voip_l.eq:system/etc/tfa/voip_l.eq \
    $(HTC_TFA_FILE_PATH)/voip_l.preset:system/etc/tfa/voip_l.preset \

PRODUCT_COPY_FILES += \
    $(HTC_TFA_FILE_PATH)/woofer/playbackwoofer.drc:system/etc/tfa/playbackwoofer.drc \
    $(HTC_TFA_FILE_PATH)/woofer/playbackwoofer.eq:system/etc/tfa/playbackwoofer.eq \
    $(HTC_TFA_FILE_PATH)/woofer/playbackwoofer.preset:system/etc/tfa/playbackwoofer.preset
    $(HTC_TFA_FILE_PATH)/woofer/playbackwoofer_l.drc:system/etc/tfa/playbackwoofer_l.drc \
    $(HTC_TFA_FILE_PATH)/woofer/playbackwoofer_l.eq:system/etc/tfa/playbackwoofer_l.eq \
    $(HTC_TFA_FILE_PATH)/woofer/playbackwoofer_l.preset:system/etc/tfa/playbackwoofer_l.preset \
endif

ifneq ($(strip $(HTC_TFA_PLAYBACK_PATH)),)
$(warning AUD: copy TFA PLAYBACK from $(HTC_TFA_PLAYBACK_PATH) to system/etc/)
PRODUCT_COPY_FILES += \
    $(HTC_TFA_PLAYBACK_PATH)/playback_l.drc:system/etc/tfa/playback_l.drc \
    $(HTC_TFA_PLAYBACK_PATH)/playback_l.eq:system/etc/tfa/playback_l.eq \
    $(HTC_TFA_PLAYBACK_PATH)/playback_l.preset:system/etc/tfa/playback_l.preset \
    $(HTC_TFA_PLAYBACK_PATH)/tfa9895_l.speaker:system/etc/tfa/tfa9895_l.speaker
endif

