# Board platforms lists to be used for
# TARGET_BOARD_PLATFORM specific featurization
QCOM_BOARD_PLATFORMS += msm8974
QCOM_BOARD_PLATFORMS += msm8610
QCOM_BOARD_PLATFORMS += msm8226
QCOM_BOARD_PLATFORMS += apq8084
QCOM_BOARD_PLATFORMS += mpq8092
QCOM_BOARD_PLATFORMS += msm_bronze
QCOM_BOARD_PLATFORMS += msm8916
QCOM_BOARD_PLATFORMS += msm8916_32
QCOM_BOARD_PLATFORMS += msm8916_32_512
QCOM_BOARD_PLATFORMS += msm8916_64
QCOM_BOARD_PLATFORMS += msm8994
QCOM_BOARD_PLATFORMS += msm8909
QCOM_BOARD_PLATFORMS += msm8909_512
QCOM_BOARD_PLATFORMS += msm8992
QCOM_BOARD_PLATFORMS += msm8996
QCOM_BOARD_PLATFORMS += msm8952
QCOM_BOARD_PLATFORMS += msm8937
QCOM_BOARD_PLATFORMS += titanium
QCOM_BOARD_PLATFORMS += msmcobalt

QSD8K_BOARD_PLATFORMS := qsd8k

TARGET_USE_VENDOR_CAMERA_EXT := true

#List of targets that use video hw
MSM_VIDC_TARGET_LIST := msm8974 msm8610 msm8226 apq8084 msm8916 msm8994 msm8909 msm8992 msm8996 msm8952 msm8937 titanium msmcobalt

#List of targets that use master side content protection
MASTER_SIDE_CP_TARGET_LIST := msm8996

# Below projects/packages with LOCAL_MODULEs will be used by
# PRODUCT_PACKAGES to build LOCAL_MODULEs that are tagged with
# optional tag, which will not be available on target unless
# explicitly list here. Where project corresponds to the vars here
# in CAPs.

#APPOPS_POLICY
#APPOPS_POLICY := appops_policy.xml

#AUDIO_HARDWARE += audio.primary.msm7627_surf
#AUDIO_HARDWARE += audio.primary.default
AUDIO_HARDWARE += audio.bluetooth.default
AUDIO_HARDWARE += audio.usb.default
AUDIO_HARDWARE += audio.r_submix.default
AUDIO_HARDWARE += audio.primary.msm8996
#
#AUDIO_POLICY += audio_policy.msm7627_surf
#AUDIO_POLICY += audio_policy.default

#tinyalsa test apps
TINY_ALSA_TEST_APPS := tinyplay
TINY_ALSA_TEST_APPS += tinycap
TINY_ALSA_TEST_APPS += tinypcminfo
TINY_ALSA_TEST_APPS += cplay

#BRCTL
BRTCL += libbridge

#BT
BT += libbt-vendor

#C2DColorConvert
C2DCC := libc2dcolorconvert

CHROMIUM += libwebviewchromium_loader
CHROMIUM += libwebviewchromium_plat_support

#CURL
CURL := libcurl
CURL += curl

#DATA_OS
DATA_OS := librmnetctl
DATA_OS += rmnetcli

#E2FSPROGS
E2FSPROGS := e2fsck

#GPS
#GPS_HARDWARE := gps.conf

#HOSTAPD
HOSTAPD := hostapd
HOSTAPD += hostapd_cli

#IPROUTE2
IPROUTE2 := ip
IPROUTE2 += libiprouteutil

#IPTABLES
IPTABLES += libext
IPTABLES += iptables

#LIB_XML2
LIB_XML2 := libxml2

#LIBCAMERA
LIBCAMERA += camera.msm8996
LIBCAMERA += libmmcamera_interface
LIBCAMERA += libmmjpeg_interface
LIBCAMERA += libqomx_core
LIBCAMERA += mm-qcamera-app

# Shared by passthrough/binderized camera HAL
LIBCAMERA += camera.device@3.2-impl
LIBCAMERA += android.hardware.camera.provider@2.4-impl

# Enable binderized camera HAL
LIBCAMERA += android.hardware.camera.provider@2.4-service

#LIBGRALLOC
LIBGRALLOC := gralloc.default
LIBGRALLOC += gralloc.msm8996

#memtrack
LIBMEMTRACK += memtrack.msm8996
LIBMEMTRACK += android.hardware.memtrack@1.0-impl

#LIBLIGHTS
LIBLIGHTS += lights.msm8996

#LIBHWCOMPOSER
LIBHWCOMPOSER += hwcomposer.msm8996

#LIBAUDIOPARAM -- Exposing AudioParameter as dynamic library for SRS TruMedia to work

#LIBAUDIORESAMPLER -- High-quality audio resampler
LIBAUDIORESAMPLER := libaudio-resampler

#LIBQDUTILS
LIBQDUTILS := libqdutils

#LIBQDMETADATA
LIBQDMETADATA := libqdMetaData

#LLVM for RenderScript
#use qcom LLVM
$(call inherit-product-if-exists, external/llvm/llvm-select.mk)

#MM_AUDIO
MM_AUDIO += libstagefright_soft_flacdec

#MM_CORE
MM_CORE := libmm-omxcore
MM_CORE += libOmxCore

#MM_VIDEO
MM_VIDEO += libOmxVdec
MM_VIDEO += libOmxVenc
MM_VIDEO += libstagefrighthw

#PPP
PPP := ip-up-vpn

#STK
STK := Stk

#WPA
WPA := wpa_supplicant.conf
WPA += wpa_supplicant
WPA += hs20-osu-client
ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
WPA += wpa_cli
endif

#Charger
CHARGER := charger
CHARGER += charger_res_images

#IMS SETTINGS
IMS_SETTINGS := imssettings

#IMS Extension module for Android Telephony
IMS_EXT := ims-ext-common

PRODUCT_PACKAGES := \
    DeskClock \
    Calendar \
    CertInstaller \
    Gallery2 \
    LatinIME \
    Music \
    Provision \
    QuickSearchBox \
    Settings \
    SystemUI \
    Updater \
    CalendarProvider

PRODUCT_PACKAGES += $(ALSA_HARDWARE)
PRODUCT_PACKAGES += $(ALSA_UCM)
PRODUCT_PACKAGES += $(ANGLE)
#PRODUCT_PACKAGES += $(APPOPS_POLICY)
PRODUCT_PACKAGES += $(AUDIO_HARDWARE)
PRODUCT_PACKAGES += $(AUDIO_POLICY)
PRODUCT_PACKAGES += $(TINY_ALSA_TEST_APPS)
PRODUCT_PACKAGES += $(AMPLOADER)
PRODUCT_PACKAGES += $(APPS)
PRODUCT_PACKAGES += $(BRCTL)
PRODUCT_PACKAGES += $(BSON)
PRODUCT_PACKAGES += $(BT)
PRODUCT_PACKAGES += $(C2DCC)
PRODUCT_PACKAGES += $(CHROMIUM)
PRODUCT_PACKAGES += $(CIMAX)
PRODUCT_PACKAGES += $(CONNECTIVITY)
PRODUCT_PACKAGES += $(CHARGER)
PRODUCT_PACKAGES += $(CURL)
PRODUCT_PACKAGES += $(DASH)
PRODUCT_PACKAGES += $(DATA_OS)
PRODUCT_PACKAGES += $(E2FSPROGS)
PRODUCT_PACKAGES += $(EBTABLES)
PRODUCT_PACKAGES += $(EXTENDEDMEDIA_EXT)
PRODUCT_PACKAGES += $(FASTPOWERON)
PRODUCT_PACKAGES += $(FM)
PRODUCT_PACKAGES += $(GPS_HARDWARE)
PRODUCT_PACKAGES += $(HDMID)
PRODUCT_PACKAGES += $(HOSTAPD)
PRODUCT_PACKAGES += $(I420CC)
PRODUCT_PACKAGES += $(INIT)
PRODUCT_PACKAGES += $(IPROUTE2)
PRODUCT_PACKAGES += $(IPTABLES)
PRODUCT_PACKAGES += $(KERNEL_TESTS)
PRODUCT_PACKAGES += $(KEYPAD)
PRODUCT_PACKAGES += $(KS)
PRODUCT_PACKAGES += $(LIB_NL)
PRODUCT_PACKAGES += $(LIB_XML2)
PRODUCT_PACKAGES += $(LIBCAMERA)
PRODUCT_PACKAGES += $(LIBGESTURES)
PRODUCT_PACKAGES += $(LIBCOPYBIT)
PRODUCT_PACKAGES += $(LIBGRALLOC)
PRODUCT_PACKAGES += $(LIBMEMTRACK)
PRODUCT_PACKAGES += $(LIBLIGHTS)
PRODUCT_PACKAGES += $(LIBAUDIOPARAM)
PRODUCT_PACKAGES += $(LIBAUDIORESAMPLER)
PRODUCT_PACKAGES += $(LIBOPENCOREHW)
PRODUCT_PACKAGES += $(LIBOVERLAY)
PRODUCT_PACKAGES += $(LIBHWCOMPOSER)
PRODUCT_PACKAGES += $(LIBGENLOCK)
PRODUCT_PACKAGES += $(LIBPERFLOCK)
PRODUCT_PACKAGES += $(LIBQCOMUI)
PRODUCT_PACKAGES += $(LIBQDUTILS)
PRODUCT_PACKAGES += $(LIBQDMETADATA)
PRODUCT_PACKAGES += $(LIBPOWER)
PRODUCT_PACKAGES += $(LOC_API)
PRODUCT_PACKAGES += $(MEDIA_PROFILES)
PRODUCT_PACKAGES += $(MM_AUDIO)
PRODUCT_PACKAGES += $(MM_CORE)
PRODUCT_PACKAGES += $(MM_VIDEO)
PRODUCT_PACKAGES += $(OPENCORE)
PRODUCT_PACKAGES += $(PPP)
PRODUCT_PACKAGES += $(PVOMX)
PRODUCT_PACKAGES += $(RF4CE)
PRODUCT_PACKAGES += $(SENSORS_HARDWARE)
#PRODUCT_PACKAGES += $(SOFTAP)
PRODUCT_PACKAGES += $(STK)
PRODUCT_PACKAGES += $(STMLOG)
PRODUCT_PACKAGES += $(TSLIB_EXTERNAL)
PRODUCT_PACKAGES += $(QRGND)
PRODUCT_PACKAGES += $(UPDATER)
PRODUCT_PACKAGES += $(WPA)
PRODUCT_PACKAGES += $(ZLIB)
PRODUCT_PACKAGES += $(VT_JNI)
PRODUCT_PACKAGES += $(VT_QTI_PERMISSIONS)
PRODUCT_PACKAGES += $(IMS_SETTINGS)
PRODUCT_PACKAGES += $(CRDA)
PRODUCT_PACKAGES += $(WLAN)
PRODUCT_PACKAGES += $(IPACM)
PRODUCT_PACKAGES += $(FSTMAN)
PRODUCT_PACKAGES += $(IMS_EXT)

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapersPicker \
        librs_jni

# GPT utils library
PRODUCT_PACKAGES += libgptutils.marlin
PRODUCT_PACKAGES += libgptutils.marlin.recovery

# healthd libaray expanded for mode charger
PRODUCT_PACKAGES += libhealthd.msm

#intialise PRODUCT_PACKAGES_ENG list for debug modules
PRODUCT_PACKAGES_ENG := init.qcom.testscripts.sh


#NANOPB_LIBRARY_NAME := libnanopb-c-2.8.0
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.carrierlock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.carrierlock.xml

# Bluetooth configuration files
#PRODUCT_COPY_FILES += \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf \
    system/bluetooth/data/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    system/bluetooth/data/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    system/bluetooth/data/input.conf:system/etc/bluetooth/input.conf \
    system/bluetooth/data/network.conf:system/etc/bluetooth/network.conf \

#ifeq ($(BOARD_HAVE_BLUETOOTH_BLUEZ),true)
#PRODUCT_COPY_FILES += \
    system/bluetooth/data/stack.conf:system/etc/bluetooth/stack.conf
#endif # BOARD_HAVE_BLUETOOTH_BLUEZ

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \

# enable overlays to use our version of
# source/resources etc.
#DEVICE_PACKAGE_OVERLAYS += device/google/marlin/common/device/overlay
#PRODUCT_PACKAGE_OVERLAYS += device/google/marlin/common/product/overlay

# include additional build utilities
-include device/google/marlin/common/utils.mk

#Enabling Ring Tones
#include frameworks/base/data/sounds/OriginalAudio.mk

#Enabling video for live effects
-include frameworks/base/data/videos/VideoPackage1.mk

#TODO: move to device.mk
# dm-verity definitions
PRODUCT_SYSTEM_VERITY_PARTITION=/dev/block/platform/soc/624000.ufshc/by-name/system
$(call inherit-product, build/target/product/verity.mk)

PRODUCT_DEXPREOPT_SPEED_APPS += \
  SystemUIGoogle

# Save space by disabling dexpreopt of GMS modules.
DEXPREOPT.$(TARGET_PRODUCT).PrebuiltGmsCorePi_extract.CONFIG=disable

PRODUCT_LOADED_BY_PRIVILEGED_MODULES += \
  qti-vzw-ims-internal \
  qcrilhook \
  ims \
  Stk \
  embmslibrary \
  datastatusnotification \
  VZWAPNLib \
  UserDictionaryProvider
