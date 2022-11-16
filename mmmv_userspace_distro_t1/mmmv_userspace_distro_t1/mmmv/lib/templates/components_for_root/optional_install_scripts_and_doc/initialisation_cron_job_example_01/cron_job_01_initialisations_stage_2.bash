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

#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="36e7af35-2477-405e-9536-92339030c5e7"
#==========================================================================
