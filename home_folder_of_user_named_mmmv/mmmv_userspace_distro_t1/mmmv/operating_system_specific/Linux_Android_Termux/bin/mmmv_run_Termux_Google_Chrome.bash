#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
#
# The code example 
am start --user 0 -n com.android.chrome/com.google.android.apps.chrome.Main
# originates from
#
#     https://stackoverflow.com/questions/68619021/start-any-application-through-termux-command-line-for-example-chrome-youtube-an
#     archival copy: https://archive.ph/sdxB4
#
# and supposedly it has a general structure of 
#
#     am start --user 0 -n com.Package.name/activityclass
#
# Supposedly the activity class names of 
# installed applications can be found out by using
# an Android application named "Dev Tools" by Trinea.
# An Android_7 compatible installer of the "Dev Tools"
# MIGHT be found from 
#
#     /home/mmmv/mmmv_userspace_distro_t1/attic/tools/Android_installers/Trinea_Android_Dev_Tools
#
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="1636aa25-800a-4425-b10a-9122e0d096e7"
#==========================================================================
