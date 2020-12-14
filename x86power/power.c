/*
 *
 * Copyright (C) 2016 The Android-x86 Open Source Project
 *
 * Licensed under the GNU General Public License Version 2 or later.
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.gnu.org/licenses/gpl.html
 *
 *
 */
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define LOG_TAG "PowerHAL"
#include <utils/Log.h>

#include <hardware/hardware.h>
#include <hardware/power.h>
#include <cutils/properties.h>
#include <cutils/probe_module.h>

extern int delete_module(const char *, unsigned int);

#define SYS_CPU "/sys/devices/system/cpu"
#define CPU_ONLINE "1"
#define CPU_OFFLINE "0"

#define UNUSED __attribute__((__unused__))

static void set_nonboot_cpu_state(const char *state)
{
    static int cpu_n_fd;
    char p[PATH_MAX];
    int cpu_n;

    for (cpu_n = 1; ; cpu_n++) {
        snprintf(p, PATH_MAX, SYS_CPU "/cpu%d/online", cpu_n);
        cpu_n_fd = open(p, O_RDWR);
        if (cpu_n_fd < 0) {
            return;
        }
        ALOGV("Set CPU%d_online state %s ", cpu_n, state);
        write(cpu_n_fd, state, 1);
        close(cpu_n_fd);
    }
}

static void power_init(struct power_module *module UNUSED)
{
}

static void power_set_interactive(struct power_module *module UNUSED, int on)
{
    char mod[PROPERTY_VALUE_MAX];
    if (!property_get_bool("wlan.no-unload-driver", 0)
            && property_get("wlan.modname", mod, NULL)) {
        if (on) {
            if (insmod_by_dep(mod, "", NULL, 0, NULL)) {
                ALOGE("insmod %s failed", mod);
            } else {
                ALOGD("reload %s OK", mod);
            }
        } else {
            if (delete_module(mod, O_NONBLOCK)) {
                ALOGE("rmmod %s failed", mod);
            } else {
                ALOGD("unload %s OK", mod);
            }
        }
    }

    if (property_get_bool("power.nonboot-cpu-off", 1)) {
        set_nonboot_cpu_state(on ? CPU_ONLINE : CPU_OFFLINE);
    }
}

static void power_hint(struct power_module *module UNUSED, power_hint_t hint, void *data UNUSED)
{
    switch (hint) {
    default:
        break;
    }
}

static struct hw_module_methods_t power_module_methods = {
    .open = NULL,
};

struct power_module HAL_MODULE_INFO_SYM = {
    .common = {
        .tag = HARDWARE_MODULE_TAG,
        .module_api_version = POWER_MODULE_API_VERSION_0_2,
        .hal_api_version = HARDWARE_HAL_API_VERSION,
        .id = POWER_HARDWARE_MODULE_ID,
        .name = "x86 Power HAL",
        .author = "The Android-x86 Project",
        .methods = &power_module_methods,
    },

    .init = power_init,
    .setInteractive = power_set_interactive,
    .powerHint = power_hint,
};
