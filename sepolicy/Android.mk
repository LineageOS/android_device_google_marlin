# Board specific SELinux policy variable definitions
BOARD_SEPOLICY_DIRS := \
       device/qcom/sepolicy \
       device/qcom/sepolicy/common \
       device/qcom/sepolicy/test \
       device/qcom/sepolicy/$(TARGET_BOARD_PLATFORM)

BOARD_SEPOLICY_UNION := \
       genfs_contexts \
       file_contexts \
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
       sensors.te \
       sensors_test.te \
       system_app.te \
       thermal-engine.te \
       global_macros.te \
       system_app.te \
       bluetooth.te \
       init_shell.te \
       mpdecision.te
