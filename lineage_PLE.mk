#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from PLE device
$(call inherit-product, device/nokia/PLE/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Set shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

# Device identifiers.
PRODUCT_NAME := lineage_PLE
PRODUCT_DEVICE := PLE
PRODUCT_MANUFACTURER := nokia
PRODUCT_BRAND := nokia
PRODUCT_MODEL := nokia_PLE

PRODUCT_GMS_CLIENTID_BASE := android-nokia

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=Nokia6 \
    PRODUCT_NAME=Nokia6

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="TA-1021_00WW-user 9 PKQ1.181105.001 00WW_6_19F release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Nokia/TA-1021_00WW/PLE:9/PKQ1.181105.001/00WW_6_19F:user/release-keys
