LOCAL_PATH := $(call my-dir)
include device/linaro/hikey/libmemtrack/Android.mk
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)
LOCAL_MODULE                                       := remove-BlockedNumberProvider
EXECUTABLES.remove-BlockedNumberProvider.OVERRIDES := BlockedNumberProvider
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                             := remove-TeleService
EXECUTABLES.remove-TeleService.OVERRIDES := TeleService
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                            := remove-MmsService
EXECUTABLES.remove-MmsService.OVERRIDES := MmsService
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                         := remove-Telecom
EXECUTABLES.remove-Telecom.OVERRIDES := Telecom
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                         := remove-Bluetooth
EXECUTABLES.remove-Bluetooth.OVERRIDES := Bluetooth
include $(BUILD_PHONY_PACKAGE)
