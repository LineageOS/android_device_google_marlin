/*
 * Copyright (C) 2018 The Android Open Source Project
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
#define LOG_TAG "android.hardware.health@2.1-impl-m1s1"
#include <android-base/logging.h>

#include <android/hardware/health/2.0/types.h>
#include <health2impl/Health.h>
#include <health/utils.h>
#include <hal_conversion.h>

#include <android-base/file.h>
#include <android-base/strings.h>

#include <vector>
#include <string>

#include <sys/stat.h>

#include "CycleCountBackupRestore.h"
#include "LearnedCapacityBackupRestore.h"

namespace {

using namespace std::literals;

using android::hardware::health::V1_0::hal_conversion::convertFromHealthInfo;
using android::hardware::health::V1_0::hal_conversion::convertToHealthInfo;
using android::hardware::health::V2_0::DiskStats;
using android::hardware::health::V2_0::StorageInfo;
using android::hardware::health::V2_0::Result;
using ::android::hardware::health::V2_1::IHealth;
using android::hardware::health::InitHealthdConfig;
using ::device::google::marlin::health::CycleCountBackupRestore;
using ::device::google::marlin::health::LearnedCapacityBackupRestore;

static constexpr int kBackupTrigger = 20;
static constexpr size_t kDiskStatsSize = 11;
static constexpr char kUFSHealthFile[] = "/sys/devices/soc/624000.ufshc/health";
static constexpr char kUFSHealthVersionFile[] = "/sys/kernel/debug/ufshcd0/show_hba";
static constexpr char kUFSName[] = "UFS0";
static constexpr char kDiskStatsFile[] = "/sys/block/sda/stat";

static CycleCountBackupRestore ccBackupRestore;
static LearnedCapacityBackupRestore lcBackupRestore;

int cycle_count_backup(int battery_level)
{
    static int saved_soc = 0;
    static int soc_inc = 0;
    static bool is_first = true;

    if (is_first) {
        is_first = false;
        saved_soc = battery_level;
        return 0;
    }

    if (battery_level > saved_soc) {
        soc_inc += battery_level - saved_soc;
    }

    saved_soc = battery_level;

    if (soc_inc >= kBackupTrigger) {
        ccBackupRestore.Backup();
        soc_inc = 0;
    }
    return 0;
}

void private_healthd_board_init(struct healthd_config*)
{
    ccBackupRestore.Restore();
    lcBackupRestore.Restore();
}

int private_healthd_board_battery_update(struct android::BatteryProperties *props)
{
    cycle_count_backup(props->batteryLevel);
    lcBackupRestore.Backup();
    return 0;
}

/*
 * Implementation based on system/core/storaged/storaged_info.cc
 */
void private_get_storage_info(std::vector<StorageInfo>& vec_storage_info) {
    StorageInfo storage_info = {};
    std::string buffer, version;

    storage_info.attr.isInternal = true;
    storage_info.attr.isBootDevice = true;
    storage_info.attr.name = std::string(kUFSName);

    if (!android::base::ReadFileToString(std::string(kUFSHealthVersionFile), &version)) {
        return;
    }

    std::vector<std::string> lines = android::base::Split(version, "\n");
    if (lines.empty()) {
        return;
    }

    char rev[8];
    if (sscanf(lines[6].c_str(), "ufs version: 0x%7s\n", rev) < 1) {
        return;
    }

    storage_info.version = "ufs " + std::string(rev);

    if (!android::base::ReadFileToString(std::string(kUFSHealthFile), &buffer)) {
        return;
    }

    lines = android::base::Split(buffer, "\n");
    if (lines.empty()) {
        return;
    }

    for (const auto& line : lines) {
        char token[32];
        uint16_t val;
        int ret;
        if ((ret = sscanf(line.c_str(),
                   "Health Descriptor[Byte offset 0x%*d]: %31s = 0x%hx",
                   token, &val)) < 2) {
            continue;
        }

        if (std::string(token) == "bPreEOLInfo") {
            storage_info.eol = val;
        } else if (std::string(token) == "bDeviceLifeTimeEstA") {
            storage_info.lifetimeA = val;
        } else if (std::string(token) == "bDeviceLifeTimeEstB") {
            storage_info.lifetimeB = val;
        }
    }

    vec_storage_info.resize(1);
    vec_storage_info[0] = storage_info;
    return;
}

/*
 * Implementation based on parse_disk_stats() in system/core/storaged_diskstats.cpp
 */
void private_get_disk_stats(std::vector<DiskStats>& vec_stats) {
    const size_t kDiskStatsSize = 11;
    struct DiskStats stats = {};

    stats.attr.isInternal = true;
    stats.attr.isBootDevice = true;
    stats.attr.name = std::string(kUFSName);

    std::string buffer;
    if (!android::base::ReadFileToString(std::string(kDiskStatsFile), &buffer)) {
        LOG(ERROR) << kDiskStatsFile << ": ReadFileToString failed.";
        return;
    }

    // Regular diskstats entries
    std::stringstream ss(buffer);
    for (uint i = 0; i < kDiskStatsSize; i++) {
        ss >> *(reinterpret_cast<uint64_t*>(&stats) + i);
    }
    vec_stats.resize(1);
    vec_stats[0] = stats;

    return;
}
}  // anonymous namespace

namespace android {
namespace hardware {
namespace health {
namespace V2_1 {
namespace implementation {
class HealthImpl : public Health {
 public:
  HealthImpl(std::unique_ptr<healthd_config>&& config)
    : Health(std::move(config)) {}

  Return<void> getStorageInfo(getStorageInfo_cb _hidl_cb) override;
  Return<void> getDiskStats(getDiskStats_cb _hidl_cb) override;

 protected:
  void UpdateHealthInfo(HealthInfo* health_info) override;

};

void HealthImpl::UpdateHealthInfo(HealthInfo* health_info) {
  struct BatteryProperties props;
  convertFromHealthInfo(health_info->legacy.legacy, &props);
  private_healthd_board_battery_update(&props);
  convertToHealthInfo(&props, health_info->legacy.legacy);
}

Return<void> HealthImpl::getStorageInfo(getStorageInfo_cb _hidl_cb)
{
  std::vector<struct StorageInfo> info;
  private_get_storage_info(info);
  hidl_vec<struct StorageInfo> info_vec(info);
  if (!info.size()) {
      _hidl_cb(Result::NOT_SUPPORTED, info_vec);
  } else {
      _hidl_cb(Result::SUCCESS, info_vec);
  }
  return Void();
}

Return<void> HealthImpl::getDiskStats(getDiskStats_cb _hidl_cb)
{
  std::vector<struct DiskStats> stats;
  private_get_disk_stats(stats);
  hidl_vec<struct DiskStats> stats_vec(stats);
  if (!stats.size()) {
      _hidl_cb(Result::NOT_SUPPORTED, stats_vec);
  } else {
      _hidl_cb(Result::SUCCESS, stats_vec);
  }
  return Void();
}

}  // namespace implementation
}  // namespace V2_1
}  // namespace health
}  // namespace hardware
}  // namespace android

extern "C" IHealth* HIDL_FETCH_IHealth(const char* instance) {
  using ::android::hardware::health::V2_1::implementation::HealthImpl;
  if (instance != "default"sv) {
      return nullptr;
  }
  auto config = std::make_unique<healthd_config>();
  InitHealthdConfig(config.get());

  private_healthd_board_init(config.get());

  return new HealthImpl(std::move(config));
}
