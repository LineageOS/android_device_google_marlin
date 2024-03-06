#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=marlin
VENDOR=google

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

ONLY_FIRMWARE=
KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        --only-firmware )
                ONLY_FIRMWARE=true
                ;;
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        system/lib/lib-imsvt.so | system/lib64/lib-imsvt.so | system/lib64/libimsmedia_jni.so)
        grep -q "libgui_shim.so" "${2}" || "${PATCHELF}" --add-needed "libgui_shim.so" "${2}"
            ;;
        # Fix typo in qcrilmsgtunnel whitelist
        product/etc/sysconfig/nexus.xml)
        sed -i 's/qulacomm/qualcomm/' "${2}"
            ;;
        # Move /data/misc/location to /data/vendor/vndloc for selinux
        vendor/bin/loc_launcher|vendor/bin/lowi-server|vendor/bin/xtra-daemon|vendor/lib/hw/gps.default.so|\
        vendor/lib/libizat_core.so|vendor/lib/libloc_eng.so|vendor/lib/liblowi_client.so|vendor/lib/libquipc_os_api.so|\
        vendor/lib64/hw/gps.default.so|vendor/lib64/libizat_core.so|vendor/lib64/libloc_eng.so|\
        vendor/lib64/liblowi_client.so|vendor/lib64/libquipc_os_api.so)
        sed -i 's#/data/misc/location#/data/vendor/vndloc#g' "${2}"
            ;;
        # Patch blobs to load versioned libprotobuf from SDK 29, as SDK 30 removed some symbols
        vendor/bin/cnd)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        vendor/lib/libcne.so)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        vendor/lib/libcneapiclient.so)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        vendor/lib/libwms.so)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        vendor/lib/libwvhidl.so)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        vendor/lib64/libcne.so)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        vendor/lib64/libcneapiclient.so)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        vendor/lib64/libwms.so)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        vendor/lib64/libwvhidl.so)
        "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
        # Patch legacy blobs to use binder instead of vndbinder
        vendor/bin/pm-service)
        sed -i "s/vndbinder/binder\x00\x00\x00/" "${2}"
        grep -q libutils-v33.so "${2}" || "${PATCHELF}" --add-needed "libutils-v33.so" "${2}"
            ;;
        vendor/lib/libperipheral_client.so)
        sed -i "s/vndbinder/binder\x00\x00\x00/" "${2}"
            ;;
        vendor/lib64/libperipheral_client.so)
        sed -i "s/vndbinder/binder\x00\x00\x00/" "${2}"
            ;;
        # Patch QC RIL to load custom libnano
        vendor/lib64/libril-qc-qmi-1.so)
        grep -q "libnanopb393.so" "${2}" || "${PATCHELF}" --add-needed "libnanopb393.so" "${2}"
            ;;
    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

if [ -z "${ONLY_FIRMWARE}" ]; then
  extract "${MY_DIR}/device-proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"
  extract "${MY_DIR}/device-proprietary-files-vendor.txt" "${SRC}" "${KANG}" --section "${SECTION}"
fi

if [ -z "${SECTION}" ]; then
    extract_firmware "${MY_DIR}/${DEVICE}/proprietary-firmware.txt" "${SRC}"
fi

"${MY_DIR}/setup-makefiles.sh"
