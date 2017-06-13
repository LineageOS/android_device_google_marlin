#ifndef ANDROID_HARDWARE_USB_V1_0_USB_H
#define ANDROID_HARDWARE_USB_V1_0_USB_H

#include <android/hardware/usb/1.0/IUsb.h>
#include <hidl/MQDescriptor.h>
#include <hidl/Status.h>
#include <utils/Log.h>

#ifdef LOG_TAG
#undef LOG_TAG
#endif

#define LOG_TAG "android.hardware.usb@1.0-service.marlin"
#define UEVENT_MSG_LEN 2048
// The type-c stack waits for 4.5 - 5.5 secs before declaring a port non-pd.
// The -partner directory would not be created until this is done.
// Having a margin of ~3 secs for the directory and other related bookeeping
// structures created and uvent fired.
#define PORT_TYPE_TIMEOUT 8

namespace android {
namespace hardware {
namespace usb {
namespace V1_0 {
namespace implementation {

using ::android::hardware::usb::V1_0::IUsb;
using ::android::hardware::usb::V1_0::IUsbCallback;
using ::android::hardware::usb::V1_0::PortRole;
using ::android::hidl::base::V1_0::IBase;
using ::android::hardware::hidl_array;
using ::android::hardware::hidl_memory;
using ::android::hardware::hidl_string;
using ::android::hardware::hidl_vec;
using ::android::hardware::Return;
using ::android::hardware::Void;
using ::android::sp;

struct Usb : public IUsb {
    Return<void> switchRole(const hidl_string& portName, const PortRole& role) override;
    Return<void> setCallback(const sp<IUsbCallback>& callback) override;
    Return<void> queryPortStatus() override;

    sp<IUsbCallback> mCallback;
    // Protects mCallback variable
    pthread_mutex_t mLock = PTHREAD_MUTEX_INITIALIZER;
    // Protects roleSwitch operation
    pthread_mutex_t mRoleSwitchLock = PTHREAD_MUTEX_INITIALIZER;
    // Threads waiting for the partner to come back wait here
    pthread_cond_t mPartnerCV = PTHREAD_COND_INITIALIZER;
    // lock protecting mPartnerCV
    pthread_mutex_t mPartnerLock = PTHREAD_MUTEX_INITIALIZER;
    // Variable to signal partner coming back online after type switch
    bool mPartnerUp;

    private:
        pthread_t mPoll;
};

}  // namespace implementation
}  // namespace V1_0
}  // namespace usb
}  // namespace hardware
}  // namespace android

#endif  // ANDROID_HARDWARE_USB_V1_0_USB_H
