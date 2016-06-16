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
#include <errno.h>
#include <string>
#include <string.h>

#include <dumpstate.h>
#include <cutils/log.h>
#define LOG_TAG "dumpstate"
#include <cutils/properties.h>
#include <stdlib.h>

/**
 * Dump Wearable node database if present.
 *
 * TODO This function is a temporary solution for Android Wear and should be
 * removed once dumpsys has proper support for adding files to the zip, or
 * moved to a common library.
 */
void dump_wear_nodedb() {
    // we rely on su to workaround selinux permissions in the app data directory
    // so this will only work on userdebug builds
    if (is_user_build()) {
        return;
    }

    std::string tmp_nodedb_path = bugreport_dir + "/wear-nodedb.db";
    std::string wear_nodedb_path = "/data/data/com.google.android.gms/databases/node.db";

    if (run_command("COPY WEAR NODE DB", 600, SU_PATH, "root",
                "cp", wear_nodedb_path.c_str(), tmp_nodedb_path.c_str(), NULL)) {
        MYLOGE("Wear node.db copy failed\n");
        return;
    }
    if (run_command("CHOWN WEAR NODE DB", 600, SU_PATH, "root",
                "chown", "shell:shell", tmp_nodedb_path.c_str(), NULL)) {
        MYLOGE("Wear node.db chown failed\n");
        return;
    }
    if (add_zip_entry(ZIP_ROOT_DIR + wear_nodedb_path, tmp_nodedb_path)) {
        MYLOGD("Wear node.db added to zip file\n");
    } else {
        MYLOGE("Unable to add zip for Wear node.db\n");
    }
    // unconditionally remove the db since it's just a copy
    if (remove(tmp_nodedb_path.c_str())) {
        MYLOGE("Error removing Wear node.db file %s: %s\n",
                tmp_nodedb_path.c_str(), strerror(errno));
    }
}

void dumpstate_board()
{
    char prop_str[PROPERTY_VALUE_MAX];
    int len;
    char *end_ptr;
    unsigned long ret_val = 0;

    dump_file("CPU present", "/sys/devices/system/cpu/present");
    dump_file("CPU online", "/sys/devices/system/cpu/online");
    dump_file("RPM Stats", "/d/rpm_stats");
    dump_file("Power Management Stats", "/d/rpm_master_stats");
    dump_file("SMD Log", "/d/ipc_logging/smd/log");
    run_command("ION HEAPS", 5, SU_PATH, "root", "/system/bin/sh", "-c", "for d in $(ls -d /d/ion/*); do for f in $(ls $d); do echo --- $d/$f; cat $d/$f; done; done", NULL);
    dump_file("dmabuf info", "/d/dma_buf/bufinfo");
    run_command("Temperatures", 5, SU_PATH, "root", "/system/bin/sh", "-c", "for f in `ls /sys/class/thermal` ; do type=`cat /sys/class/thermal/$f/type` ; temp=`cat /sys/class/thermal/$f/temp` ; echo \"$type: $temp\" ; done", NULL);
    dump_file("cpu0-1 time-in-state", "/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state");
    run_command("cpu0-1 cpuidle", 5, SU_PATH, "root", "/system/bin/sh", "-c", "for d in $(ls -d /sys/devices/system/cpu/cpu0/cpuidle/state*); do echo \"$d: `cat $d/name` `cat $d/desc` `cat $d/time` `cat $d/usage`\"; done", NULL);
    dump_file("cpu2-3 time-in-state", "/sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state");
    run_command("cpu2-3 cpuidle", 5, SU_PATH, "root", "/system/bin/sh", "-c", "for d in $(ls -d /sys/devices/system/cpu/cpu2/cpuidle/state*); do echo \"$d: `cat $d/name` `cat $d/desc` `cat $d/time` `cat $d/usage`\"; done", NULL);

    /* Check if smlog_dump tool exist */
    if (!access("/system/bin/smlog_dump", F_OK)) {
        property_get("persist.radio.smlog_switch" ,prop_str,"");
        len = strlen(prop_str);
        if (len > 0) {
            ret_val = strtoul( prop_str, &end_ptr, 0 );
        }

        /* Only SMLOG is enable, and SMLOG DUMP would be excuted */
        if (ret_val == 1) {
            run_command("SMLOG DUMP", 30, SU_PATH, "root", "smlog_dump", "-d", NULL);
        }
    }

    /* Check if qsee_logger tool exists */
    if (!access("/system/bin/qsee_logger", F_OK)) {
        run_command("FP LOGS", 10, "qsee_logger", "-d", NULL);
    }

    dump_wear_nodedb();
};
