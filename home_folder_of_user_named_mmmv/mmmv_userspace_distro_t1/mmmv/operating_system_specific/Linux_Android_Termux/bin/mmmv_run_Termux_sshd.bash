#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------

killall sshd
sync; wait; sync;
sshd -f /data/data/com.termux/files/home/m_local/home_mmmv/mmmv_userspace_distro_t1/mmmv/operating_system_specific/Linux_Android_Termux/etc/sshd_config_for_Termux
sync; wait; sync;
ps -A | grep -i sshd

#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="b82b8a6e-441d-47b2-b546-9313407076e7"
#==========================================================================
