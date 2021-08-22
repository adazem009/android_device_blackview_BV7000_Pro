#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CyanogenMod stuff
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit from BV7000_Pro device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := blackview
PRODUCT_DEVICE := BV7000_Pro
PRODUCT_MANUFACTURER := blackview
PRODUCT_NAME := lineage_BV7000_Pro
PRODUCT_MODEL := BV7000 Pro

PRODUCT_GMS_CLIENTID_BASE := android-blackview
TARGET_VENDOR := blackview
TARGET_VENDOR_PRODUCT_NAME := BV7000_Pro
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="full_hct6750_66_n-user 7.0 NRD90M 1508928390 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Blackview/BV7000_Pro/BV7000_Pro:7.0/NRD90M/1493011204:user/release-keys
