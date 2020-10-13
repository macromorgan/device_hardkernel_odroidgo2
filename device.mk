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

$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

TARGET_PREBUILT_KERNEL := device/hardkernel/odroidgo2/kernel/Image
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
PRODUCT_AAPT_PREBUILT_DPI := mdpi ldpi
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
PRODUCT_PACKAGES += \
	libEGL_swiftshader \
	libGLESv1_CM_swiftshader \
	libGLESv2_swiftshader \
#Need for Pixelflinger I guess
PRODUCT_PACKAGES += \
	android.hardware.configstore@1.1-service

#Open Source hwcomposer/gralloc
PRODUCT_PACKAGES += \
	libGLES_mesa \
	hwcomposer.drm \
	gralloc.gbm \
#Most of these don't stick for some reason?
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=150 \
	ro.hardware.gralloc=gbm \
	ro.hardware.hwcomposer=drm \
	debug.sf.no_hw_vsync=1 \
	hwc.drm.use_framebuffer_target=1 \
	hwc.drm.use_overlay_planes=0 \
	ro.opengles.version=196608 \
	persist.demo.rotationlock=1

#Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software \

PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl \

PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service \
    android.hardware.health@2.0-impl-default \

PRODUCT_PACKAGES += \
    memtrack.default \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl

# PowerHAL
#PRODUCT_PACKAGES += \
#    power.default \
#    android.hardware.power@1.0-impl \
#    android.hardware.power@1.0-service \

#Audio Stuff
PRODUCT_PACKAGES += \
	audio.primary.$(TARGET_PRODUCT) \
	audio.usb.default \
	audio.r_submix.default \
	libaudioroute \
	libaudio-resampler \
	tinyplay \
	tinymix \
	tinycap \
	tinypcminfo \
	android.hardware.audio@2.0-service \
	android.hardware.audio@5.0-impl \
	android.hardware.audio@5.0 \
	android.hardware.audio.effect@5.0-impl \
	android.hardware.soundtrigger@2.2-impl \
	android.hardware.soundtrigger@2.0
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_PROPERTY_OVERRIDES += \
	aaudio.mmap_policy=2 \
	aaudio.mmap_exclusive_policy=2
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
	$(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
	$(LOCAL_PATH)/configs/audio/asound.conf:$(TARGET_COPY_OUT_VENDOR)/etc/asound.conf \
	$(LOCAL_PATH)/configs/audio/asound.state:$(TARGET_COPY_OUT_VENDOR)/etc/asound.state \
	frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
	frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
	frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml


# Copy media codecs crap
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_c2.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/configs/seccomp/mediaswcodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaswcodec.policy \
	$(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.1-impl \
    android.hardware.drm@1.1-service \
    android.hardware.drm@1.2-service.clearkey \
    android.hardware.drm@1.2-service.widevine

PRODUCT_PACKAGES += libGLES_android

#OMX
PRODUCT_PACKAGES += \
	android.hardware.media.omx@1.0-service \
PRODUCT_PACKAGES += \
	libc2dcolorconvert \
	libextmedia_jni \
	libmm-omxcore \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxCore \
	libOmxEvrcEnc \
	libOmxG711Enc \
	libOmxQcelp13Enc \
	libOmxVdec \
	libOmxVenc \
	minijail0

#PRODUCT_PACKAGES += \
#    bootctrl.default \
#    android.hardware.boot@1.1-impl \
#    android.hardware.boot@1.1-service \

#Mesa not working yet
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=150 \
	ro.surface_flinger.primary_display_orientation=ORIENTATION_270 \
	ro.hardware.egl=swiftshader \
	debug.sf.nobootanimation=0

PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/fstab.odroidgo2:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.odroidgo2 \
	$(LOCAL_PATH)/fstab.odroidgo2:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.odroidgo2

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init.odroidgo2.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.odroidgo2.rc \
	$(LOCAL_PATH)/ueventd.odroidgo2.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc


DEVICE_PACKAGE_OVERLAYS := device/linaro/hikey/overlay

# Wifi Stuff
PRODUCT_PACKAGES += \
	libwpa_client \
	wpa_supplicant \
	wpa_supplicant.conf \
	android.hardware.wifi.supplicant@1.3-service \
	hostapd \
	hostapd.conf \
	android.hardware.wifi.hostapd@1.2-service \
	wificond \
	wifilogd
PRODUCT_PROPERTY_OVERRIDES += \
	ro.carrier=wifi-only
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15 \
	ro.boot.wificountrycode=US \
	wifi.direct.interface=p2p0

# Copy hardware config file(s)
PRODUCT_COPY_FILES +=  \
	frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml \
        device/linaro/hikey/etc/permissions/android.software.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.xml \
	frameworks/native/data/etc/android.software.autofill.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.autofill.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
        frameworks/native/data/etc/android.software.cts.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.cts.xml \
        frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
        frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
        frameworks/native/data/etc/android.software.voice_recognizers.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.voice_recognizers.xml \
        frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
        frameworks/native/data/etc/android.hardware.gamepad.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.gamepad.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.device_admin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_admin.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
	Launcher3Go \
	vndk_package

#No Bluetooth
PRODUCT_PACKAGES += \
    remove-Bluetooth

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

#Non Phone Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=yes \
	ro.lockscreen.disable.default=true

#Debug Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
	persist.adb.tcp.port=5037

#Speed Tweaks
#PRODUCT_PROPERTY_OVERRIDES += \
#	ro.kernel.android.checkjni=0 \
#	persist.sys.zram_enabled=1 \
#	persist.sys.purgeable_assets=1 \
#	debug.atrace.tags.enableflags=0 \
#	debugtool.anrhistory=0 \
#	profiler.debugmonitor=false \
#	profiler.launch=false \
#	profiler.hung.dumpdobugreport=false \
#	persist.service.pcsync.enable=0 \
#	persist.service.lgospd.enable=0 \
#	pm.dexopt.downgrade_after_inactive_days=10

#Stuff we don't need
PRODUCT_PROPERTY_OVERRIDES += \
	config.disable_rtt=true \
	config.disable_bluetooth=true \
	config.disable_vrmanager=true \
	config.disable_consumerir=true \
	config.disable_cameraservice=true

#Why the fuck do I need this?
PRODUCT_PACKAGES += \
	android.hardware.cas@1.2

# Disable Scudo outside of eng builds to save RAM.
PRODUCT_DISABLE_SCUDO := true
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

#This causes a mm kernel panic for some reason at boot, but saves RAM
PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
