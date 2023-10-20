#!/bin/bash
#==========================================================================
# The "#!/usr/bin/env bash" would also work at the first line, but
# as this script is run by root, then it is probably 
# safer to use a direct path.
#--------------------------------------------------------------------------
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
# Relevant commands: lsblk, blkid

S_TMP_0="/sys/block/sda/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    echo "deadline" > $S_TMP_0
fi

S_TMP_0="/sys/block/sdb/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    echo "deadline" > $S_TMP_0
fi

S_TMP_0="/sys/block/sdc/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    echo "deadline" > $S_TMP_0
fi

S_TMP_0="/sys/block/sdd/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    echo "deadline" > $S_TMP_0
fi

S_TMP_0="/sys/block/sde/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    echo "deadline" > $S_TMP_0
fi

S_TMP_0="/sys/block/sdf/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    echo "deadline" > $S_TMP_0
fi

S_TMP_0="/sys/block/sdg/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    echo "deadline" > $S_TMP_0
fi

sync ; wait; sync
#--------------------------------------------------------------------------
/usr/bin/nice -n 5 /usr/sbin/nilfs-clean --suspend
#nice -n 20 /usr/sbin/nilfs-clean /dev/midagi
#nice -n 21 /usr/sbin/nilfs-clean /dev/sdc1
#nice -n 21 /usr/sbin/nilfs-clean /dev/sdd1
#nice -n 21 /usr/sbin/nilfs-clean /dev/sde1
sync ; wait; sync
/usr/bin/sleep 2
sync ; wait; sync
#--------------------------------------------------------------------------

func_init_renice_processes_according_to_their_name_t1(){
    local S_TMP_0="`/usr/bin/uname -a | /usr/bin/grep -i Linux `"
    if [ "$S_TMP_0" != "" ]; then
        if [ "`/usr/bin/which gawk 2> /dev/null`" != "" ]; then
            if [ "`/usr/bin/which grep 2> /dev/null`" != "" ]; then
                #/usr/bin/nice -n 2 /usr/bin/renice -n 19 -p `ps -A | /usr/bin/grep fluidsynth | /usr/bin/gawk '{print $1}'` ;
                /usr/bin/nice -n 2 /usr/bin/renice -n 10 -p `/usr/bin/ps -A | /usr/bin/grep ioq3ded    | /usr/bin/gawk '{print $1}'` ;
                /usr/bin/nice -n 2 /usr/bin/renice -n 5  -p `/usr/bin/ps -A | /usr/bin/grep ksmserver  | /usr/bin/gawk '{print $1}'` ;
                /usr/bin/nice -n 2 /usr/bin/renice -n 12 -p `/usr/bin/ps -A | /usr/bin/grep nscd    | /usr/bin/gawk '{print $1}'` ;
                /usr/bin/nice -n 2 /usr/bin/renice -n 18 -p `/usr/bin/ps -A | /usr/bin/grep updatedb.plocat  | /usr/bin/gawk '{print $1}'` ;
                /usr/bin/nice -n 2 /usr/bin/renice -n 21 -p `/usr/bin/ps -A | /usr/bin/grep nilfs_cleanerd   | /usr/bin/gawk '{print $1}'` ;
                /usr/bin/nice -n 2 /usr/bin/renice -n 21 -p `/usr/bin/ps -A | /usr/bin/grep updatedb         | /usr/bin/gawk '{print $1}'` ;
                sync ; wait; sync
            fi
        fi
    fi
} # func_init_renice_processes_according_to_their_name_t1
func_init_renice_processes_according_to_their_name_t1

#--------------------------------------------------------------------------

func_init_mount_USB_HDD_if_not_yet_mounted_magnet_USB_5koma4TiB_01_NilFS2(){
    local S_FP_MOUNTPOINT="/opt/andmekettad/magnet_USB_5koma4TiB_01_NilFS2"
    #----------------------------------------
    local S_DEVFILE_NAME="not_yet_set"
    local S_TMP_0="subject_to_further_initialization"
    #----------------------------------------
    if [ -e "$S_FP_MOUNTPOINT" ]; then
        if [ -d "$S_FP_MOUNTPOINT" ]; then
            #----------------------------------------
            S_DEVFILE_NAME="`/usr/sbin/blkid | /usr/bin/grep 'USB_Seagate_5dot4TiB' | /usr/bin/grep '23c540d1-342b-4de5-a27a-82c00131a7e7' | /usr/bin/sed -e 's/^\/dev\///g' | /usr/bin/sed -e 's/:.\+//g' `"
            if [ "$S_DEVFILE_NAME" != "" ]; then
                S_TMP_0="`/usr/bin/df | /usr/bin/grep $S_DEVFILE_NAME `"
                if [ "$S_TMP_0" == "" ]; then # not yet mounted
                    /usr/bin/mount -o noatime,nodiratime "/dev/$S_DEVFILE_NAME" "$S_FP_MOUNTPOINT"
                fi
            fi
            #----------------------------------------
        fi
    fi
} # func_init_mount_USB_HDD_if_not_yet_mounted_magnet_USB_5koma4TiB_01_NilFS2
func_init_mount_USB_HDD_if_not_yet_mounted_magnet_USB_5koma4TiB_01_NilFS2

#--------------------------------------------------------------------------

func_init_01_SB_WRITE_TO_FILE(){
    local SB_FILE_PATH="$1"
    SB_WRITE_TO_FILE="f"
    if [ -e "$SB_FILE_PATH" ]; then
        if [ ! -d "$SB_FILE_PATH" ]; then # not a folder
            if [ "`/usr/bin/ls $SB_FILE_PATH --size -l | /usr/bin/gawk '{print $1}'`" == "0" ]; then # is an empty file
                SB_WRITE_TO_FILE="t"
            fi
        fi
    else
        if [ -h "$SB_FILE_PATH" ]; then # a broken symlink
            rm -f $SB_FILE_PATH
            wait ; sync ; wait
        fi
        SB_WRITE_TO_FILE="t"
    fi
} # func_init_01_SB_WRITE_TO_FILE

#--------------------------------------------------------------------------

func_init_list_of_name_servers(){
    local S_TMP_0="/etc/resolv.conf"
    func_init_01_SB_WRITE_TO_FILE "$S_TMP_0"
    if [ "$SB_WRITE_TO_FILE" == "t" ]; then
        echo "nameserver 85.196.241.186" >> $S_TMP_0
        echo "nameserver 212.7.2.66" >> $S_TMP_0
        echo "nameserver 89.235.196.2" >> $S_TMP_0
        echo "nameserver 46.226.143.86" >> $S_TMP_0
        echo "nameserver 195.80.119.99" >> $S_TMP_0
        echo "nameserver 46.226.143.83" >> $S_TMP_0
        echo "nameserver 8.8.8.8" >> $S_TMP_0
        echo "nameserver 1.1.1.1" >> $S_TMP_0
        echo "nameserver 9.9.9.9" >> $S_TMP_0
        echo "nameserver 149.112.112.112" >> $S_TMP_0
        wait ; sync ; wait
        chown root $S_TMP_0
        chmod 0755 $S_TMP_0
        wait ; sync ; wait
    fi
} # func_init_list_of_name_servers
func_init_list_of_name_servers

#--------------------------------------------------------------------------

func_init_keyboard_t1(){
    local S_TMP_0="/etc/X11/xorg.conf.d/00-keyboard.conf"
    func_init_01_SB_WRITE_TO_FILE "$S_TMP_0"
    if [ "$SB_WRITE_TO_FILE" == "t" ]; then
        echo "# Read and parsed by systemd-localed. It's probably wise not to edit this file" >> $S_TMP_0
        echo "# manually too freely." >> $S_TMP_0
        echo "" >> $S_TMP_0
        echo "Section \"InputClass\"" >> $S_TMP_0
        echo "        Identifier \"system-keyboard\"" >> $S_TMP_0
        echo "        MatchIsKeyboard \"on\"" >> $S_TMP_0
        echo "        Option \"XkbLayout\" \"us,ee\"" >> $S_TMP_0
        echo "        Option \"XkbOptions\" \"grp:ctrl_shift_toggle\"" >> $S_TMP_0
        echo "EndSection" >> $S_TMP_0
        echo "" >> $S_TMP_0
        wait ; sync ; wait
        chown root $S_TMP_0
        chmod 0755 $S_TMP_0
        wait ; sync ; wait
    fi
} # func_init_keyboard_t1
func_init_keyboard_t1

#==========================================================================
# S_VERSION_OF_THIS_FILE="547f06d6-cd6e-4f61-bd7a-82c00131a7e7"
#==========================================================================
