# TODO: align sepolicy
# Board specific SELinux policy variable definitions
#ifeq ($(call is-vendor-board-platform,QCOM),true)
#BOARD_SEPOLICY_DIRS := \
#       $(BOARD_SEPOLICY_DIRS) \
#       device/google/marlin/sepolicy \
#       device/google/marlin/sepolicy/common \
#       device/google/marlin/sepolicy/test \
#       device/google/marlin/sepolicy/$(TARGET_BOARD_PLATFORM)
#endif
