#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# inherit from common msm8937-common
-include device/nokia/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/nokia/PLE

# Assert
TARGET_OTA_ASSERT_DEVICE := PLE

# Build
BUILD_BROKEN_DUP_RULES := true

# Kernel
TARGET_KERNEL_CONFIG := PLE_defconfig

# Display
TARGET_SCREEN_DENSITY := 380

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_PLE
TARGET_RECOVERY_DEVICE_MODULES := libinit_PLE

# Partitions - Root
BOARD_ROOT_EXTRA_FOLDERS := factory

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit the proprietary files
-include vendor/nokia/PLE/BoardConfigVendor.mk
