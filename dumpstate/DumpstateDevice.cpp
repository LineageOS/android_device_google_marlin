/*
 * Copyright 2016 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "dumpstate"

#include "DumpstateDevice.h"

#include <android-base/properties.h>
#include <cutils/properties.h>
#include <libgen.h>
#include <log/log.h>
#include <stdlib.h>
#include <string>

#include "DumpstateUtil.h"

#define MODEM_LOG_PREFIX_PROPERTY "ro.radio.log_prefix"
#define MODEM_LOGGING_SWITCH "persist.radio.smlog_switch"

using android::os::dumpstate::CommandOptions;
using android::os::dumpstate::DumpFileToFd;
using android::os::dumpstate::PropertiesHelper;
using android::os::dumpstate::RunCommandToFd;

namespace android {
namespace hardware {
namespace dumpstate {
namespace V1_0 {
namespace implementation {

namespace {

static void getModemLogs(int fd)
{
    bool modemLogsEnabled = 0;

    /* Check if smlog_dump tool exist */
    if (!PropertiesHelper::IsUserBuild() && !access("/system/bin/smlog_dump", F_OK)) {
        modemLogsEnabled = android::base::GetBoolProperty(MODEM_LOGGING_SWITCH, false);

        /* Execute SMLOG DUMP if SMLOG is enabled */
        if (modemLogsEnabled) {
            // TODO: uses a temporary path instead
            std::string bugreportDir = "/bugreports";
            CommandOptions options = CommandOptions::WithTimeout(120).AsRoot().Build();
            RunCommandToFd(fd, "SMLOG DUMP", { "smlog_dump", "-d", "-o", bugreportDir.c_str() }, options);

            // Remove smlog folders older than 10 days.
            std::string filePrefix = android::base::GetProperty(MODEM_LOG_PREFIX_PROPERTY, "");
            if (!filePrefix.empty()) {

                std::string removeCommand = "/system/bin/find " +
                    bugreportDir + "/" + filePrefix + "* -mtime +10 -delete";

                RunCommandToFd(fd, "RM OLD SMLOG",
                              { "/system/bin/sh", "-c", removeCommand.c_str()},
                              CommandOptions::AS_ROOT);
            }
        }
        RunCommandToFd(fd, "RM OLD SMLOG",
                      { "/system/bin/sh", "-c", "/system/bin/find /data/smlog_* -delete" },
                      CommandOptions::AS_ROOT);
    }
}

} // unnamed namespace


// Methods from ::android::hardware::dumpstate::V1_0::IDumpstateDevice follow.
Return<void> DumpstateDevice::dumpstateBoard(const hidl_handle& handle) {
    if (handle->numFds < 1) {
        ALOGE("no FDs\n");
        return Void();
    }

    int fd = handle->data[0];
    if (fd < 0) {
        ALOGE("invalid FD: %d\n", handle->data[0]);
        return Void();
    }

    getModemLogs(fd);
    DumpFileToFd(fd, "CPU present", "/sys/devices/system/cpu/present");
    DumpFileToFd(fd, "CPU online", "/sys/devices/system/cpu/online");
    DumpFileToFd(fd, "RPM Stats", "/d/rpm_stats");
    DumpFileToFd(fd, "Power Management Stats", "/d/rpm_master_stats");
    DumpFileToFd(fd, "SMD Log", "/d/ipc_logging/smd/log");
    RunCommandToFd(fd, "ION HEAPS", {"/system/bin/sh", "-c", "for d in $(ls -d /d/ion/*); do for f in $(ls $d); do echo --- $d/$f; cat $d/$f; done; done"}, CommandOptions::AS_ROOT);
    DumpFileToFd(fd, "dmabuf info", "/d/dma_buf/bufinfo");
    RunCommandToFd(fd, "Temperatures", {"/system/bin/sh", "-c", "for f in `ls /sys/class/thermal` ; do type=`cat /sys/class/thermal/$f/type` ; temp=`cat /sys/class/thermal/$f/temp` ; echo \"$type: $temp\" ; done"}, CommandOptions::AS_ROOT);
    DumpFileToFd(fd, "cpu0-1 time-in-state", "/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state");
    RunCommandToFd(fd, "cpu0-1 cpuidle", {"/system/bin/sh", "-c", "for d in $(ls -d /sys/devices/system/cpu/cpu0/cpuidle/state*); do echo \"$d: `cat $d/name` `cat $d/desc` `cat $d/time` `cat $d/usage`\"; done"}, CommandOptions::AS_ROOT);
    DumpFileToFd(fd, "cpu2-3 time-in-state", "/sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state");
    RunCommandToFd(fd, "cpu2-3 cpuidle", {"/system/bin/sh", "-c", "for d in $(ls -d /sys/devices/system/cpu/cpu2/cpuidle/state*); do echo \"$d: `cat $d/name` `cat $d/desc` `cat $d/time` `cat $d/usage`\"; done"}, CommandOptions::AS_ROOT);
    DumpFileToFd(fd, "MDP xlogs", "/d/mdp/xlog/dump");
    RunCommandToFd(fd, "RAMDUMP LIST", {"/system/bin/sh", "-c", "cat /data/data/com.android.ramdump/files/RAMDUMP_LIST"}, CommandOptions::AS_ROOT);

    /* Check if qsee_logger tool exists */
    if (!access("/system/bin/qsee_logger", F_OK)) {
      RunCommandToFd(fd, "FP LOGS", {"qsee_logger", "-d"});
    }

    return Void();
};

}  // namespace implementation
}  // namespace V1_0
}  // namespace dumpstate
}  // namespace hardware
}  // namespace android
