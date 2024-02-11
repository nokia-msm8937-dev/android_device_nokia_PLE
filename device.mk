#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nokia/PLE

# Inherit from msm8937-common
$(call inherit-product, device/nokia/msm8937-common/msm8937.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/nokia/PLE/PLE-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    device/nokia/PLE

# Screen density
TARGET_SCREEN_HEIGHT := 1440
TARGET_SCREEN_WIDTH := 720

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_ple.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_ple.xml

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.PLE

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.factory \
    init.PLE.rc
