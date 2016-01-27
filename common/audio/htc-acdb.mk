
ifneq ($(strip $(HTC_ACDB_FILE_PATH)),)
$(warning AUD: copy ACDB from $(HTC_ACDB_FILE_PATH) to system/etc/)

PRODUCT_COPY_FILES += \
	$(HTC_ACDB_FILE_PATH)/Bluetooth_cal.acdb:system/etc/Bluetooth_cal.acdb \
	$(HTC_ACDB_FILE_PATH)/General_cal.acdb:system/etc/General_cal.acdb \
	$(HTC_ACDB_FILE_PATH)/Global_cal.acdb:system/etc/Global_cal.acdb \
	$(HTC_ACDB_FILE_PATH)/Handset_cal.acdb:system/etc/Handset_cal.acdb \
	$(HTC_ACDB_FILE_PATH)/Hdmi_cal.acdb:system/etc/Hdmi_cal.acdb \
	$(HTC_ACDB_FILE_PATH)/Headset_cal.acdb:system/etc/Headset_cal.acdb \
	$(HTC_ACDB_FILE_PATH)/Speaker_cal.acdb:system/etc/Speaker_cal.acdb
endif

