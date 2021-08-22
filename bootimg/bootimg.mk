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

LOCAL_PATH := $(call my-dir)

# Build using abootimg instead of mkbootimg
abootimg-BV7000_Pro: $(LOCAL_PATH)/bootimg.h
	gcc $(LOCAL_PATH)/abootimg.c -o $(TARGET_OUT_INTERMEDIATES)/abootimg

$(INSTALLED_BOOTIMAGE_TARGET): abootimg-BV7000_Pro $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) cp $(LOCAL_PATH)/bootimg.cfg $(TARGET_OUT_INTERMEDIATES)/bootimg.cfg
	$(hide) echo cmdline = $(BOARD_KERNEL_CMDLINE) >> $(TARGET_OUT_INTERMEDIATES)/bootimg.cfg
	$(hide) $(TARGET_OUT_INTERMEDIATES)/abootimg --create $@ -f $(TARGET_OUT_INTERMEDIATES)/bootimg.cfg -k $(PRODUCT_OUT)/kernel -r $(PRODUCT_OUT)/ramdisk.img
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

$(INSTALLED_RECOVERYIMAGE_TARGET): abootimg-BV7000_Pro $(recovery_ramdisk) $(recovery_kernel)
	$(call pretty,"Target recovery image: $@")
	$(hide) cp $(LOCAL_PATH)/recoveryimg.cfg $(TARGET_OUT_INTERMEDIATES)/recoveryimg.cfg
	$(hide) echo cmdline = $(BOARD_KERNEL_CMDLINE) >> $(TARGET_OUT_INTERMEDIATES)/recoveryimg.cfg
	$(hide) $(TARGET_OUT_INTERMEDIATES)/abootimg --create $@ -f $(TARGET_OUT_INTERMEDIATES)/recoveryimg.cfg -k $(PRODUCT_OUT)/kernel -r $(PRODUCT_OUT)/ramdisk-recovery.img
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
