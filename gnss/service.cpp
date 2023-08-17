#define LOG_TAG "android.hardware.gnss@1.0-service"

#include <android/hardware/gnss/1.0/IGnss.h>

#include <hidl/LegacySupport.h>

#include <binder/ProcessState.h>

using android::hardware::gnss::V1_0::IGnss;
using android::hardware::defaultPassthroughServiceImplementation;

int main() {

    return defaultPassthroughServiceImplementation<IGnss>();
}
