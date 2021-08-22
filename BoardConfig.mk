# Device
DEVICE_PATH := device/blackview/BV7000_Pro
LOCAL_PATH := $(DEVICE_PATH)
BOARD_VENDOR := blackview

# Assert
TARGET_OTA_ASSERT_DEVICE := BV7000_Pro,BV7000_PRO

# Architecture
ifeq ($(FORCE_32_BIT),true)
    TARGET_ARCH := arm
    TARGET_ARCH_VARIANT := armv7-a-neon
    TARGET_CPU_ABI := armeabi-v7a
    TARGET_CPU_ABI2 := armeabi
    TARGET_CPU_VARIANT := cortex-a53
else
    TARGET_ARCH := arm64
    TARGET_ARCH_VARIANT := armv8-a
    TARGET_CPU_ABI := arm64-v8a
    TARGET_CPU_ABI2 :=
    TARGET_CPU_VARIANT := cortex-a53

    TARGET_2ND_ARCH := arm
    TARGET_2ND_ARCH_VARIANT := armv7-a-neon
    TARGET_2ND_CPU_ABI := armeabi-v7a
    TARGET_2ND_CPU_ABI2 := armeabi
    TARGET_2ND_CPU_VARIANT := cortex-a53
endif

# Architecture Extensions
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_VFP := true

# Platform
TARGET_BOARD_SUFFIX := _64
TARGET_BOARD_PLATFORM := mt6750
TARGET_BOARD_PLATFORM_GPU := mali-t860mp2
TARGET_USES_64_BIT_BINDER := true

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

# Hack for building without kernel sources
ifneq ($(OUT),)
    $(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
    $(shell touch $(OUT)/obj/KERNEL_OBJ/usr/export_includes)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/bootimg/bootimg.mk

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3565158400
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# FSTAB
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6755

# Audio
BOARD_USES_MTK_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1
USE_CUSTOM_AUDIO_POLICY := 1

# Block based ota (Disable build block rom)
BLOCK_BASED_OTA := false

# Camera
USE_CAMERA_STUB := true

# Legacy HAL
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Use dlmalloc instead of jemalloc for mallocs
MALLOC_SVELTE := true

# Display
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 1
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.5.0

# Bootloader
TARGET_NO_BOOTLOADER := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.mt6755

# GPS
BOARD_GPS_LIBRARIES := true
BOARD_MEDIATEK_USES_GPS := true

# FM
MTK_FM_SUPPORT := yes

# MTK Hardware
BOARD_USES_MTK_HARDWARE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:= /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP:= AP
WIFI_DRIVER_FW_PATH_STA:= STA
WIFI_DRIVER_FW_PATH_P2P:= P2P

# Platform
TARGET_BOOTLOADER_BOARD_NAME := mt6750

# Legacy blobs
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/soc/11270000.usb3/musb-hdrc/gadget/lun0/file

# Shims
LINKER_FORCED_SHIM_LIBS := \
    /system/vendor/lib/libui_ext.so|libshim_ui.so \
    /system/vendor/lib64/libui_ext.so|libshim_ui.so \
    /system/vendor/lib/libcam_utils.so|libshim_ui.so \
    /system/vendor/lib64/libcam_utils.so|libshim_ui.so \
    /system/vendor/lib/libMtkOmxVenc.so|libshim_ui.so \
    /system/vendor/lib64/libMtkOmxVenc.so|libshim_ui.so \
    /system/vendor/lib/libgui_ext.so|libshim_gui.so \
    /system/vendor/lib64/libgui_ext.so|libshim_gui.so \
    /system/vendor/bin/thermal|libshim_ifc.so \
    /system/vendor/lib/mtk-ril.so|libshim_ifc.so \
    /system/vendor/lib64/mtk-ril.so|libshim_ifc.so \
    /system/vendor/lib/mtk-rilmd2.so|libshim_ifc.so \
    /system/vendor/lib64/mtk-rilmd2.so|libshim_ifc.so \
    /system/vendor/lib/libprogrambinary.so|libshim_program_binary.so \
    /system/vendor/lib64/libprogrambinary.so|libshim_program_binary.so \
    /system/vendor/lib/libvtmal.so|libshim_vt.so \
    /system/vendor/lib64/libvtmal.so|libshim_vt.so

# inherit from the proprietary version
-include vendor/blackview/BV7000_Pro/BoardConfigVendor.mk
