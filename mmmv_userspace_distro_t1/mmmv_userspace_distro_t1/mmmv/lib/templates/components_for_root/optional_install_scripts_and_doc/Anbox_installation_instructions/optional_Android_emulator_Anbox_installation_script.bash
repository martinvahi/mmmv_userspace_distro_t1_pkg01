#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
#==========================================================================
# S_VERSION_OF_THIS_FILE="3f84b5e6-af7a-4044-9280-a191401095e7"
S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------
if [ "`uname -a | grep -i Linux `" == "" ]; then
    echo ""
    echo "This script is Linux specific."
    echo "GUID='73e15ac1-adbf-4bde-af80-a191401095e7'"
    echo ""
    exit 1 # exit with an error as expected here
fi
if [ "`whoami`" != "root" ]; then
    echo ""
    echo "This script is expected to be executed as root."
    echo "GUID='de84841f-d5b2-436a-8480-a191401095e7'"
    echo ""
    exit 1 # exit with an error as expected here
fi

#--------------------------------------------------------------------------

func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
} # func_mmmv_wait_and_sync_t1

#--------------------------------------------------------------------------
func_mmmv_assert_error_code_zero_t1(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo "The Bash code that calls this function is flawed."
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "Aborting script."
        echo "GUID=='c2a20715-85b7-4676-a180-a191401095e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
    # If the "$?" were evaluated in this function, 
    # then it would be "0" even, if it is
    # something else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo "Something went wrong. Error code: $S_ERR_CODE"
        echo "Aborting script."
        echo "GUID=='aa5e2b59-ac43-4edf-8580-a191401095e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_exc_intro_message(){
    echo ""
    echo "To keep this script as simple as possible, it is "
    echo "meant to be executed by manually uncommenting and "
    echo "commenting the individual lines, starting "
    echo "with the line that calls the function that "
    echo "displays this greeting. "
    echo "GUID='557d2a4d-61f8-4627-b480-a191401095e7'"
    echo ""
    exit 1 # exit with an error as expected here
} # func_exc_intro_message

#--------------------------------------------------------------------------
if [ "`which snap`" != "" ]; then
    S_TMP_0="/snap/bin"
    if [ -e $S_TMP_0 ]; then
        if [ -d $S_TMP_0 ]; then
            # The "snaps" are Ubuntu/Canonical version of 
            # "universal" Linux packages
            #
            #     https:/snapcraft.io/
            #
            export PATH="$S_TMP_0:$PATH"
        else
            echo ""
            echo "The $S_TMP_0 "
            echo "exists, but it is neither a folder "
            echo "nor a symlink to a folder."
            echo "GUID='24e06331-c9c6-4cb8-8280-a191401095e7'"
            echo ""
            exit 1 # exit with an error as expected here
        fi
    else
        echo ""
        echo "The folder $S_TMP_0 "
        echo "does not exist or it is a broken symlink."
        echo "GUID='5153e84d-36f6-4a16-8580-a191401095e7'"
        echo ""
        exit 1 # exit with an error as expected here
    fi
else
    echo ""
    echo "The \"snap\" is missing from PATH."
    echo "GUID='c138b450-4fde-4d26-a580-a191401095e7'"
    echo ""
fi
#----------------------------------------------------------------------

func_check_presence_of_linux_modules(){
    local S_TMP_0="`ls -1 /dev/{ashmem,binder} | grep '/dev/ashmem' `"
    if [ "$S_TMP_0" == "" ]; then
        modprobe ashmem_linux 
        func_mmmv_assert_error_code_zero_t1 "$?" \
            "16eb215f-a797-4b68-a580-a191401095e7"
        func_mmmv_wait_and_sync_t1
    fi
    #--------
    S_TMP_0="`ls -1 /dev/{ashmem,binder} | grep '/dev/binder' `"
    if [ "$S_TMP_0" == "" ]; then
        modprobe binder_linux 
        func_mmmv_assert_error_code_zero_t1 "$?" \
            "b0547f18-514e-4ab5-b280-a191401095e7"
        func_mmmv_wait_and_sync_t1
    fi
} # func_check_presence_of_linux_modules

ls -1 /dev/{ashmem,binder}

#----------------------------------------------------------------------
# Relevant links:
#
#    https://fossbytes.com/best-android-emulators-linux/ 
#
#----------------------------------------------------------------------
func_exc_intro_message # The first line to be manually edited
#apt-get update
#apt-get install snapd
#apt-get install adb # The ADB stands for "Android Debug Bridge"
#func_check_presence_of_linux_modules

# One of the following 2 lines:
    #snap install --classic anbox-installer ; wait ; anbox-installer
    #snap install --devmode --beta anbox


# Supposedly the command to list Android devices is:
#
#     adb devices
#
# Supposedly the command to install Android applications is:
#
#     adb install /path/to/the/awsome.apk
#

#----------------------------------------------------------------------
cd "$S_FP_ORIG"
#exit 0
#==========================================================================
