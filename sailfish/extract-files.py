#!/usr/bin/env -S PYTHONPATH=../../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

import extract_utils.tools

extract_utils.tools.DEFAULT_PATCHELF_VERSION = '0_9'

from extract_utils.extract import extract_fns_user_type
from extract_utils.extract_pixel import (
    extract_pixel_factory_image,
    extract_pixel_firmware,
    pixel_factory_image_regex,
    pixel_firmware_regex,
)
from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/google/marlin',
    'hardware/google/interfaces',
    'hardware/google/pixel',
    'hardware/qcom/display/msm8996',
    'hardware/qcom/media/msm8996',
    'hardware/qcom/wlan/legacy',
    'vendor/qcom/opensource/display',
]


def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None


lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'test'
    ): lib_fixup_vendor_suffix,
    (
        'libsdmutils',
        'libsdmutils_vendor',
    ): lib_fixup_remove,
}

blob_fixups: blob_fixups_user_type = {
    (
        'system/lib/lib-imsvt.so',
        'system/lib64/lib-imsvt.so',
        'system/lib64/libimsmedia_jni.so'
    ): blob_fixup()
        .replace_needed('libdiag.so', 'libdiag_system.so')
        .replace_needed('libqdMetaData.so', 'libqdMetaData.system.so')
        .add_needed('libgui_shim.so'),
    (
        'system/lib/libdiag_system.so',
        'system/lib64/libdiag_system.so',
        'vendor/lib/libmmcamera_faceproc2.so'
    ): blob_fixup()
        .fix_soname(),
    'vendor/lib/libgoog_eis_armeabi-v7a.so': blob_fixup()
        .fix_soname()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    (
        'system/lib/librcc.so',
        'system/lib/lib-imsvtextutils.so',
        'system/lib/lib-imsvideocodec.so',
        'system/lib/lib-imsvtutils.so',
        'system/lib64/librcc.so',
        'system/lib64/lib-imsvtextutils.so',
        'system/lib64/lib-imsvideocodec.so',
        'system/lib64/lib-imsvtutils.so'
    ): blob_fixup()
        .replace_needed('libqdMetaData.so', 'libqdMetaData.system.so')
        .replace_needed('libdiag.so', 'libdiag_system.so'),
    'product/etc/sysconfig/nexus.xml': blob_fixup()
        .regex_replace('qulacomm', 'qualcomm'),
    (
        'product/lib/libdmengine.so',
        'product/lib/libdmjavaplugin.so',
        'product/lib64/libakuaf.so',
        'product/lib64/libmotricity.so'
    ): blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_product.so'),
    'vendor/bin/hw/android.hardware.drm@1.1-service.widevine': blob_fixup()
        .replace_needed('libhidltransport.so', 'libhidlbase.so')
        .remove_needed('libhwbinder.so'),
    (
        'vendor/bin/loc_launcher',
        'vendor/lib/libquipc_os_api.so',
        'vendor/lib/liblowi_client.so',
        'vendor/lib64/liblowi_client.so',
        'vendor/lib64/libquipc_os_api.so'
    ): blob_fixup()
        .add_needed('liblog.so')
        .binary_regex_replace(b'\x2F\x64\x61\x74\x61\x2F\x6D\x69\x73\x63\x2F\x6C\x6F\x63\x61\x74\x69\x6F\x6E', b'\x2F\x64\x61\x74\x61\x2F\x76\x65\x6E\x64\x6F\x72\x2F\x76\x6E\x64\x6C\x6F\x63'),
    (
        'vendor/bin/cnd',
        'vendor/lib/libcne.so',
        'vendor/lib/libcneapiclient.so',
        'vendor/lib/libwms.so',
        'vendor/lib64/libcne.so',
        'vendor/lib64/libcneapiclient.so',
        'vendor/lib64/libwms.so',
    ): blob_fixup()
            .replace_needed('libprotobuf-cpp-lite.so', 'libprotobuf-cpp-lite-v29.so'),
    (
        'vendor/bin/lowi-server',
        'vendor/bin/xtra-daemon',
        'vendor/lib/hw/gps.default.so',
        'vendor/lib/libizat_core.so',
        'vendor/lib/libloc_eng.so',
        'vendor/lib64/hw/gps.default.so',
        'vendor/lib64/libizat_core.so',
        'vendor/lib64/libloc_eng.so',
    ): blob_fixup()
        .binary_regex_replace(b'\x2F\x64\x61\x74\x61\x2F\x6D\x69\x73\x63\x2F\x6C\x6F\x63\x61\x74\x69\x6F\x6E', b'\x2F\x64\x61\x74\x61\x2F\x76\x65\x6E\x64\x6F\x72\x2F\x76\x6E\x64\x6C\x6F\x63'),
    'vendor/bin/pm-service': blob_fixup()
        .replace_needed('libutils.so', 'libutils-v33.so')
        .binary_regex_replace(b'\x76\x6E\x64\x62\x69\x6E\x64\x65\x72', b'\x62\x69\x6E\x64\x65\x72\x00\x00\x00'),
    (
        'vendor/lib/libperipheral_client.so',
        'vendor/lib64/libperipheral_client.so'
    ): blob_fixup()
        .replace_needed('libutils.so', 'libutils-v33.so'),
    (
        'vendor/bin/imsdatadaemon',
        'vendor/bin/imsqmidaemon',
        'vendor/lib/libllvd_smore.so',
        'vendor/lib/libmmcamera_pdaf.so',
        'vendor/lib/libmmcamera_pdafcamif.so',
        'vendor/lib/libmmcamera_tintless_bg_pca_algo.so',
        'vendor/lib64/lib-imsSDP.so',
    ): blob_fixup()
        .add_needed('liblog.so'),
    'vendor/lib/libmmcamera_tuning.so': blob_fixup()
        .remove_needed('libmm-qcamera.so'),
    (
        'vendor/lib/libmm-qdcm-diag.so',
        'vendor/lib/libmm-dspp-utils.so',
        'vendor/lib/libmm-qdcm.so',
        'vendor/lib64/libmm-qdcm-diag.so',
        'vendor/lib64/libmm-dspp-utils.so',
        'vendor/lib64/libsdm-color.so',
        'vendor/lib64/libmm-qdcm.so'
    ): blob_fixup()
        .remove_needed('libpowermanager.so'),
    (
        'vendor/lib/libseemore.so',
        'vendor/lib/libSonyIMX378PdafLibrary.so'
    ): blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    (
        'vendor/lib/libwvhidl.so',
        'vendor/lib64/libwvhidl.so'
    ): blob_fixup()
        .add_needed('libcrypto_shim.so')
        .replace_needed('libprotobuf-cpp-lite.so', 'libprotobuf-cpp-lite-v29.so'),
    'vendor/lib/hw/audio.primary.msm8996-m1s1.so': blob_fixup()
        .fix_soname(),
    'vendor/lib64/vendor.qti.qcril.am@1.0_vendor.so': blob_fixup()
        .fix_soname(),
    'vendor/lib64/libril-qc-qmi-1.so': blob_fixup()
        .replace_needed('vendor.qti.qcril.am@1.0.so', 'vendor.qti.qcril.am@1.0_vendor.so')
        .add_needed('libnanopb393.so'),
    (
    'vendor/lib/lib-dplmedia.so',
    'vendor/lib64/lib-dplmedia.so'
    ): blob_fixup()
        .remove_needed('libmedia.so'),
}  # fmt: skip

extract_fns: extract_fns_user_type = {
    pixel_factory_image_regex: extract_pixel_factory_image,
    pixel_firmware_regex: extract_pixel_firmware,
}

module = ExtractUtilsModule(
    'sailfish',
    'google',
    device_rel_path='device/google/marlin/sailfish',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
    extract_fns=extract_fns,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
