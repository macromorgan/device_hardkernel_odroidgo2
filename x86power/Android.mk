#
# Copyright (C) 2016 The Android-x86 Open Source Project
#
# Licensed under the GNU General Public License Version 2 or later. You may not use this file except in compliance with the License. You may obtain a copy of the License at
#
#      http://www.gnu.org/licenses/gpl.html
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := power.x86
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := power.c
LOCAL_SHARED_LIBRARIES := liblog libcutils
#LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
