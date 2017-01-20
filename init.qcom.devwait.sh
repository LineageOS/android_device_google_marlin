#!/system/bin/sh

up="$1"

while [ "$up" != "1" ]
do
    sleep 0.1
    up="`getprop sys.qcom.devup`"
done
