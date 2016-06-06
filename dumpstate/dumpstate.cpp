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
