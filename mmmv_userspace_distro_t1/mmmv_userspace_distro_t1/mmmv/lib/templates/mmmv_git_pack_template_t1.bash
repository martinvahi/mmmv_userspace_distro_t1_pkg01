#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
# S_VERSION_OF_THIS_FILE="4bd5cc58-0e97-4695-93d9-a131401095e7"
S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t1(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #--------
    # If the "$?" were evaluated in this function, 
    # then it would be "0" even, if it is
    # something else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo "Something went wrong. Error code: $S_ERR_CODE"
        echo "Aborting script."
        echo "GUID=='b4ba6a5a-03e4-49bb-b3d9-a131401095e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1
    fi
} # func_mmmv_assert_error_code_zero_t1


func_mmmv_git_try_to_pack_t1(){
    local S_FN_REPOSITORY_FOLDER="$1"
    #--------
    cd "./$S_FN_REPOSITORY_FOLDER"
        echo "$S_FN_REPOSITORY_FOLDER"
        nice -n 17 git gc --aggressive --prune=all
        func_mmmv_assert_error_code_zero_t1 "$?"
        echo ""
    cd ..
    #--------
    sync
    wait
} # func_mmmv_git_try_to_pack_t1

#--------------------------------------------------------------------------

#func_mmmv_git_try_to_pack_t1 "repository_folder_name"


