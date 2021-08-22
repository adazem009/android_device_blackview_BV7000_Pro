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
