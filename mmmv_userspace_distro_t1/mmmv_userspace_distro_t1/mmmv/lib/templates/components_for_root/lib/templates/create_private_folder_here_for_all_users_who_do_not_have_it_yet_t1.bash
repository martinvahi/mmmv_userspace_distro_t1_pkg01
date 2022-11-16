#!/usr/bin/env bash
#==========================================================================
# Initial author of this script: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# INCOMPLETE/POOLELI: This script fails, if there exists /home/KOMMENTAAR.txt
#==========================================================================
# S_VERSION_OF_THIS_FILE="14b0b03b-50e9-455e-b17f-026231e0b6e7"
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------
# Configuration:
#--------------------------------------------------------------------------
S_FN_FOLDER_NAME_AT_S_FP_DIR="large_files"

echo ""
echo "Please comment out an exit clause that resides next to the "
echo "GUID=='392cd4f0-c023-4b47-847f-026231e0b6e7'"
echo ""
exit 1 # for the safe/passive storage of this script

#--------------------------------------------------------------------------
# Implementation
#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME=$1
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of the Bash script is aborted."
        echo "GUID=='f47c423e-b2b5-45bd-857f-026231e0b6e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

#func_mmmv_exit_if_not_on_path_t2 "gawk"
func_mmmv_exit_if_not_on_path_t2 "mkdir"
func_mmmv_exit_if_not_on_path_t2 "whoami"

#--------------------------------------------------------------------------

if [ "`whoami`" != "root" ]; then
    echo ""
    echo "This script is meant to be executed only by the root user."
    echo "GUID=='1e65be42-c1af-4fd3-917f-026231e0b6e7'"
    echo ""
    #----
    cd $S_FP_ORIG
    exit 1;
fi

#--------------------------------------------------------------------------

func_mmmv_ar_ls_t1() { # S_ARRAY_VARIABLE_NAME S_FP_LS
    local S_ARRAY_VARIABLE_NAME=$1
    local S_FP_LS=$2
    #--------
    #        The "ls -m" works with both, Linux and BSD.
    local AR_0=$( ls -m $S_FP_LS )
    #--------
    local S_SCRIPT_0="$S_ARRAY_VARIABLE_NAME=()"
    eval "$S_SCRIPT_0"
    local s_iter=""
    S_SCRIPT_0="$S_ARRAY_VARIABLE_NAME+=(\$s_iter)"
    local S_TMP_IFS="$IFS"
    # The IFS is an internal Bash variable, "Internal Field Separator".
    IFS="," # That should handle file names that contain spaces.
    for s_iter in ${AR_0[@]}; do
        eval "$S_SCRIPT_0"
    done
    IFS="$S_TMP_IFS"
    if [ -z $IFS ]; then
        unset IFS
    fi
} # func_mmmv_ar_ls_t1
 
#--------------------------------------------------------------------------

S_AR_HOME_FOLDERS=42

func_mmmv_create_folders_if_missing_t1_helper_1() { # S_FN_HOME_FOLDER
    local S_FN_HOME_FOLDER="$1"
    #--------
    local S_TMP_0=42 # declaration
    #--------
    S_TMP_0="/home/$S_FN_HOME_FOLDER"
    if [ ! -e $S_TMP_0 ]; then
        echo ""
        echo "This script is flawed. The folder "
        echo ""
        echo "    $S_TMP_0"
        echo "does not exist."
        echo "GUID=='a212f819-f6aa-4b1a-a27f-026231e0b6e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1;
    fi
    if [ ! -d $S_TMP_0 ]; then
        echo ""
        echo "This script is flawed. The path "
        echo ""
        echo "    $S_TMP_0"
        echo ""
        echo "references a file, but it must reference a folder."
        echo "GUID=='3fd25b51-0d62-4c59-8b7f-026231e0b6e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1;
    fi
    if [ "$S_FN_FOLDER_NAME_AT_S_FP_DIR" == "" ]; then
        echo ""
        echo "This script is flawed."
        echo "GUID=='32924743-d64c-43b2-8e7f-026231e0b6e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1;
    fi
    S_TMP_0="`echo \"$S_FN_FOLDER_NAME_AT_S_FP_DIR\" | gawk '{gsub(/\s/,\"\");printf "%s", $1 }'`" 
    if [ "$S_TMP_0" != "$S_FN_FOLDER_NAME_AT_S_FP_DIR" ]; then
        echo ""
        echo "This script is flawed."
        echo ""
        echo "    S_FN_FOLDER_NAME_AT_S_FP_DIR=$S_FN_FOLDER_NAME_AT_S_FP_DIR"
        echo ""
        echo "    S_TMP_0=$S_TMP_0"
        echo ""
        echo "GUID=='29e75a54-1ee0-48eb-a47f-026231e0b6e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1;
    fi
    #--------
    cd $S_FP_DIR
    S_TMP_0="$S_FP_DIR/$S_FN_FOLDER_NAME_AT_S_FP_DIR/$S_FN_HOME_FOLDER"
    if [ ! -e $S_TMP_0 ]; then
        mkdir -p $S_FP_DIR/$S_FN_FOLDER_NAME_AT_S_FP_DIR
        cd $S_FP_DIR/$S_FN_FOLDER_NAME_AT_S_FP_DIR # to be sure
        mkdir  ./$S_FN_HOME_FOLDER
        sync
        if [ ! -e $S_TMP_0 ]; then
            echo ""
            echo "Something went wrong. The creation of folder "
            echo ""
            echo "    $S_TMP_0"
            echo ""
            echo "failed. It might be that its parent folder, the "
            echo ""
            echo "    $S_FP_DIR"
            echo ""
            echo "lacks write permissions."
            echo "GUID=='3b66aed1-785d-4f58-a87f-026231e0b6e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1;
        fi
        cd $S_FN_HOME_FOLDER 
        if [ "`pwd`" != "$S_TMP_0" ]; then
            echo "This srcipt is flawed."
            echo "GUID=='446920e1-817a-4f6c-b17f-026231e0b6e7'"
            #----
            cd $S_FP_ORIG
            exit 1;
        fi
        chown -f -R $S_FN_HOME_FOLDER $S_TMP_0
        chmod -f -R 0700 $S_TMP_0
        sync
    fi
    cd $S_FP_DIR
} # func_mmmv_create_folders_if_missing_t1_helper_1

#--------------------------------------------------------------------------

func_mmmv_create_folders_if_missing_t1() {
    func_mmmv_ar_ls_t1 "S_AR_HOME_FOLDERS" "/home"
    #--------
    # AR_2=${S_AR_HOME_FOLDERS[@]}  # flawed array assignment that tokenizes by space
    # S_TMP=${#S_AR_HOME_FOLDERS[@]}
    # echo "S_AR_HOME_FOLDERS length: $S_TMP"
    # echo ""
    # for s_iter in ${S_AR_HOME_FOLDERS[@]}; do
    #      echo "S_AR_HOME_FOLDERS element:[$s_iter]" 
    # done
    #---------------------------------
    AR_2=${S_AR_HOME_FOLDERS[@]}  # flawed array assignment that tokenizes by space
    S_TMP=${#S_AR_HOME_FOLDERS[@]}
    for s_iter in ${S_AR_HOME_FOLDERS[@]}; do
         func_mmmv_create_folders_if_missing_t1_helper_1 "$s_iter"
         #echo "S_AR_HOME_FOLDERS element:[$s_iter]" 
    done
    #---------------------------------
    cd $S_FP_ORIG
} # func_mmmv_create_folders_if_missing_t1 

func_mmmv_create_folders_if_missing_t1 

#--------------------------------------------------------------------------
cd $S_FP_ORIG
exit 0 # no errors detected
#==========================================================================

