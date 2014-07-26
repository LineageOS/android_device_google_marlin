# Board specific SELinux policy variable definitions
BOARD_SEPOLICY_DIRS := \
       device/qcom/sepolicy \
       device/qcom/sepolicy/test

BOARD_SEPOLICY_UNION := \
       file_contexts \
       device.te \
       vold.te \
       ueventd.te \
       file.te \
       init.te \
       drmserver.te \
       adbd.te \
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
       diag_test.te
