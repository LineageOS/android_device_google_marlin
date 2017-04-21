# Copyright 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#  blob(s) necessary for Dragon hardware
PRODUCT_COPY_FILES := \
    vendor/qcom/sailfish/proprietary/adsprpcd:system/bin/adsprpcd:qcom \
    vendor/qcom/sailfish/proprietary/ATFWD-daemon:system/bin/ATFWD-daemon:qcom \
    vendor/qcom/sailfish/proprietary/athdiag:system/bin/athdiag:qcom \
    vendor/qcom/sailfish/proprietary/cnd:system/bin/cnd:qcom \
    vendor/qcom/sailfish/proprietary/cnss-daemon:system/bin/cnss-daemon:qcom \
    vendor/qcom/sailfish/proprietary/cnss_diag:system/bin/cnss_diag:qcom \
    vendor/qcom/sailfish/proprietary/diag_callback_sample:system/bin/diag_callback_sample:qcom \
    vendor/qcom/sailfish/proprietary/diag_dci_sample:system/bin/diag_dci_sample:qcom \
    vendor/qcom/sailfish/proprietary/diag_mdlog:system/bin/diag_mdlog:qcom \
    vendor/qcom/sailfish/proprietary/diag_socket_log:system/bin/diag_socket_log:qcom \
    vendor/qcom/sailfish/proprietary/diag_uart_log:system/bin/diag_uart_log:qcom \
    vendor/qcom/sailfish/proprietary/ftmdaemon:system/bin/ftmdaemon:qcom \
    vendor/qcom/sailfish/proprietary/gptest:system/bin/gptest:qcom \
    vendor/qcom/sailfish/proprietary/hal_proxy_daemon:system/bin/hal_proxy_daemon:qcom \
    vendor/qcom/sailfish/proprietary/hci_qcomm_init:system/bin/hci_qcomm_init:qcom \
    vendor/qcom/sailfish/proprietary/imscmservice:system/bin/imscmservice:qcom \
    vendor/qcom/sailfish/proprietary/imsdatadaemon:system/bin/imsdatadaemon:qcom \
    vendor/qcom/sailfish/proprietary/imsqmidaemon:system/bin/imsqmidaemon:qcom \
    vendor/qcom/sailfish/proprietary/ims_rtp_daemon:system/bin/ims_rtp_daemon:qcom \
    vendor/qcom/sailfish/proprietary/irsc_util:system/bin/irsc_util:qcom \
    vendor/qcom/sailfish/proprietary/loc_launcher:system/bin/loc_launcher:qcom \
    vendor/qcom/sailfish/proprietary/lowi-server:system/bin/lowi-server:qcom \
    vendor/qcom/sailfish/proprietary/mct-unit-test-app:system/bin/mct-unit-test-app:qcom \
    vendor/qcom/sailfish/proprietary/mdm_helper:system/bin/mdm_helper:qcom \
    vendor/qcom/sailfish/proprietary/mdm_helper_proxy:system/bin/mdm_helper_proxy:qcom \
    vendor/qcom/sailfish/proprietary/mm-qcamera-daemon:system/bin/mm-qcamera-daemon:qcom \
    vendor/qcom/sailfish/proprietary/myftm:system/bin/myftm:qcom \
    vendor/qcom/sailfish/proprietary/nanotool:system/bin/nanotool:qcom \
    vendor/qcom/sailfish/proprietary/netmgrd:system/bin/netmgrd:qcom \
    vendor/qcom/sailfish/proprietary/nl_listener:system/bin/nl_listener:qcom \
    vendor/qcom/sailfish/proprietary/pktlogconf:system/bin/pktlogconf:qcom \
    vendor/qcom/sailfish/proprietary/PktRspTest:system/bin/PktRspTest:qcom \
    vendor/qcom/sailfish/proprietary/pm-proxy:system/bin/pm-proxy:qcom \
    vendor/qcom/sailfish/proprietary/pm-service:system/bin/pm-service:qcom \
    vendor/qcom/sailfish/proprietary/port-bridge:system/bin/port-bridge:qcom \
    vendor/qcom/sailfish/proprietary/qfipsverify:system/bin/qfipsverify:qcom \
    vendor/qcom/sailfish/proprietary/qmi_simple_ril_test:system/bin/qmi_simple_ril_test:qcom \
    vendor/qcom/sailfish/proprietary/qseecom_sample_client:system/bin/qseecom_sample_client:qcom \
    vendor/qcom/sailfish/proprietary/radish:system/bin/radish:qcom \
    vendor/qcom/sailfish/proprietary/rmt_storage:system/bin/rmt_storage:qcom \
    vendor/qcom/sailfish/proprietary/ssr_diag:system/bin/ssr_diag:qcom \
    vendor/qcom/sailfish/proprietary/ssr_setup:system/bin/ssr_setup:qcom \
    vendor/qcom/sailfish/proprietary/StoreKeybox:system/bin/StoreKeybox:qcom \
    vendor/qcom/sailfish/proprietary/subsystem_ramdump:system/bin/subsystem_ramdump:qcom \
    vendor/qcom/sailfish/proprietary/tbaseLoader:system/bin/tbaseLoader:qcom \
    vendor/qcom/sailfish/proprietary/test_bet_8996:system/bin/test_bet_8996:qcom \
    vendor/qcom/sailfish/proprietary/test_diag:system/bin/test_diag:qcom \
    vendor/qcom/sailfish/proprietary/test_module_pproc:system/bin/test_module_pproc:qcom \
    vendor/qcom/sailfish/proprietary/time_daemon:system/bin/time_daemon:qcom \
    vendor/qcom/sailfish/proprietary/wcnss_filter:system/bin/wcnss_filter:qcom \
    vendor/qcom/sailfish/proprietary/wdsdaemon:system/bin/wdsdaemon:qcom \
    vendor/qcom/sailfish/proprietary/WifiLogger_app:system/bin/WifiLogger_app:qcom \
    vendor/qcom/sailfish/proprietary/Bluetooth_cal.acdb:system/etc/acdbdata/Bluetooth_cal.acdb:qcom \
    vendor/qcom/sailfish/proprietary/General_cal.acdb:system/etc/acdbdata/General_cal.acdb:qcom \
    vendor/qcom/sailfish/proprietary/Global_cal.acdb:system/etc/acdbdata/Global_cal.acdb:qcom \
    vendor/qcom/sailfish/proprietary/Handset_cal.acdb:system/etc/acdbdata/Handset_cal.acdb:qcom \
    vendor/qcom/sailfish/proprietary/Hdmi_cal.acdb:system/etc/acdbdata/Hdmi_cal.acdb:qcom \
    vendor/qcom/sailfish/proprietary/Headset_cal.acdb:system/etc/acdbdata/Headset_cal.acdb:qcom \
    vendor/qcom/sailfish/proprietary/Speaker_cal.acdb:system/etc/acdbdata/Speaker_cal.acdb:qcom \
    vendor/qcom/sailfish/proprietary/imx179_chromatix.xml:system/etc/camera/imx179_chromatix.xml:qcom \
    vendor/qcom/sailfish/proprietary/imx378_chromatix.xml:system/etc/camera/imx378_chromatix.xml:qcom \
    vendor/qcom/sailfish/proprietary/msm8996_camera.xml:system/etc/camera/msm8996_camera.xml:qcom \
    vendor/qcom/sailfish/proprietary/ATT_profiles.xml:system/etc/cne/Nexus/ATT/ATT_profiles.xml:qcom \
    vendor/qcom/sailfish/proprietary/ROW_profiles.xml:system/etc/cne/Nexus/ROW/ROW_profiles.xml:qcom \
    vendor/qcom/sailfish/proprietary/VZW_profiles.xml:system/etc/cne/Nexus/VZW/VZW_profiles.xml:qcom \
    vendor/qcom/sailfish/proprietary/CHRE.cfg:system/etc/diag/CHRE.cfg:qcom \
    vendor/qcom/sailfish/proprietary/IMS.cfg:system/etc/diag/IMS.cfg:qcom \
    vendor/qcom/sailfish/proprietary/MarlinSailfish_Radio-generic.cfg:system/etc/diag/MarlinSailfish_Radio-generic.cfg:qcom \
    vendor/qcom/sailfish/proprietary/wlan.cfg:system/etc/diag/wlan.cfg:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_10_0.fw:system/etc/firmware/cpp_firmware_v1_10_0.fw:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_1_1.fw:system/etc/firmware/cpp_firmware_v1_1_1.fw:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_1_6.fw:system/etc/firmware/cpp_firmware_v1_1_6.fw:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_2_0.fw:system/etc/firmware/cpp_firmware_v1_2_0.fw:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_4_0.fw:system/etc/firmware/cpp_firmware_v1_4_0.fw:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_5_0.fw:system/etc/firmware/cpp_firmware_v1_5_0.fw:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_5_2.fw:system/etc/firmware/cpp_firmware_v1_5_2.fw:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_6_0.fw:system/etc/firmware/cpp_firmware_v1_6_0.fw:qcom \
    vendor/qcom/sailfish/proprietary/cpp_firmware_v1_8_0.fw:system/etc/firmware/cpp_firmware_v1_8_0.fw:qcom \
    vendor/qcom/sailfish/proprietary/nvm_tlv_1.3.bin:system/etc/firmware/nvm_tlv_1.3.bin:qcom \
    vendor/qcom/sailfish/proprietary/nvm_tlv_2.1.bin:system/etc/firmware/nvm_tlv_2.1.bin:qcom \
    vendor/qcom/sailfish/proprietary/nvm_tlv_3.0.bin:system/etc/firmware/nvm_tlv_3.0.bin:qcom \
    vendor/qcom/sailfish/proprietary/nvm_tlv_3.2.bin:system/etc/firmware/nvm_tlv_3.2.bin:qcom \
    vendor/qcom/sailfish/proprietary/nvm_tlv.bin:system/etc/firmware/nvm_tlv.bin:qcom \
    vendor/qcom/sailfish/proprietary/rampatch_tlv_1.3.tlv:system/etc/firmware/rampatch_tlv_1.3.tlv:qcom \
    vendor/qcom/sailfish/proprietary/rampatch_tlv_2.1.tlv:system/etc/firmware/rampatch_tlv_2.1.tlv:qcom \
    vendor/qcom/sailfish/proprietary/rampatch_tlv_3.0.tlv:system/etc/firmware/rampatch_tlv_3.0.tlv:qcom \
    vendor/qcom/sailfish/proprietary/rampatch_tlv_3.2.tlv:system/etc/firmware/rampatch_tlv_3.2.tlv:qcom \
    vendor/qcom/sailfish/proprietary/rampatch_tlv.img:system/etc/firmware/rampatch_tlv.img:qcom \
    vendor/qcom/sailfish/proprietary/tfa98xx.cnt:system/etc/firmware/tfa98xx.cnt:qcom \
    vendor/qcom/sailfish/proprietary/flp.conf:system/etc/flp.conf:qcom \
    vendor/qcom/sailfish/proprietary/izat.conf:system/etc/izat.conf:qcom \
    vendor/qcom/sailfish/proprietary/lowi.conf:system/etc/lowi.conf:qcom \
    vendor/qcom/sailfish/proprietary/com.android.ims.rcsmanager.xml:system/etc/permissions/com.android.ims.rcsmanager.xml:qcom \
    vendor/qcom/sailfish/proprietary/embms.xml:system/etc/permissions/embms.xml:qcom \
    vendor/qcom/sailfish/proprietary/imscm.xml:system/etc/permissions/imscm.xml:qcom \
    vendor/qcom/sailfish/proprietary/qcrilhook.xml:system/etc/permissions/qcrilhook.xml:qcom \
    vendor/qcom/sailfish/proprietary/qti_permissions.xml:system/etc/permissions/qti_permissions.xml:qcom \
    vendor/qcom/sailfish/proprietary/qti-vzw-ims-internal.xml:system/etc/permissions/qti-vzw-ims-internal.xml:qcom \
    vendor/qcom/sailfish/proprietary/rcsservice.xml:system/etc/permissions/rcsservice.xml:qcom \
    vendor/qcom/sailfish/proprietary/telephonyservice.xml:system/etc/permissions/telephonyservice.xml:qcom \
    vendor/qcom/sailfish/proprietary/vzw_sso_permissions.xml:system/etc/permissions/vzw_sso_permissions.xml:qcom \
    vendor/qcom/sailfish/proprietary/qdcm_calib_data_S1_FHD_SAMSUNG_EA8064TG_5.0_command_mode_panel.xml:system/etc/qdcm_calib_data_S1_FHD_SAMSUNG_EA8064TG_5.0_command_mode_panel.xml:qcom \
    vendor/qcom/sailfish/proprietary/sap.conf:system/etc/sap.conf:qcom \
    vendor/qcom/sailfish/proprietary/com.android.ims.rcsmanager.jar:system/framework/com.android.ims.rcsmanager.jar:qcom \
    vendor/qcom/sailfish/proprietary/embmslibrary.jar:system/framework/embmslibrary.jar:qcom \
    vendor/qcom/sailfish/proprietary/qcrilhook.jar:system/framework/qcrilhook.jar:qcom \
    vendor/qcom/sailfish/proprietary/QtiTelephonyServicelibrary.jar:system/framework/QtiTelephonyServicelibrary.jar:qcom \
    vendor/qcom/sailfish/proprietary/rcsservice.jar:system/framework/rcsservice.jar:qcom \
    vendor/qcom/sailfish/proprietary/lib64/gps.default.so:system/lib64/hw/gps.default.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libgps.utils.so:system/lib64/libgps.utils.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libloc_api_v02.so:system/lib64/libloc_api_v02.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libloc_core.so:system/lib64/libloc_core.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libloc_ds_api.so:system/lib64/libloc_ds_api.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libloc_eng.so:system/lib64/libloc_eng.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libminui.so:system/lib64/libminui.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libtinyxml.so:system/lib64/libtinyxml.so:qcom \
    vendor/qcom/sailfish/proprietary/lib64/libwifi-hal-qcom.so:system/lib64/libwifi-hal-qcom.so:qcom \
    vendor/qcom/sailfish/proprietary/gps.default.so:system/lib/hw/gps.default.so:qcom \
    vendor/qcom/sailfish/proprietary/libgps.utils.so:system/lib/libgps.utils.so:qcom \
    vendor/qcom/sailfish/proprietary/libion.so:system/lib/libion.so:qcom \
    vendor/qcom/sailfish/proprietary/libloc_api_v02.so:system/lib/libloc_api_v02.so:qcom \
    vendor/qcom/sailfish/proprietary/libloc_core.so:system/lib/libloc_core.so:qcom \
    vendor/qcom/sailfish/proprietary/libloc_ds_api.so:system/lib/libloc_ds_api.so:qcom \
    vendor/qcom/sailfish/proprietary/libloc_eng.so:system/lib/libloc_eng.so:qcom \
    vendor/qcom/sailfish/proprietary/libminui.so:system/lib/libminui.so:qcom \
    vendor/qcom/sailfish/proprietary/libmm-qcamera.so:system/lib/libmm-qcamera.so:qcom \
    vendor/qcom/sailfish/proprietary/libtinyxml.so:system/lib/libtinyxml.so:qcom \
    vendor/qcom/sailfish/proprietary/bootimg.hmac:system/usr/qfipsverify/bootimg.hmac:qcom \
    vendor/qcom/sailfish/proprietary/qfipsverify.hmac:system/usr/qfipsverify/qfipsverify.hmac:qcom \

