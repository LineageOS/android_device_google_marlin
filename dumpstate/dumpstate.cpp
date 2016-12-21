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
#include <stdlib.h>
#include <string>
#include <cutils/properties.h>

#define LOG_TAG "dumpstate"
#include <cutils/log.h>

#define MODEM_LOG_PREFIX_PROPERTY "ro.radio.log_prefix"
#define MODEM_LOGGING_SWITCH "persist.radio.smlog_switch"

static std::vector<std::string> ril_and_netmgr_logs
                {
                 "/data/misc/radio/ril_log",
                 "/data/misc/radio/ril_log_old",
                 "/data/misc/netmgr/netmgr_log",
                 "/data/misc/netmgr/netmgr_log_old"
                };
static std::string modem_log_folder_name = "modem_log";

static std::string get_property_value (const std::string& property_name) {

    char property[PROPERTY_VALUE_MAX];
    property_get (property_name.c_str(), property, "");

    return property;
}

/*
 * Returns true if the system property `key` has the value "1", "y", "yes",
 * "on", or "true", false for "0", "n", "no", "off", or "false",
 * or `default_value` otherwise.
 */
static bool get_bool_property_value (const std::string& property_name,
                                     bool default_value) {
    std::string value = get_property_value(property_name);
    if (value == "1" || value == "y" || value == "yes" || value == "on" || value == "true") {
        return true;
    } else if (value == "0" || value == "n" || value == "no" || value == "off" || value == "false") {
        return false;
    }
    return default_value;
}

void dumpstate_board()
{
    /* Check if smlog_dump tool exist */
    if (!is_user_build() && !access("/system/bin/smlog_dump", F_OK)) {
        bool modem_logging_enabled = get_bool_property_value (MODEM_LOGGING_SWITCH, false);

        /* Execute SMLOG DUMP if SMLOG is enabled */
        if (modem_logging_enabled && !bugreport_dir.empty()) {
            std::string modem_log_dir = bugreport_dir + "/" + modem_log_folder_name;
            std::string modem_log_mkdir_cmd= "/system/bin/mkdir " + modem_log_dir;
            run_command("MKDIR MODEM LOG", 5, SU_PATH, "root", "/system/bin/sh", "-c",
                        modem_log_mkdir_cmd.c_str(), NULL);
            run_command("SMLOG DUMP", 120, SU_PATH, "root", "smlog_dump", "-d",
                        "-o", modem_log_dir.c_str(), NULL);
            for(unsigned int i = 0; i < ril_and_netmgr_logs.size(); i++)
            {
              std::string copy_cmd= "/system/bin/cp " + ril_and_netmgr_logs[i] + " " + modem_log_dir;
              run_command("MV RIL LOG", 20, SU_PATH, "root", "/system/bin/sh", "-c", copy_cmd.c_str(), NULL);
            }
            // Remove smlogs older than 10 days
            std::string file_prefix = get_property_value (MODEM_LOG_PREFIX_PROPERTY);
            if (!file_prefix.empty()) {
                std::string remove_command = "/system/bin/find " +
                    bugreport_dir + "/" + file_prefix + "* -mtime +10 -delete";
                MYLOGD("Removing old logs using command %s\n", remove_command.c_str());
                run_command("RM OLD SMLOG", 5, SU_PATH,
                            "root", "/system/bin/sh", "-c", remove_command.c_str(), NULL);
            }
            std::string modem_log_combined = bugreport_dir + "/" + file_prefix + "all.tar.gz";
            std::string modem_log_gzip_cmd= "/system/bin/tar czvf " + modem_log_combined + " -C" + modem_log_dir + " .";
            run_command("GZIP LOG", 5, SU_PATH, "root", "/system/bin/sh", "-c",
                        modem_log_gzip_cmd.c_str(), NULL);
            std::string modem_log_perm_cmd= "/system/bin/chmod a+rw " + modem_log_combined;
            run_command("CHG PERM", 5, SU_PATH, "root", "/system/bin/sh", "-c",
                        modem_log_perm_cmd.c_str(), NULL);
            std::string modem_log_clear_cmd= "/system/bin/rm -r " + modem_log_dir;
            run_command("RM MODEM DIR", 5, SU_PATH, "root", "/system/bin/sh", "-c",
                        modem_log_clear_cmd.c_str(), NULL);
        }
        run_command("RM OLD SMLOG", 5, SU_PATH, "root", "/system/bin/sh", "-c",
                    "/system/bin/find /data/smlog_* -delete", NULL);
    }

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

    /* Check if qsee_logger tool exists */
    if (!access("/system/bin/qsee_logger", F_OK)) {
        run_command("FP LOGS", 10, "qsee_logger", "-d", NULL);
    }
};
