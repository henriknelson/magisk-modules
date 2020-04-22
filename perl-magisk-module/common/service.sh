#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
#[ -f /data/ssh/no-autostart ] || $MODDIR/system/bin/opensshd start
#mount -o rw,remount /system;
mount -o rw,remount /system/etc;
echo "libperl.so" >> /etc/ld.config.txt;
echo "Fcntl.so" >> /etc/ld.config.txt;
mount -o ro,remount /system/etc;
#mount -o ro,remount /system;
