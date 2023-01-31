#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from apollo_docomo device
$(call inherit-product, device/sony/apollo_docomo/device.mk)

PRODUCT_DEVICE := apollo_docomo
PRODUCT_NAME := lineage_apollo_docomo
PRODUCT_BRAND := Sony
PRODUCT_MODEL := SO-05K
PRODUCT_MANUFACTURER := sony

PRODUCT_GMS_CLIENTID_BASE := android-sonymobile-rev1

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="apollo_docomo-user 9 TAMA2-2.0.1-DOCOMO-191212-0529 1 dev-keys"

BUILD_FINGERPRINT := Sony/apollo_docomo/apollo_docomo:9/TAMA2-2.0.1-DOCOMO-191212-0529/1:user/dev-keys
