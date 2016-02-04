#TODO: REMOVE THIS, do not generate files into the source directory

EFFECT_CONFIG := device/google/marlin/common/audio/audio_effects.conf

$(shell cat /dev/null > $(EFFECT_CONFIG))

$(shell echo libraries { >> $(EFFECT_CONFIG))

GOOGLE_LIB_DEFAULT := \ \ bundle {\\n\
\ \ \ path /system/lib/soundfx/libbundlewrapper.so\\n\
\ }\\n\
\ reverb {\\n\
\ \ \ path /system/lib/soundfx/libreverbwrapper.so\\n\
\ }\\n\
\ visualizer_sw {\\n\
\ \ \ path /system/lib/soundfx/libvisualizer.so\\n\
\ }\\n\
\ pre_processing {\\n\
\ \ \ path /system/lib/soundfx/libaudiopreprocessing.so\\n\
\ }\\n\
\ downmix {\\n\
\ \ \ path /system/lib/soundfx/libdownmix.so\\n\
\ }\\n\
\ loudness_enhancer {\\n\
\ \ \ path /system/lib/soundfx/libldnhncr.so\\n\
\ }\\n\
\ proxy {\\n\
\ \ \ path /system/lib/soundfx/libeffectproxy.so\\n\
\ }

GOOGLE_EFFECTS_DEFAULT := \ \ downmix {\\n\
\ \ \ library downmix\\n\
\ \ \ uuid 93f04452-e4fe-41cc-91f9-e475b6d1d69f\\n\
\ }\\n\
\ loudness_enhancer {\\n\
\ \ \ library loudness_enhancer\\n\
\ \ \ uuid fa415329-2034-4bea-b5dc-5b381c8d1e2c\\n\
\ }\\n\
\ agc {\\n\
\ \ \ library pre_processing\\n\
\ \ \ uuid aa8130e0-66fc-11e0-bad0-0002a5d5c51b\\n\
\ }\\n\
\ aec {\\n\
\ \ \ library pre_processing\\n\
\ \ \ uuid bb392ec0-8d4d-11e0-a896-0002a5d5c51b\\n\
\ }\\n\
\ ns {\\n\
\ \ \ library pre_processing\\n\
\ \ \ uuid c06c8400-8e06-11e0-9cb6-0002a5d5c51b\\n\
\ }\\n\
\ volume {\\n\
\ \ \ library bundle\\n\
\ \ \ uuid 119341a0-8469-11df-81f9-0002a5d5c51b\\n\
\ }

ifeq ($(BOARD_USES_TINYALSA),true)
    LIB_DEFAULT := \ \ offload_bundle {\\n\
    \ \ \ path /system/lib/soundfx/libqcompostprocbundle.so\\n\
    \ }
    EFFECTS_DEFAULT := \ \ bassboost {\\n\
    \ \ \ library proxy\\n\
    \ \ \ uuid 14804144-a5ee-4d24-aa88-0002a5d5c51b\\n\
    \\n\
    \ \ \ libsw {\\n\
    \ \ \ \ \ library bundle\\n\
    \ \ \ \ \ uuid 8631f300-72e2-11df-b57e-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \\n\
    \ \ \ libhw {\\n\
    \ \ \ \ \ library offload_bundle\\n\
    \ \ \ \ \ uuid 2c4a8c24-1581-487f-94f6-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \ }\\n\
    \ virtualizer {\\n\
    \ \ \ library bundle\\n\
    \ \ \ uuid 1d4033c0-8557-11df-9f2d-0002a5d5c51b\\n\
    \ }\\n\
    \ equalizer {\\n\
    \ \ \ library proxy\\n\
    \ \ \ uuid c8e70ecd-48ca-456e-8a4f-0002a5d5c51b\\n\
    \\n\
    \ \ \ libsw {\\n\
    \ \ \ \ \ library bundle\\n\
    \ \ \ \ \ uuid ce772f20-847d-11df-bb17-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \\n\
    \ \ \ libhw {\\n\
    \ \ \ \ \ library offload_bundle\\n\
    \ \ \ \ \ uuid a0dac280-401c-11e3-9379-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \ }\\n\
    \ reverb_env_aux {\\n\
    \ \ \ library proxy\\n\
    \ \ \ uuid 48404ac9-d202-4ccc-bf84-0002a5d5c51b\\n\
    \\n\
    \ \ \ libsw {\\n\
    \ \ \ \ \ library reverb\\n\
    \ \ \ \ \ uuid 4a387fc0-8ab3-11df-8bad-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \\n\
    \ \ \ libhw {\\n\
    \ \ \ \ \ library offload_bundle\\n\
    \ \ \ \ \ uuid 79a18026-18fd-4185-8233-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \ }\\n\
    \ reverb_env_ins {\\n\
    \ \ \ library proxy\\n\
    \ \ \ uuid b707403a-a1c1-4291-9573-0002a5d5c51b\\n\
    \\n\
    \ \ \ libsw {\\n\
    \ \ \ \ \ library reverb\\n\
    \ \ \ \ \ uuid c7a511a0-a3bb-11df-860e-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \\n\
    \ \ \ libhw {\\n\
    \ \ \ \ \ library offload_bundle\\n\
    \ \ \ \ \ uuid eb64ea04-973b-43d2-8f5e-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \ }\\n\
    \ reverb_pre_aux {\\n\
    \ \ \ library proxy\\n\
    \ \ \ uuid 1b78f587-6d1c-422e-8b84-0002a5d5c51b\\n\
    \\n\
    \ \ \ libsw {\\n\
    \ \ \ \ \ library reverb\\n\
    \ \ \ \ \ uuid f29a1400-a3bb-11df-8ddc-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \\n\
    \ \ \ libhw {\\n\
    \ \ \ \ \ library offload_bundle\\n\
    \ \ \ \ \ uuid 6987be09-b142-4b41-9056-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \ }\\n\
    \ reverb_pre_ins {\\n\
    \ \ \ library proxy\\n\
    \ \ \ uuid f3e178d2-ebcb-408e-8357-0002a5d5c51b\\n\
    \\n\
    \ \ \ libsw {\\n\
    \ \ \ \ \ library reverb\\n\
    \ \ \ \ \ uuid 172cdf00-a3bc-11df-a72f-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \\n\
    \ \ \ libhw {\\n\
    \ \ \ \ \ library offload_bundle\\n\
    \ \ \ \ \ uuid aa2bebf6-47cf-4613-9bca-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \ }
else
    EFFECTS_DEFAULT := \ \ virtualizer {\\n\
    \ \ \ library bundle\\n\
    \ \ \ uuid 1d4033c0-8557-11df-9f2d-0002a5d5c51b\\n\
    \ }\\n\
    \ reverb_env_aux {\\n\
    \ \ \ library reverb\\n\
    \ \ \ uuid 4a387fc0-8ab3-11df-8bad-0002a5d5c51b\\n\
    \ }\\n\
    \ reverb_env_ins {\\n\
    \ \ \ library reverb\\n\
    \ \ \ uuid c7a511a0-a3bb-11df-860e-0002a5d5c51b\\n\
    \ }\\n\
    \ reverb_pre_aux {\\n\
    \ \ \ library reverb\\n\
    \ \ \ uuid f29a1400-a3bb-11df-8ddc-0002a5d5c51b\\n\
    \ }\\n\
    \ reverb_pre_ins {\\n\
    \ \ \ library reverb\\n\
    \ \ \ uuid 172cdf00-a3bc-11df-a72f-0002a5d5c51b\\n\
    \ }
endif

$(shell echo -e $(GOOGLE_LIB_DEFAULT) >> $(EFFECT_CONFIG))
ifdef LIB_DEFAULT
    $(shell echo -e $(LIB_DEFAULT) >> $(EFFECT_CONFIG))
endif

ifeq ($(ENABLE_SRS_EFFECT), true)
    $(shell echo \ \ SRS { >> $(EFFECT_CONFIG))
    $(shell echo \ \ \ \ path /system/lib/soundfx/libsrsfx.so >> $(EFFECT_CONFIG))
    $(shell echo \ \ } >> $(EFFECT_CONFIG))
endif

ifeq ($(ENABLE_OFFLOAD_VISUALIZER_EFFECT), true)
    $(shell echo \ \ visualizer_hw { >> $(EFFECT_CONFIG))
    $(shell echo \ \ \ \ path /system/lib/soundfx/libqcomvisualizer.so >> $(EFFECT_CONFIG))
    $(shell echo \ \ } >> $(EFFECT_CONFIG))
endif

ifeq ($(DOLBY_DAP),true)
    ifeq ($(DOLBY_DAP_HW), true)
        $(shell echo \ \ ds_hw { >> $(EFFECT_CONFIG))
        $(shell echo \ \ \ \ path /system/vendor/lib/soundfx/libhwdap.so >> $(EFFECT_CONFIG))
        $(shell echo \ \ } >> $(EFFECT_CONFIG))
    endif
    ifeq ($(DOLBY_DAP_SW), true)
        $(shell echo \ \ ds_sw { >> $(EFFECT_CONFIG))
        $(shell echo \ \ \ \ path /system/vendor/lib/soundfx/libswdap.so >> $(EFFECT_CONFIG))
        $(shell echo \ \ } >> $(EFFECT_CONFIG))
    endif
endif

$(shell echo } >> $(EFFECT_CONFIG))

$(shell echo effects { >> $(EFFECT_CONFIG))

$(shell echo -e $(GOOGLE_EFFECTS_DEFAULT) >> $(EFFECT_CONFIG))
ifdef EFFECTS_DEFAULT
    $(shell echo -e $(EFFECTS_DEFAULT) >> $(EFFECT_CONFIG))
endif

ifeq ($(ENABLE_SRS_EFFECT), true)
    SRS_EFFECTS := \ \ dynamic_bass_boost {\\n\
    \ \ \ library SRS\\n\
    \ \ \ uuid f7a247b0-1a7b-11e0-bb0d-2a30dfd72085\\n\
    \ }\\n\
    \ srsgeq5 {\\n\
    \ \ \ library SRS\\n\
    \ \ \ uuid f7a247c2-1a7b-11e0-bb0d-2a30dfd72085\\n\
    \ }\\n\
    \ wowhd {\\n\
    \ \ \ library SRS\\n\
    \ \ \ uuid f7a247d2-1a7b-11e0-bb0d-2a30dfd72085\\n\
    \ }
    $(shell echo -e $(SRS_EFFECTS) >> $(EFFECT_CONFIG))
endif

ifeq ($(ENABLE_OFFLOAD_VISUALIZER_EFFECT), true)
    VISUALIZER_EFFECTS := \ \ visualizer {\\n\
    \ \ \ library proxy\\n\
    \ \ \ uuid 1d0a1a53-7d5d-48f2-8e71-27fbd10d842c\\n\
    \\n\
    \ \ \ libsw {\\n\
    \ \ \ \ \ library visualizer_sw\\n\
    \ \ \ \ \ uuid  d069d9e0-8329-11df-9168-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \\n\
    \ \ \ libhw {\\n\
    \ \ \ \ \ library visualizer_hw\\n\
    \ \ \ \ \ uuid 7a8044a0-1a71-11e3-a184-0002a5d5c51b\\n\
    \ \ \ }\\n\
    \ }
else
    VISUALIZER_EFFECTS := \ \ visualizer {\\n\
    \ \ \ library visualizer_sw\\n\
    \ \ \ uuid d069d9e0-8329-11df-9168-0002a5d5c51b\\n\
    \ }
endif

$(shell echo -e $(VISUALIZER_EFFECTS) >> $(EFFECT_CONFIG))

ifeq ($(DOLBY_DAP), true)
    ifeq ($(DOLBY_DAP_SW), true)
        ifeq ($(DOLBY_DAP_HW), true)
            DOLBY_EFFECTS := \ \ ds {\\n\
            \ \ \ library proxy\\n\
            \ \ \ uuid 9d4921da-8225-4f29-aefa-39537a04bcaa\\n\
            \\n\
            \ \ \ libsw {\\n\
            \ \ \ \ \ library ds_sw\\n\
            \ \ \ \ \ uuid 6ab06da4-c516-4611-8166-452799218539\\n\
            \ \ \ }\\n\
            \\n\
            \ \ \ libhw {\\n\
            \ \ \ \ \ library ds_hw\\n\
            \ \ \ \ \ uuid a0c30891-8246-4aef-b8ad-d53e26da0253\\n\
            \ \ \ }\\n\
            \ }
        else
            DOLBY_EFFECTS := \ \ ds {\\n\
            \ \ \ library ds_sw\\n\
            \ \ \ uuid 9d4921da-8225-4f29-aefa-39537a04bcaa\\n\
            \ }
        endif
    endif
    $(shell echo -e $(DOLBY_EFFECTS) >> $(EFFECT_CONFIG))
endif

$(shell echo } >> $(EFFECT_CONFIG))
