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
# Bash lines that might come handy:
# 
#     mount -t tmpfs -o size=20m RAM_20MiB_01 /opt/andmekettad/RAM_20MiB_01
#     sync; wait ; 
#     chmod -f -R 1777 /opt/andmekettad/RAM_20MiB_01
# 
# A line for /etc/fstab
# 
#     tmpfs   /opt/andmekettad/RAM_20MiB_01  tmpfs   nodev,size=20M 0 0 
# 
# The command for adding a new cron job for user root: 
# 
#     crontab -e -u root 
# 
# The lines at cron jobs file: 
# 
# ----citation---start------- 
# #  m   h   dom   mon   dow   command
# 
#    *   *    *     *     *    /usr/bin/sync
#    *   *    *     *     *    /usr/bin/bash /root/m_local/etc/cron_job_01_initialisations_stage_1.bash
# 
# ----citation---end--------- 
# 
#--------------------------------------------------------------------------
S_TMP_0="/opt/andmekettad/RAM_1MiB_01/initialization_jobs_are_in_progress_or_done.txt"
if [ ! -e "$S_TMP_0" ]; then
    echo "42" > $S_TMP_0
    sync ; wait ; sync
    S_TMP_1="/root/m_local/etc/cron_job_01_initialisations_stage_2.bash"
    if [ -e "$S_TMP_1" ]; then
        /usr/bin/bash "$S_TMP_1"
    fi
    sync ; wait ; sync
fi

#==========================================================================
# S_VERSION_OF_THIS_FILE="3585bc92-671c-48d0-a250-12c00131a7e7"
#==========================================================================
