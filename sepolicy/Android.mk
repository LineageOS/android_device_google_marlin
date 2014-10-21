# Board specific SELinux policy variable definitions
ifeq ($(call is-vendor-board-platform,QCOM),true)
BOARD_SEPOLICY_DIRS := \
       device/qcom/sepolicy \
       device/qcom/sepolicy/common \
       device/qcom/sepolicy/test \
       device/qcom/sepolicy/$(TARGET_BOARD_PLATFORM)

BOARD_SEPOLICY_UNION := \
       genfs_contexts \
       file_contexts \
       property_contexts \
       service_contexts \
       te_macros \
       ims_datad.te \
       ims_qmid.te \
       device.te \
       vold.te \
       ueventd.te \
       file.te \
       drmserver.te \
       adbd.te \
       app.te \
       cnd.te \
       system_server.te \
       wpa_supplicant.te \
       mediaserver.te \
       msm_irqbalanced.te \
       qmuxd.te \
       netmgrd.te \
       atfwd.te \
       radio.te \
       smd_test.te \
       qmi_ping.te \
       qmi_test_service.te \
       irsc_util.te \
       netd.te \
       rild.te \
       diag.te \
       diag_test.te \
       audiod.te \
       service.te \
       system_app.te \
       thermal-engine.te \
       global_macros.te \
       system_app.te \
       bluetooth.te \
       init_shell.te \
       mpdecision.te \
       mm-qcamerad.te \
       domain.te \
       init_shell.te \
       time_daemon.te \
       rmt_storage.te \
       hvdcp.te \
       qseecomd.te \
       mcStarter.te \
       keystore.te \
       ims_rmt.te \
       healthd.te \
       charger_monitor.te \
       surfaceflinger.te \
       wpa.te \
       bootanim.te \
       zygote.te \
       mdm_helper.te \
       peripheral_manager.te \
       qcomsysd.te \
       servicemanager.te

# Compile sensor pilicy only for SSC targets
SSC_TARGET_LIST := apq8084
SSC_TARGET_LIST += msm8226
SSC_TARGET_LIST += msm8960
SSC_TARGET_LIST += msm8974
SSC_TARGET_LIST += msm8994

#ifeq ($(call is-board-platform-in-list,$(SSC_TARGET_LIST)),true)
BOARD_SEPOLICY_UNION += sensors.te
BOARD_SEPOLICY_UNION += sensors_test.te
#endif
endif
