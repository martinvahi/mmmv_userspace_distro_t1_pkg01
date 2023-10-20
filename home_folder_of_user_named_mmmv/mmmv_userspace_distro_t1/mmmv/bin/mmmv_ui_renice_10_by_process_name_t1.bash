#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# Tested to work on ("uname -a"):
#
#     FreeBSD fuajee 12.0-RELEASE FreeBSD 12.0-RELEASE r341666 GENERIC  amd64
#     Linux terminal01 6.1.0-12-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.52-1 (2023-09-07) x86_64 GNU/Linux
#
#==========================================================================
S_CMD_GNU_SED="sed" 
if [ "`uname -a | grep -i 'BSD' `" != '' ]; then 
    S_CMD_GNU_SED="gsed" 
fi
#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2b() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #----------------------------------------------------------------------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo -e "\e[31mCommand \"$S_COMMAND_NAME\" could not be found from the PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='fe7d6d5c-0819-4e36-817f-b2533130a7e7'"
        echo ""
        exit 1;
    fi
    #----------------------------------------------------------------------
} # func_mmmv_exit_if_not_on_path_t2b

func_mmmv_exit_if_not_on_path_t2b "renice"
func_mmmv_exit_if_not_on_path_t2b "grep"
func_mmmv_exit_if_not_on_path_t2b "gawk"
func_mmmv_exit_if_not_on_path_t2b "$S_CMD_GNU_SED"

#func_mmmv_exit_if_not_on_path_t2b "mmmv_polish_ABC_2_ACB_exec_t1"

#--------------------------------------------------------------------------
# 
# func_mmmv_assert_error_code_zero_t1b(){
#     local S_ERR_CODE="$1" # the "$?"
#     local S_GUID_CANDIDATE="$2"
#     #----------------------------------------------------------------------
#     if [ "$S_GUID_CANDIDATE" == "" ]; then
#         echo ""
#         echo -e "\e[31mThe Bash code that calls this function is flawed. \e[39m"
#         echo ""
#         echo "    S_GUID_CANDIDATE==\"\""
#         echo ""
#         echo "but it is expected to be a GUID."
#         echo "Aborting script."
#         echo "GUID=='34526f16-1236-4dda-b47f-b2533130a7e7'"
#         echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
#         echo ""
#         #--------
#         exit 1
#     fi
#     #------------------------------
#     # If the "$?" were evaluated in this function, 
#     # then it would be "0" even, if it is
#     # something else at the calling code.
#     if [ "$S_ERR_CODE" != "0" ];then
#         echo ""
#         echo "Something went wrong. Error code: $S_ERR_CODE"
#         echo -e "\e[31mAborting script. \e[39m"
#         echo "GUID=='2a795316-9604-4212-b37f-b2533130a7e7'"
#         echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
#         echo ""
#         #--------
#         exit 1
#     fi
#     #------------------------------
# } # func_mmmv_assert_error_code_zero_t1b
# 
#--------------------------------------------------------------------------
SI_PROCESS_NEW_PRIORITY_VALUE="10"
#--------------------------------------------------------------------------
# 1. version:
#     # Non-shuffled line:
#     #     nice -n 2 renice -n 10 -p `ps -A | grep name_of_the_process | gawk '{print $1}'` ;
#     # Shuffled line components:
#     #     nice -n 2 renice -n 10 -p `ps -A | grep 
#     #      | gawk '{print $1}'` ;
#     #     name_of_the_process
#     S_PART_0="nice -n 2 renice -n $SI_PROCESS_NEW_PRIORITY_VALUE -p \`ps -A | grep "
#     S_PART_1=" | gawk '{print \$1}'\` ; "
#     mmmv_polish_ABC_2_ACB_exec_t1 "$S_PART_0" "$S_PART_1" $1
#--------------------------------------------------------------------------
# 2. version:
S_ARGV_0="$1" # ARGV elements counted like in Ruby
S_ARGV_1="$2" 
#--------------------
if [ "$S_ARGV_0" == "" ]; then
    echo ""
    echo -e "Process name subpart \e[31mnot found\e[39m from command line arguments."
    echo "This script takes only one command line argument, which "
    echo "is a process name or a substring of the process name."
    echo "GUID=='f7504152-de07-4999-917f-b2533130a7e7'"
    echo ""
    exit 1;
    # Priority is not taken in from console to reduce attack/flaw/bug surface.
fi
if [ "$S_ARGV_1" != "" ]; then
    echo ""
    echo -e "\e[31mToo many command line arguments\e[39m."
    echo "This script takes only one command line argument, which "
    echo "is a process name or a substring of the process name."
    echo "GUID=='d922a1ee-67b1-42ee-847f-b2533130a7e7'"
    echo ""
    exit 1;
fi
#--------------------
# Testlines:
#     printf 'AA BB\tCC' | sed -e 's/[[:blank:]]/X/g'
#     printf 'AA BB\tCC' | sed -e 's/[[:blank:]]//g'
S_TMP_0="`echo \"$S_ARGV_0\" | $S_CMD_GNU_SED -e 's/[[:blank:]]//g' `"
if [ "$S_ARGV_0" != "$S_TMP_0" ]; then
    echo ""
    echo -e "\e[31mSpaces-tabs are not allowed to be part of a process name\e[39m."
    echo "GUID=='75b5cc4b-090c-4ebf-a27f-b2533130a7e7'"
    echo ""
    exit 1;
fi
#--------------------
S_TMP_0="`ps -A | grep \"$S_ARGV_0\" `"
if [ "$S_TMP_0" == "" ]; then
    echo ""
    echo -e "\e[31mCould not find a process\e[39m that "
    echo -e "includes a string \"\e[33m$S_ARGV_0\e[39m\" in its name" ;
    echo "GUID=='4fc984a1-a880-47f9-a17f-b2533130a7e7'"
    echo ""
    exit 1;
fi
renice -n $SI_PROCESS_NEW_PRIORITY_VALUE -p `ps -A | grep "$S_ARGV_0" | gawk '{print $1}'` ;
S_ERR_CODE="$?" ; wait 
if [ "$S_ERR_CODE" != "0" ]; then
    echo ""
    echo -e "\e[31mSomething went wrong\e[39m. Error code: \e[33m$S_ERR_CODE\e[39m ." 
    echo ""
    echo -e "\e[33mAn idea\e[39m:"
    echo "    Sometimes renice does not allow to make "
    echo "    a process more prioritized. Some processes may already "
    echo "    have a priority greater than the 20+$SI_PROCESS_NEW_PRIORITY_VALUE ."
    echo "    Aborting script."
    echo "    GUID=='5b169c1a-559f-468b-a17f-b2533130a7e7'"
    echo ""
    exit 1;
fi
#func_mmmv_assert_error_code_zero_t1b "$S_ERR_CODE" \
#    "428b5033-46ab-4397-837f-b2533130a7e7"
#--------------------------------------------------------------------------

exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="14dd6c34-bc5f-40ff-937f-b2533130a7e7"
#==========================================================================
