#
# Copyright 2014 The Android Open-Source Project
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
#

# Use the non-open-source parts, if they're present

# Primary Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53
# Secondary Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
# Enable 64-bits binder
TARGET_USES_64_BIT_BINDER := true

#Debug options???
BOARD_USE_DRM := true
#VINTF_ENFORCE_NO_UNUSED_HALS := true
#PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
#BOARD_VNDK_VERSION := current

TARGET_NO_KERNEL := false
DEVICE_MANIFEST_FILE := device/hardkernel/odroidgo2/manifest.xml
DEVICE_MATRIX_FILE := device/hardkernel/odroidgo2/compatibility_matrix.xml
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_LEFT
TARGET_RECOVERY_UI_SCREEN_WIDTH := 480
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 #1.5GB
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864 #64MB
BOARD_VENDORIMAGE_PARTITION_SIZE := 268435456 #256MB
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

#Mesa Drivers
BOARD_GPU_DRIVERS := panfrost kmsro
USE_OPENGL_RENDERER := true
BOARD_USE_LEGACY_UI := true
BOARD_USES_GRALLOC_HANDLE := true
BOARD_USES_DRM_HWCOMPOSER := true

#Audio Crap
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

#So Mesa3D Upstream Will Build
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true

BOARD_SEPOLICY_DIRS += \
	device/hardkernel/odroidgo2/sepolicy/vendor \

# generic wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := esp8089

# No Bluetooth
#BOARD_HAVE_BLUETOOTH := false

# No Camera
USE_CAMERA_STUB := true
