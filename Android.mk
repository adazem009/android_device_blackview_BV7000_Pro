LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),BV7000_Pro)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
include $(CLEAR_VARS)
endif
