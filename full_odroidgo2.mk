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
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults_512.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/hardkernel/odroidgo2/device.mk)

PRODUCT_NAME := full_odroidgo2
PRODUCT_DEVICE := odroidgo2
PRODUCT_BRAND := HardKernel
PRODUCT_MODEL := Odroid Go Advance
PRODUCT_MANUFACTURER := HardKernel
PRODUCT_LOCALES += en_US

# Vendor security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# API Level
PRODUCT_SHIPPING_API_LEVEL := 29

TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 480
