#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # to restore its value
S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
    wait # for sync
} # func_mmmv_wait_and_sync_t1
#--------------------------------------------------------------------------
func_mmmv_assert_error_code_zero_t1(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #----------------------------------------------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe Bash code that calls this function is flawed. \e[39m"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "Aborting script."
        echo "GUID=='ec6a6420-0ee2-44a0-8242-63431061b6e7'"
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
        echo -e "\e[31mAborting script. \e[39m"
        echo "GUID=='623f9436-24b9-4dbd-8442-63431061b6e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t1
#--------------------------------------------------------------------------
func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #----------------------------------------------------------------------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo -e "\e[31mCommand \"$S_COMMAND_NAME\" could not be found from the PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='49cd3a3f-5f5d-4d09-9442-63431061b6e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2
func_mmmv_exit_if_not_on_path_t2 "wget"
#--------------------------------------------------------------------------
S_FP_THE_FILES="$S_FP_DIR/the_files"
mkdir -p "$S_FP_THE_FILES"
func_mmmv_assert_error_code_zero_t1 "$?" \
    "30c40544-18ff-402b-9942-63431061b6e7"
func_mmmv_wait_and_sync_t1
func_download(){
    local S_FILE_NAME="$1"
    #------------------------------
    cd "$S_FP_THE_FILES"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "811bec43-a538-4e70-b242-63431061b6e7"
    #------------------------------
    local S_URL="https://github.com/hlibc/arbitraire/archive/$S_FILE_NAME"
    wget "$S_URL"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "113c7674-224d-4fac-8242-63431061b6e7"
    #------------------------------
    func_mmmv_wait_and_sync_t1
    #------------------------------
} # func_download
#--------------------------------------------------------------------------
func_first_use_message(){
    echo ""
    echo -e "\e[33mPlease customise this script to Your needs.\e[39m"
    echo "GUID=='0aec825b-05b8-464d-a532-63431061b6e7'"
    echo ""
    #------------------------------
    cd "$S_FP_ORIG"
    exit 1
    #------------------------------
} # func_first_use_message
func_first_use_message # Please outcomment this line during the customisation.
#--------------------------------------------------------------------------

func_download "v0.3.tar.gz"
func_download "v0.4.tar.gz"
func_download "v0.5.tar.gz"
func_download "v0.6.tar.gz"
func_download "v0.7.tar.gz"

#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="ea2317a3-e987-4943-b432-63431061b6e7"
#==========================================================================
