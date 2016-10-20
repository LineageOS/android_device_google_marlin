#!/system/bin/sh

################################################################################
# helper functions to allow Android init like script

function write() {
    echo -n $2 > $1
}

function copy() {
    cat $1 > $2
}

################################################################################

# disable thermal hotplug to switch governor
write /sys/module/msm_thermal/core_control/enabled 0

# bring back main cores CPU 0,2
write /sys/devices/system/cpu/cpu0/online 1
write /sys/devices/system/cpu/cpu2/online 1

write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor interactive
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay 19000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load 90
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate 20000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq 960000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 80
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time 19000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis 79000
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 300000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif 0

# EAS: Capping the max frequency of silver core to 1.6GHz
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1593600

write /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor interactive
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/use_sched_load 1
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/use_migration_notif 1
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/above_hispeed_delay "19000 1400000:39000 1700000:39000"

write /sys/devices/system/cpu/cpu2/cpufreq/interactive/go_hispeed_load 90
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/timer_rate 20000
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/hispeed_freq 1248000
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/io_is_busy 1
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads "85 1500000:90 1800000:95"

write /sys/devices/system/cpu/cpu2/cpufreq/interactive/min_sample_time 19000
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/max_freq_hysteresis 39000
write /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq 300000
write /sys/devices/system/cpu/cpu2/cpufreq/interactive/ignore_hispeed_on_notif 0

# if EAS is present, switch to sched governor (no effect if not EAS)
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor "sched"
write /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor "sched"

# re-enable thermal hotplug
write /sys/module/msm_thermal/core_control/enabled 1

# input boost configuration
write /sys/module/cpu_boost/parameters/input_boost_freq "0:1324800 2:1324800"
write /sys/module/cpu_boost/parameters/input_boost_ms 40

# Setting b.L scheduler parameters
write /proc/sys/kernel/sched_boost 0
write /proc/sys/kernel/sched_migration_fixup 1
write /proc/sys/kernel/sched_upmigrate 95
write /proc/sys/kernel/sched_downmigrate 90
write /proc/sys/kernel/sched_freq_inc_notify 400000
write /proc/sys/kernel/sched_freq_dec_notify 400000
write /proc/sys/kernel/sched_spill_nr_run 3
write /proc/sys/kernel/sched_init_task_load 100

# Enable bus-dcvs
for cpubw in /sys/class/devfreq/*qcom,cpubw* ; do
    write $cpubw/governor "bw_hwmon"
    write $cpubw/polling_interval 50
    write $cpubw/min_freq 1525
    write $cpubw/bw_hwmon/mbps_zones "1525 5195 11863 13763"
    write $cpubw/bw_hwmon/sample_ms 4
    write $cpubw/bw_hwmon/io_percent 34
    write $cpubw/bw_hwmon/hist_memory 20
    write $cpubw/bw_hwmon/hyst_length 10
    write $cpubw/bw_hwmon/low_power_ceil_mbps 0
    write $cpubw/bw_hwmon/low_power_io_percent 34
    write $cpubw/bw_hwmon/low_power_delay 20
    write $cpubw/bw_hwmon/guard_band_mbps 0
    write $cpubw/bw_hwmon/up_scale 250
    write $cpubw/bw_hwmon/idle_mbps 1600
done

for memlat in /sys/class/devfreq/*qcom,memlat-cpu* ; do
    write $memlat/governor "mem_latency"
    write $memlat/polling_interval 10
done

# Enable all LPMs by default
# This will enable C4, D4, D3, E4 and M3 LPMs
write /sys/module/lpm_levels/parameters/sleep_disabled N

# On debuggable builds, enable console_suspend if uart is enabled to save power
# Otherwise, disable console_suspend to get better logging for kernel crashes
if [[ $(getprop ro.debuggable) == "1" && ! -e /sys/class/tty/ttyHSL0 ]]
then
    write /sys/module/printk/parameters/console_suspend N
fi
