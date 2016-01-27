# TODO: align sepolicy
# Board specific SELinux policy variable definitions
#ifeq ($(call is-vendor-board-platform,QCOM),true)
#BOARD_SEPOLICY_DIRS := \
#       $(BOARD_SEPOLICY_DIRS) \
#       device/htc/marlin/sepolicy \
#       device/htc/marlin/sepolicy/common \
#       device/htc/marlin/sepolicy/test \
#       device/htc/marlin/sepolicy/$(TARGET_BOARD_PLATFORM)
#endif
