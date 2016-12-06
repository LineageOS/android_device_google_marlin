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

#include <dumpstate.h>
#include <cutils/properties.h>
#include <stdlib.h>

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
    dump_file("MDP xlogs", "/d/mdp/xlog/dump");

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
};
