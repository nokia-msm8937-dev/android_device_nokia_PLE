#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libarcsoft_smart_denoise.so \
        |vendor/lib/libarcsoft_night_shot.so)
            "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
            ;;
        # Load sensors.rangefinder.so from /vendor partition
        vendor/lib/libmmcamera2_stats_modules.so)
            sed -i -e 's|system/lib64/sensors.rangefinder.so|vendor/lib64/sensors.rangefinder.so|g' "${2}"
            sed -i -e 's|system/lib/sensors.rangefinder.so|vendor/lib/sensors.rangefinder.so|g' "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=PLE
export DEVICE_COMMON=msm8937-common
export VENDOR=nokia

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
