#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# The point of entry is func_main() .
#==========================================================================
S_FP_ORIG="`pwd`"
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#--------------------------------------------------------------------------

func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
    wait # for sync
} # func_mmmv_wait_and_sync_t1

#--------------------------------------------------------------------------
func_mmmv_init_s_timestamp_if_not_inited_t1(){
    if [ "$S_TIMESTAMP" == "" ]; then
        if [ "`which date 2> /dev/null`" != "" ]; then
            S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
        else
            S_TIMESTAMP="0000_00_00_T_00h_00min_00s"
            echo ""
            echo -e "The console program \"\e[31mdate\e[39m\" is missing from the PATH."
            echo "Using a constant value, "
            echo ""
            echo "    S_TIMESTAMP=\"$S_TIMESTAMP\""
            echo ""
            echo "GUID=='1fbfd534-8f35-4b28-82cb-d0b0d02147e7'"
            echo ""
        fi
    fi
} # func_mmmv_init_s_timestamp_if_not_inited_t1

#--------------------------------------------------------------------------

func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1(){
    SB_S_FP_ORIG_VERIFICATION_FAILED="f"
    if [ "$S_FP_ORIG" == "" ]; then 
        SB_S_FP_ORIG_VERIFICATION_FAILED="t"
        echo ""
        echo -e "\e[31mThe code of this script has the flaw\e[39m that"
        echo "the variable S_FP_ORIG has not been set."
        echo "GUID=='22c68ff3-de7e-4de7-8dcb-d0b0d02147e7'"
        echo ""
    else
        if [ ! -e "$S_FP_ORIG" ]; then 
            SB_S_FP_ORIG_VERIFICATION_FAILED="t"
            echo ""
            echo -e "\e[31mThe code of this script has the flaw\e[39m that "
            echo "the variable S_FP_ORIG has been declared, but "
            echo "its value is some string that is not a file or folder path."
            echo "It is expected to be a folder path."
            echo ""
            echo "    S_FP_ORIG==\"$S_FP_ORIG\""
            echo ""
            echo "GUID=='10d581f9-9958-4472-a4cb-d0b0d02147e7'"
            echo ""
        else
            if [ ! -d "$S_FP_ORIG" ]; then 
                SB_S_FP_ORIG_VERIFICATION_FAILED="t"
                echo ""
                echo -e "\e[31mThe code of this script has the flaw\e[39m that "
                echo "the variable S_FP_ORIG references a file, but "
                echo "it is expected to reference a folder."
                echo ""
                echo "    S_FP_ORIG==$S_FP_ORIG"
                echo ""
                echo "GUID=='4e5e624c-41dc-4c4f-a4cb-d0b0d02147e7'"
                echo ""
            fi
        fi
    fi
    #----------------------------------------------------------------------
    # exit 1 # must NOT be called in ~/.bashrc, because 
             # exiting from the ~/.bashrc exits the session.
    #----------------------------------------------------------------------
    # Usage example:
    #    func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1
    #    if [ "$SB_S_FP_ORIG_VERIFICATION_FAILED" == "f" ]; then 
    #        cd "$S_FP_ORIG"
    #    else 
    #        echo ""
    #        echo "The code of this script is flawed."
    #        echo "GUID=='b1adcd5f-4ac0-48af-b1cb-d0b0d02147e7'"
    #        echo ""
    #    fi
} # func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1

#--------------------------------------------------------------------------
SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED="f"
func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t2(){
    if [ "$SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED" != "t" ]; then
        if [ "$SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
            echo "The global variable "
            echo ""
            echo "    SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED==\"$SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED\""
            echo ""
            echo "has a domain of {\"f\", \"t\"}."
            echo "GUID=='53d0065c-dfe0-4c10-94cb-d0b0d02147e7'"
            echo ""
        else
            func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1
            SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED="t"
        fi
    fi
} # func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t2

#--------------------------------------------------------------------------
SB_NO_ERRORS_YET="t" # domain=={"t","f"} 
func_mmmv_assert_nonempty_string_but_do_not_exit_t1(){
    local S_IN="$1"
    local S_VARIABLE_NAME_IN_CALLING_CODE="$2"
    local S_GUID_CANDIDATE="$3"
    #----------------------------------------------------------------------
    local SB_NO_ERRORS_YET_1="t"
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "GUID=='980d8e28-95f7-4568-a4cb-d0b0d02147e7'"
        echo ""
        SB_NO_ERRORS_YET_1="f"
    fi
    #--------------------
    if [ "$SB_NO_ERRORS_YET" != "t" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "The global variable "
        echo ""
        echo "    SB_NO_ERRORS_YET==\"$SB_NO_ERRORS_YET\""
        echo ""
        if [ "$SB_NO_ERRORS_YET" == "f" ]; then 
            echo "is expected to be initialized to \"t\" before calling this function."
            echo "GUID=='c1dadd27-c3b3-495d-a3bb-d0b0d02147e7'"
        else
            echo "is expected to be initialized to \"t\" before calling this function"
            echo "and its domain is {\"f\", \"t\"}."
            echo "GUID=='1d7eb040-0762-4877-81bb-d0b0d02147e7'"
        fi
        if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then 
            echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo ""
        SB_NO_ERRORS_YET="f"
    fi
    #--------------------
    if [ "$SB_NO_ERRORS_YET_1" == "f" ]; then 
        SB_NO_ERRORS_YET="f"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NO_ERRORS_YET" == "t" ]; then 
        if [ "$S_VARIABLE_NAME_IN_CALLING_CODE" == "" ]; then 
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
            echo ""
            echo "    S_VARIABLE_NAME_IN_CALLING_CODE==\"\""
            echo ""
            echo "GUID=='30f1d990-5ccb-4bae-a3bb-d0b0d02147e7'"
            if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then  # should be always true at this line
                echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo ""
            SB_NO_ERRORS_YET="f"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NO_ERRORS_YET" == "t" ]; then 
        if [ "$S_IN" == "" ]; then 
            echo ""
            echo -e "\e[31mThere is a flaw somewhere in the code\e[39m that"
            echo "uses a variable named \"$S_VARIABLE_NAME_IN_CALLING_CODE\"." 
            echo ""
            echo "    $S_VARIABLE_NAME_IN_CALLING_CODE==\"$S_IN\""
            echo ""
            echo "but it is expected to be something other than an empty string."
            echo "GUID=='1269074b-cc25-4d4b-83bb-d0b0d02147e7'"
            if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then  # should be always true at this line
                echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo ""
            SB_NO_ERRORS_YET="f"
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_assert_nonempty_string_but_do_not_exit_t1

#--------------------------------------------------------------------------
# SB_NO_ERRORS_YET="t" # domain=={"t","f"}, initial declaration resides upwards from this line
func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1(){
    local SB_VARIABLE_VALUE="$1"
    local S_VARIABLE_NAME_IN_CALLING_CODE="$2"
    local S_GUID_CANDIDATE="$3"
    #----------------------------------------------------------------------
    local SB_NO_ERRORS_YET_1="t"
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "GUID=='5ab01cb3-2477-4c03-81bb-d0b0d02147e7'"
        echo ""
        SB_NO_ERRORS_YET_1="f"
    fi
    #--------------------
    if [ "$SB_NO_ERRORS_YET" != "t" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "The global variable "
        echo ""
        echo "    SB_NO_ERRORS_YET==\"$SB_NO_ERRORS_YET\""
        echo ""
        if [ "$SB_NO_ERRORS_YET" == "f" ]; then 
            echo "is expected to be initialized to \"t\" before calling this function."
            echo "GUID=='05b83a4c-89a4-4c7b-81bb-d0b0d02147e7'"
        else
            echo "is expected to be initialized to \"t\" before calling this function"
            echo "and its domain is {\"f\", \"t\"}."
            echo "GUID=='e579502c-fa50-44ae-84bb-d0b0d02147e7'"
        fi
        if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then 
            echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo ""
        SB_NO_ERRORS_YET="f"
    fi
    #--------------------
    if [ "$SB_NO_ERRORS_YET_1" == "f" ]; then 
        SB_NO_ERRORS_YET="f"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NO_ERRORS_YET" == "t" ]; then 
        if [ "$S_VARIABLE_NAME_IN_CALLING_CODE" == "" ]; then 
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
            echo ""
            echo "    S_VARIABLE_NAME_IN_CALLING_CODE==\"\""
            echo ""
            echo "GUID=='3cbab670-fa61-409d-a4bb-d0b0d02147e7'"
            if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then  # should be always true at this line
                echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo ""
            SB_NO_ERRORS_YET="f"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NO_ERRORS_YET" == "t" ]; then 
        if [ "$SB_VARIABLE_VALUE" != "t" ]; then 
            if [ "$SB_VARIABLE_VALUE" != "f" ]; then 
                echo ""
                echo -e "\e[31mThere is a flaw somewhere in the code\e[39m that"
                echo "uses a variable named \"$S_VARIABLE_NAME_IN_CALLING_CODE\". The " 
                echo ""
                echo "    $S_VARIABLE_NAME_IN_CALLING_CODE==\"$SB_VARIABLE_VALUE\""
                echo ""
                echo "but it is expected to be either \"t\" or \"f\"."
                echo "GUID=='74999e13-e650-4939-84ab-d0b0d02147e7'"
                if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then  # should be always true at this line
                    echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi
                echo ""
                SB_NO_ERRORS_YET="f"
            fi
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_report_an_error_but_do_not_exit_t1(){
    local S_GUID_CANDIDATE="$1" # first  function argument
    local S_ERR_MSG="$2"        # second function argument
    #----------------------------------------------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code of this script is flawed.\e[39m"
        if [ "$S_ERR_MSG" != "" ]; then 
            echo "$S_ERR_MSG"
        fi
        echo "GUID=='9e8dba14-e12a-4695-b4ab-d0b0d02147e7'"
        echo ""
    else
        echo ""
        echo -e "\e[31mThe code of this script is flawed.\e[39m"
        if [ "$S_ERR_MSG" != "" ]; then 
            echo "$S_ERR_MSG"
        fi
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo "GUID=='232dd45d-ab1f-432f-91ab-d0b0d02147e7'"
        echo ""
    fi
    #----------------------------------------------------------------------
    # exit 1 # must NOT be called in ~/.bashrc, because 
             # exiting from the ~/.bashrc exits the session.
} # func_mmmv_report_an_error_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_report_missing_from_path_and_do_NOT_exit_t1() {
    local S_NAME_OF_THE_EXECUTABLE=$1 # first function argument
    #----------------------------------------------------------------------
    local S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE 2>/dev/null\`"
    local S_TMP_1=""
    local S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    if [ "$S_TMP_1" == "" ] ; then
        echo ""
        echo "This bash script wished to use the "
        echo "\"$S_NAME_OF_THE_EXECUTABLE\" from the PATH, but "
        echo "it was missing from the PATH."
        echo "GUID=='4f28ec64-2a7d-4658-b8ab-d0b0d02147e7'"
        echo ""
    fi
    #----------------------------------------------------------------------
    # exit 1 # must NOT be called in ~/.bashrc, because 
             # exiting from the ~/.bashrc exits the session.
} # func_mmmv_report_missing_from_path_and_do_NOT_exit_t1

#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "ln"
#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "date"
#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "printf"
#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "grep"
#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "git"

#--------------------------------------------------------------------------

func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1() {  # S_FP, S_GUID_CANDIDATE
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$3" # domain: {"t","f",""}
                                                       # ""==="t", default "t"
    #----------------------------------------------------------------------
    # A global variable for storing function output.
    SB_VERIFICATION_FAILED="f" # domain: "t", "f" .
    #------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
        echo "This function requires 2 parameters: S_FP, S_GUID_CANDIDATE"
        echo "and has an optional 3. parameter: SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        echo "GUID=='03b16c38-3ce1-42dc-92ab-d0b0d02147e7'"
        echo ""
        #--------
        SB_VERIFICATION_FAILED="t"
    fi
    #------------------------------
    local SB_DISPLAY_VERIF_FAILURE_MSG="t" # the default
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" != "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" == "f" ]; then
                SB_DISPLAY_VERIF_FAILURE_MSG="f"
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" != "t" ]; then
                    echo ""
                    echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
                    echo ""
                    echo "  SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE==\"$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE\""
                    echo ""
                    echo "Valid values are: \"t\", \"f\", \"\" ."
                    echo "\"\" defaults to \"t\"."
                    echo "GUID=='2f8754d0-f549-418b-a5ab-d0b0d02147e7'"
                    echo ""
                    #--------
                    SB_VERIFICATION_FAILED="t"
                fi
            fi
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ ! -e "$S_FP" ]; then
            if [ -h "$S_FP" ]; then
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    echo "The path "
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo "points to a broken symlink, but a file or "
                    echo "a symlink to a file is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='58bd6551-8dd9-42d8-81ab-d0b0d02147e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            else
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    echo "The file "
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo "does not exist."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='255bb351-ac85-470e-bd9b-d0b0d02147e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            fi
        else
            if [ -d "$S_FP" ]; then
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    if [ -h "$S_FP" ]; then
                        echo "The symlink to the folder "
                    else
                        echo "The folder "
                    fi
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo "exists, but a file or a symlink to a file is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='0eb8be5a-a1f2-4351-819b-d0b0d02147e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            fi
        fi
    fi #  "$SB_VERIFICATION_FAILED" == "f"
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
        if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash function is flawed.\e[39m"
            echo "GUID=='4b831531-1df9-44d5-959b-d0b0d02147e7'"
            echo ""
        fi
    fi
    #------------------------------
} # func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1() {  # S_FP, S_GUID_CANDIDATE
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$3" # domain: {"t","f",""}
                                                       # ""==="t", default "t"
    #----------------------------------------------------------------------
    # A global variable for storing function output.
    SB_VERIFICATION_FAILED="f" # domain: "t", "f" .
    #------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
        echo "This function requires 2 parameters: S_FP, S_GUID_CANDIDATE"
        echo "and has an optional 3. parameter: SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        echo "GUID=='d5859f21-d516-467a-829b-d0b0d02147e7'"
        echo ""
        #--------
        SB_VERIFICATION_FAILED="t"
    fi
    #------------------------------
    local SB_DISPLAY_VERIF_FAILURE_MSG="t" # the default
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" != "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" == "f" ]; then
                SB_DISPLAY_VERIF_FAILURE_MSG="f"
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" != "t" ]; then
                    echo ""
                    echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
                    echo ""
                    echo "  SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE==\"$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE\""
                    echo ""
                    echo "Valid values are: \"t\", \"f\", \"\" ."
                    echo "\"\" defaults to \"t\"."
                    echo "GUID=='32021b1a-34d2-42f6-a49b-d0b0d02147e7'"
                    echo ""
                    #--------
                    SB_VERIFICATION_FAILED="t"
                fi
            fi
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ ! -e "$S_FP" ]; then
            if [ -h "$S_FP" ]; then
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    echo "The path "
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo "points to a broken symlink, but a folder "
                    echo "or a symlink to a folder is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='1a670402-3ac1-476d-a99b-d0b0d02147e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            else
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    echo "The folder "
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo "does not exist."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='6becc324-5a0a-4be2-859b-d0b0d02147e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            fi
        else
            if [ ! -d "$S_FP" ]; then
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    if [ -h "$S_FP" ]; then
                        echo "The symlink to an existing file "
                    else
                        echo "The file "
                    fi
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo "exists, but a folder is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='5143181f-31c1-4b90-849b-d0b0d02147e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            fi
        fi
    fi #  "$SB_VERIFICATION_FAILED" == "f"
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
        if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash function is flawed.\e[39m"
            echo "GUID=='8a739b5c-7a5f-4c74-a39b-d0b0d02147e7'"
            echo ""
        fi
    fi
    #------------------------------
} # func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1(){
    local S_FP_INSTALLATION_FOLDER="$1" # is 
                      # the folder with the $S_FP_INSTALLATION_FOLDER/bin 
                      # and optionally  the $S_FP_INSTALLATION_FOLDER/share/man
    local S_GUID_CANDIDATE="$2"
    local SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY="$3" # domain: {"t","f"} Default: "f"
    #----------------------------------------------------------------------
    # A global variable for storing function output.
    SB_VERIFICATION_FAILED="f" # domain: "t", "f" .
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$S_GUID_CANDIDATE" == "" ]; then
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
            echo ""
            echo "    S_GUID_CANDIDATE==\"\""
            echo ""
            echo "GUID=='b9520227-0b63-46e4-b49b-d0b0d02147e7'"
            echo ""
            #--------
            SB_VERIFICATION_FAILED="t"
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$S_FP_INSTALLATION_FOLDER" == "" ]; then
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
            echo ""
            echo "    S_FP_INSTALLATION_FOLDER==\"\""
            echo ""
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            echo "GUID=='453e9454-8954-4db2-a49b-d0b0d02147e7'"
            echo ""
            #--------
            SB_VERIFICATION_FAILED="t"
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY" == "" ]; then
            SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY="f" # the default value
        else
            if [ "$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY" != "t" ]; then
                if [ "$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY" != "f" ]; then
                    echo ""
                    echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
                    echo ""
                    echo "    SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY==\"$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY\""
                    echo ""
                    echo "but its valid values are \"t\" and \"f\" and "
                    echo "\"\", which is automatically converted to the "
                    echo "default value of \"f\"."
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    echo "GUID=='d1d4c451-b594-4ba4-819b-d0b0d02147e7'"
                    echo ""
                    #--------
                    SB_VERIFICATION_FAILED="t"
                fi
            fi
        fi
    fi
    #------------------------------
    local SB_MAN_FOLDER_OR_NONBROKEN_SYMLINK_TO_IT_EXISTS="f"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_INSTALLATION_FOLDER" "2ee614b2-92e8-449a-91cb-d0b0d02147e7"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #--------------
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_INSTALLATION_FOLDER/bin" "b194271c-bf27-4a24-82cb-d0b0d02147e7"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                Z_PATH="$S_FP_INSTALLATION_FOLDER/bin:$Z_PATH"
            fi
            #--------------
            if [ -e "$S_FP_INSTALLATION_FOLDER/share/man" ]; then
                if [ -d "$S_FP_INSTALLATION_FOLDER/share/man" ]; then
                    SB_MAN_FOLDER_OR_NONBROKEN_SYMLINK_TO_IT_EXISTS="t"
                fi
            fi
            if [ "$SB_MAN_FOLDER_OR_NONBROKEN_SYMLINK_TO_IT_EXISTS" == "f" ]; then
                if [ "$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY" == "t" ]; then
                    # The next 2 lines are for displaying an error message.
                    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                        "$S_FP_INSTALLATION_FOLDER/share/man" "be9e5545-fb93-42d3-a4cb-d0b0d02147e7"
                fi
            else
                MANPATH="$S_FP_INSTALLATION_FOLDER/share/man:$MANPATH"
            fi
            #--------------
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
        if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash function is flawed.\e[39m"
            echo "GUID=='4aad83c4-b4b6-49c9-a19b-d0b0d02147e7'"
            echo ""
        fi
    fi
    #------------------------------
} # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1

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
        echo "GUID=='06380134-84c8-46e3-919b-d0b0d02147e7'"
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
        echo "GUID=='9479bd50-bc4d-43f5-949b-d0b0d02147e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

# It differs form the 
# func_mmmv_assert_error_code_zero_t1 
# by the fact that it does not include the 
#
#     cd "$S_FP_ORIG"
#
func_mmmv_assert_error_code_zero_t2(){
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
        echo "GUID=='adb76e42-eb69-4733-a28b-d0b0d02147e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
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
        echo "GUID=='c52dd75b-956b-48d3-858b-d0b0d02147e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t2

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t3(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #----------------------------------------------------------------------
    func_mmmv_assert_error_code_zero_t1 "$S_ERR_CODE" "$S_GUID_CANDIDATE"
    func_mmmv_wait_and_sync_t1
    #------------------------------
} # func_mmmv_assert_error_code_zero_t3

func_mmmv_assert_error_code_zero_t4(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #----------------------------------------------------------------------
    func_mmmv_assert_error_code_zero_t2 "$S_ERR_CODE" "$S_GUID_CANDIDATE"
    func_mmmv_wait_and_sync_t1
    #------------------------------
} # func_mmmv_assert_error_code_zero_t4

#--------------------------------------------------------------------------

func_mmmv_exc_verify_S_FP_ORIG_t1() {
    if [ "$S_FP_ORIG" == "" ]; then
        echo ""
        echo -e "\e[31mThe code of this script is flawed. \e[39m"
        echo "The environment variable S_FP_ORIG is expected "
        echo "to be initialized at the start of the script by "
        echo ""
        echo "    S_FP_ORIG=\"\`pwd\`\""
        echo ""
        echo "Aborting script."
        echo "GUID=='305810f4-097b-4b67-a38b-d0b0d02147e7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    local SB_IS_SYMLINK="f"      # possible values: "t", "f"
    if [ -h "$S_FP_ORIG" ]; then # Returns "false" for paths that 
                                 # do not refer to anything.
        SB_IS_SYMLINK="t"
    fi
    #--------
    if [ ! -e "$S_FP_ORIG" ]; then
        if [ "$SB_IS_SYMLINK" == "t" ]; then
            echo "The "
        else
            echo "The file or folder "
        fi
        echo ""
        echo "    S_FP_ORIG==$S_FP_ORIG "
        echo ""
        if [ "$SB_IS_SYMLINK" == "t" ]; then
            echo "is a broken symlink. It is expected to be a folder that "
        else
            echo "does not exist. It is expected to be a folder that "
        fi
        echo "contains the script that prints this error message."
        echo -e "\e[31mAborting script. \e[39m"
        echo "GUID=='cac1ef45-84db-4dd4-a48b-d0b0d02147e7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    if [ ! -d "$S_FP_ORIG" ]; then
        echo "The "
        echo ""
        echo "    S_FP_ORIG==$S_FP_ORIG "
        echo ""
        echo "is not a folder. It is expected to be a folder that "
        echo "contains the script that prints this error message."
        echo -e "\e[31mAborting script. \e[39m"
        echo "GUID=='a47f984b-633a-467d-928b-d0b0d02147e7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t1

#--------------------------------------------------------------------------

FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED="f"
func_mmmv_exc_verify_S_FP_ORIG_t2(){
    if [ "$FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED" != "t" ]; then
        if [ "$FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
            echo "The global variable "
            echo ""
            echo "    FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED==\"$FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED\""
            echo ""
            echo "has a domain of {\"f\", \"t\"}."
            echo "GUID=='954416f5-f8c2-4014-a58b-d0b0d02147e7'"
            echo ""
        else
            func_mmmv_exc_verify_S_FP_ORIG_t1
            FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED="t"
        fi
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t2

#--------------------------------------------------------------------------

func_mmmv_cd_S_FP_ORIG_and_exit_t1(){
    func_mmmv_exc_verify_S_FP_ORIG_t1
    cd "$S_FP_ORIG"
    func_mmmv_assert_error_code_zero_t2 "$?" \
        "2a6aff30-a208-44e7-a4cb-d0b0d02147e7"
    exit 0
} # func_mmmv_cd_S_FP_ORIG_and_exit_t1

#--------------------------------------------------------------------------

func_mmmv_assert_nonempty_string_t1(){
    local S_IN="$1"
    local S_VARIABLE_NAME_IN_CALLING_CODE="$2"
    local S_GUID_CANDIDATE="$3"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "GUID=='e8f90910-db3a-457b-958b-d0b0d02147e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
    if [ "$S_VARIABLE_NAME_IN_CALLING_CODE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_VARIABLE_NAME_IN_CALLING_CODE==\"\""
        echo ""
        echo "GUID=='c1ce0d3f-dfff-4494-a78b-d0b0d02147e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
    if [ "$S_IN" == "" ]; then 
        echo ""
        echo -e "\e[31mThere is a flaw somewhere in the code\e[39m that"
        echo "uses a variable named \"$S_VARIABLE_NAME_IN_CALLING_CODE\"." 
        echo ""
        echo "    $S_VARIABLE_NAME_IN_CALLING_CODE==\"$S_IN\""
        echo ""
        echo "but it is expected to be something other than an empty string."
        echo "GUID=='74c33436-fe78-41a0-918b-d0b0d02147e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
} # func_mmmv_assert_nonempty_string_t1

#--------------------------------------------------------------------------

func_mmmv_assert_sbvar_domain_t_f_t1(){
    local SB_VARIABLE_VALUE="$1"
    local S_VARIABLE_NAME_IN_CALLING_CODE="$2"
    local S_GUID_CANDIDATE="$3"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "GUID=='38f5ed4a-e312-4219-b58b-d0b0d02147e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
    if [ "$S_VARIABLE_NAME_IN_CALLING_CODE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_VARIABLE_NAME_IN_CALLING_CODE==\"\""
        echo ""
        echo "GUID=='a2ee6855-9d9b-4ef2-938b-d0b0d02147e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
    if [ "$SB_VARIABLE_VALUE" != "t" ]; then 
        if [ "$SB_VARIABLE_VALUE" != "f" ]; then 
            echo ""
            echo -e "\e[31mThere is a flaw somewhere in the code\e[39m that"
            echo "uses a variable named \"$S_VARIABLE_NAME_IN_CALLING_CODE\". The " 
            echo ""
            echo "    $S_VARIABLE_NAME_IN_CALLING_CODE==\"$SB_VARIABLE_VALUE\""
            echo ""
            echo "but it is expected to be either \"t\" or \"f\"."
            echo "GUID=='9483a934-1e27-404c-b58b-d0b0d02147e7'"
            echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_assert_sbvar_domain_t_f_t1

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_OPTIONAL_BAN_SYMLINKS="$3" # domain: {"t", "f", ""} default: "f"
                                        # is the last formal parameter 
                                        # in stead of the S_GUID_CANDIDATE, 
                                        # because that way this function is 
                                        # backwards compatible with 
                                        # an earlier version of this 
                                        # function.
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    local SB_LACK_OF_PARAMETERS="f"
    if [ "$S_FP" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$SB_LACK_OF_PARAMETERS" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "This function requires 2 parameters, which are "
        echo "S_FP, S_GUID_CANDIDATE, and it has an optional 3. parameter, "
        echo "which is SB_OPTIONAL_BAN_SYMLINKS."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='3f33e22d-23dd-4bcc-848b-d0b0d02147e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo -e "\e[31mThis code is flawed. \e[39m"
            echo "GUID=='89ad9630-0c08-46ed-838b-d0b0d02147e7'"
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
    #------------------------------
    if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "" ]; then
        # The default value of the 
        SB_OPTIONAL_BAN_SYMLINKS="f"
        # must be backwards compatible with the
        # version of this function, where 
        # symlinks to files were treated as actual files.
    else
        if [ "$SB_OPTIONAL_BAN_SYMLINKS" != "t" ]; then
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" != "f" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    SB_OPTIONAL_BAN_SYMLINKS==\"$SB_OPTIONAL_BAN_SYMLINKS\""
                echo ""
                echo "but the valid values for the SB_OPTIONAL_BAN_SYMLINKS"
                echo "are: \"t\", \"f\", \"\"."
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                echo "GUID=='210e11b4-d991-4c0c-8e8b-d0b0d02147e7'"
                echo ""
                #--------
                cd "$S_FP_ORIG"
                exit 1 # exiting with an error
            fi
        fi
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "a file is expected."
            else
                echo "a file or a symlink to a file is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='1647b995-79c9-4389-868b-d0b0d02147e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "The file "
            else
                echo "The file or a symlink to a file "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='f4c50c14-b3e8-40c4-b18b-d0b0d02147e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to an existing folder "
            else
                echo "The folder "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            printf "exists, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "a file is expected."
            else
                echo "a file or a symlink to a file is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='f9e0c520-74f2-4a8b-b58b-d0b0d02147e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                if [ -h "$S_FP" ]; then 
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP"
                    echo ""
                    echo "is a symlink to a file, but a file is expected."
                    echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='9115d445-25e4-430e-828b-d0b0d02147e7'"
                    echo ""
                    #--------
                    cd "$S_FP_ORIG"
                    exit 1 # exiting with an error
                fi
            fi
        fi
    fi
} # func_mmmv_assert_file_exists_t1

#--------------------------------------------------------------------------

func_mmmv_assert_folder_exists_t1() {
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_OPTIONAL_BAN_SYMLINKS="$3" # domain: {"t", "f", ""} default: "f"
                                        # is the last formal parameter 
                                        # in stead of the S_GUID_CANDIDATE, 
                                        # because that way this function is 
                                        # backwards compatible with 
                                        # an earlier version of this 
                                        # function.
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    local SB_LACK_OF_PARAMETERS="f"
    if [ "$S_FP" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$SB_LACK_OF_PARAMETERS" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "This function requires 2 parameters, which are "
        echo "S_FP, S_GUID_CANDIDATE, and it has an optional 3. parameter, "
        echo "which is SB_OPTIONAL_BAN_SYMLINKS."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='133b4362-1b13-4356-a48b-d0b0d02147e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo -e "\e[31mThis code is flawed. \e[39m"
            echo "GUID=='5466a7a3-03fa-4386-9a8b-d0b0d02147e7'"
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
    #------------------------------
    if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "" ]; then
        # The default value of the 
        SB_OPTIONAL_BAN_SYMLINKS="f"
        # must be backwards compatible with the
        # version of this function, where 
        # symlinks to folders were treated as actual folders.
    else
        if [ "$SB_OPTIONAL_BAN_SYMLINKS" != "t" ]; then
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" != "f" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    SB_OPTIONAL_BAN_SYMLINKS==\"$SB_OPTIONAL_BAN_SYMLINKS\""
                echo ""
                echo "but the valid values for the SB_OPTIONAL_BAN_SYMLINKS"
                echo "are: \"t\", \"f\", \"\"."
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                echo "GUID=='34fbb513-37ec-4b21-828b-d0b0d02147e7'"
                echo ""
                #--------
                cd "$S_FP_ORIG"
                exit 1 # exiting with an error
            fi
        fi
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "a folder is expected."
            else
                echo "a folder or a symlink to a folder is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='f9cd395f-2700-4005-b28b-d0b0d02147e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "The folder "
            else
                echo "The folder or a symlink to a folder "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='8b173847-2024-4741-a28b-d0b0d02147e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ ! -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to an existing file "
            else
                echo "The file "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            printf "exists, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "a folder is expected."
            else
                echo "a folder or a symlink to a folder is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='98c0785d-0a25-4003-a38b-d0b0d02147e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                if [ -h "$S_FP" ]; then 
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP"
                    echo ""
                    echo "is a symlink to a folder, but a folder is expected."
                    echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='53730881-c659-4cf0-a28b-d0b0d02147e7'"
                    echo ""
                    #--------
                    cd "$S_FP_ORIG"
                    exit 1 # exiting with an error
                fi
            fi
        fi
    fi
} # func_mmmv_assert_folder_exists_t1

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo -e "\e[31mCommand \"$S_COMMAND_NAME\" could not be found from the PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='392b17c4-4186-4519-818b-d0b0d02147e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

#--------------------------------------------------------------------------

func_mmmv_exit_t1(){
    local S_GUID_CANDIDATE="$1" # first function argument
    #----------------------------------------------------------------------
    echo ""
    echo -e "\e[32m\e[7m#======================================================="
    echo -e "\e[0m\e[32mIf You want to run this Bash script, the "
    echo "#--------------"
    echo "$S_FP_DIR/$S_FN_SCRIPTFILE_NAME"
    echo "#--------------"
    echo "then please edit it by outcommenting the line with the "
    echo "\"$S_GUID_CANDIDATE\"."
    echo "Thank You."
    echo -e "\e[32m\e[7m#======================================================="
    echo -e "\e[0m" # resets the text terminal style
    cd "$S_FP_ORIG"
    exit 1
} # func_mmmv_exit_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t1(){
    local S_GUID_CANDIDATE="$1" # first function argument
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t1
    echo ""
    echo -e "\e[31mThe code of this script is flawed. \e[39m"
    echo "Aborting script."
    if [ "$S_GUID_CANDIDATE" != "" ]; then 
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
    fi
    echo "GUID=='c91ab5ed-a5f0-41ab-a38b-d0b0d02147e7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1 # exit with an error
} # func_mmmv_exc_exit_with_an_error_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t2(){
    local S_GUID_CANDIDATE="$1"   # first function argument
    local S_OPTIONAL_ERR_MSG="$2" # second function argument
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t1
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code of this script is flawed. \e[39m"
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID=='ac27c035-f152-46ee-b48b-d0b0d02147e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    else
        echo ""
        echo -e "\e[31mSomething went wrong. \e[39m"
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo "GUID=='c76ef152-ef42-4291-8f8b-d0b0d02147e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_exit_with_an_error_t2

#--------------------------------------------------------------------------

S_AWK_CMD="exit 1;"
func_mmmv_exc_determine_Awk_command_t1() {
    func_mmmv_exc_verify_S_FP_ORIG_t2
    S_AWK_CMD="exit 1;" # for reliability
    local SB_THROW="f"
    if [ "`which gawk`" != "" ]; then
        S_AWK_CMD="gawk"
    else
        if [ "`which awk`" != "" ]; then
            S_AWK_CMD="awk"
        else
            SB_THROW="t"
        fi
    fi
    if [ "$SB_THROW" != "f" ]; then
        echo ""
        echo -e "\e[31mNeither 'gawk', nor 'awk' was available on PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='6ac80f1d-6d7c-4d08-a27b-d0b0d02147e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exc_determine_Awk_command_t1

#--------------------------------------------------------------------------

func_mmmv_exc_is_file_t1() {
    local S_FP_CANDIDATE="$1" # folder path
    #----------------------------------------------------------------------
    if [ ! -e "$S_FP_CANDIDATE" ]; then 
        echo ""
        echo "The file"
        echo ""
        echo "    $S_FP_CANDIDATE "
        echo ""
        echo "does not exist."
        echo "GUID=='53f18f39-777a-4d81-8e7b-d0b0d02147e7'"
        echo "Aborting without doing anything."
        echo ""
        exit 1 # exit with an error
    fi
    if [ -d "$S_FP_CANDIDATE" ]; then 
        echo ""
        echo "The path"
        echo ""
        echo "    $S_FP_CANDIDATE "
        echo ""
        if [ -h "$S_FP_CANDIDATE" ]; then 
            echo "references a symbolic link to a folder, "
        else
            echo "references a folder, "
        fi
        echo "but it is required to reference a file."
        echo "GUID=='8de18855-af9e-4cff-b47b-d0b0d02147e7'"
        echo "Aborting without doing anything."
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_is_file_t1

#--------------------------------------------------------------------------

func_mmmv_exc_is_folder_t1() {
    local S_FP_CANDIDATE="$1" # folder path
    #----------------------------------------------------------------------
    if [ ! -e "$S_FP_CANDIDATE" ]; then 
        echo ""
        echo "The folder"
        echo ""
        echo "    $S_FP_CANDIDATE "
        echo ""
        echo "does not exist."
        echo "GUID=='2e73f332-d7c7-4ef2-a77b-d0b0d02147e7'"
        echo "Aborting without doing anything."
        echo ""
        exit 1 # exit with an error
    fi
    if [ ! -d "$S_FP_CANDIDATE" ]; then 
        echo ""
        echo "The path"
        echo ""
        echo "    $S_FP_CANDIDATE "
        echo ""
        if [ -h "$S_FP_CANDIDATE" ]; then 
            echo "references a symbolic link to a file, "
        else
            echo "references a file, "
        fi
        echo "but it is required to reference a folder."
        echo "GUID=='55f0be32-a027-46b4-847b-d0b0d02147e7'"
        echo "Aborting without doing anything."
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_is_folder_t1

# S_FP_TMP_0="/tmp/fff_testimine"
# S_FP_TMP_FF1="$S_FP_TMP_0/ff1"
# S_FP_TMP_FILE_1="$S_FP_TMP_0/file1.txt"
# S_FP_TMP_0_SYM_FLDR_OK="$S_FP_TMP_0/sym_folder_exists"
# S_FP_TMP_0_SYM_X_MISSING="$S_FP_TMP_0/sym_x_missing"
# S_FP_TMP_0_SYM_FILE_OK="$S_FP_TMP_0/sym_file_exists"
# rm -fr $S_FP_TMP_0
# mkdir -p $S_FP_TMP_FF1
# echo "Hello World :-)" > $S_FP_TMP_FILE_1
# ln -s $S_FP_TMP_FILE_1  $S_FP_TMP_0_SYM_FILE_OK
# ln -s $S_FP_TMP_FF1  $S_FP_TMP_0_SYM_FLDR_OK
# ln -s $S_FP_TMP_FF1/this_does_not_exist $S_FP_TMP_0_SYM_X_MISSING
# 
# # The following assertions must pass:
#     func_mmmv_exc_is_folder_t1 "$S_FP_TMP_FF1"
#     func_mmmv_exc_is_folder_t1 "$S_FP_TMP_0_SYM_FLDR_OK"
#     func_mmmv_exc_is_file_t1 "$S_FP_TMP_FILE_1"
#     func_mmmv_exc_is_file_t1 "$S_FP_TMP_0_SYM_FILE_OK"
# 
# # The following assertions must fail:
#     #func_mmmv_exc_is_folder_t1 "$S_FP_TMP_0_SYM_X_MISSING"
#     #func_mmmv_exc_is_file_t1 "$S_FP_TMP_0_SYM_X_MISSING"
# 
# rm -fr $S_FP_TMP_0
# exit 0

#--------------------------------------------------------------------------

func_mmmv_create_folder_t1(){
    local S_FP_FOLDER="$1" # first function argument
    #--------
    # The reason, why this function is used instead of the 
    #     mkdir -p $S_FP_FOLDER
    # is that there is no guarantee that the 
    #     mkdir -p $S_FP_FOLDER
    # succeeds and it would be a waste of
    # development time to write the file system related
    # tests from scratch every time a folder 
    # needs to be created.
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_FP_FOLDER" == "" ]; then
        echo ""
        echo "The function formal parameter S_FP_FOLDER "
        echo "is expected to be a full path to a folder that "
        echo "either already exists or that has to be created."
        echo "Aborting script."
        echo "GUID=='6b945542-886f-4f1a-877b-d0b0d02147e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
    #--------
    if [ -e "$S_FP_FOLDER" ]; then 
        if [ ! -d "$S_FP_FOLDER" ]; then 
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_FOLDER"
            echo ""
            echo "is a file or a symlink to a file, but it "
            echo "is expected to be a full path to a folder, "
            echo "a symlink to a folder or it should not "
            echo "reference anything that already exists."
            echo "Aborting script."
            echo "GUID=='504f194e-5c3d-4dd0-a37b-d0b0d02147e7'"
            echo ""
            cd "$S_FP_ORIG"
            exit 1 # exit with an error
        fi
    else
        mkdir -p $S_FP_FOLDER
        local S_TMP_0="$?"
        wait # just in case
        sync # for network drives and USB-sticks
        wait # just in case
        if [ "$S_TMP_0" != "0" ]; then 
            func_mmmv_exc_exit_with_an_error_t2 "54540987-3654-4890-85cb-d0b0d02147e7" \
                "S_FP_FOLDER==$S_FP_FOLDER"
        fi
        if [ ! -e "$S_FP_FOLDER" ]; then 
            func_mmmv_exc_exit_with_an_error_t2 "ddf70d40-c16f-4298-92cb-d0b0d02147e7" \
                "Folder creation failed. S_FP_FOLDER==$S_FP_FOLDER"
        fi
    fi
    #--------
} # func_mmmv_create_folder_t1

#--------------------------------------------------------------------------

func_mmmv_exc_assure_tmp_folder_existence_t1() {  # S_FP_TMP, S_GUID
    local S_FP_TMP="$1"
    local S_GUID="$2"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "This function requires 2 parameters: S_FP_TMP, S_GUID"
        echo "GUID=='7b11fa34-9fb7-43d5-a37b-d0b0d02147e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #------------------------------
    if [ ! -e "$S_FP_TMP" ]; then
        if [ -h "$S_FP_TMP" ]; then
            rm -f "$S_FP_TMP" # deletes a broken symlink
            func_mmmv_assert_error_code_zero_t1 \
                "$?" "b56aee28-ed40-4488-95cb-d0b0d02147e7"
            func_mmmv_wait_and_sync_t1
            if [ -h "$S_FP_TMP" ]; then
                echo ""
                echo "The path "
                echo ""
                echo "    $S_FP_TMP"
                echo ""
                echo "points to a broken symlink, but a folder "
                echo "or a symlink to a folder is expected."
                echo "An attempt to delete the broken symlink failed."
                echo "GUID==\"$S_GUID\""
                echo "GUID=='5e221cb3-10a1-497f-8c7b-d0b0d02147e7'"
                echo ""
                #--------
                cd "$S_FP_ORIG"
                exit 1 # exiting with an error
            fi
        fi
        mkdir -p "$S_FP_TMP"
        func_mmmv_assert_error_code_zero_t1 \
            "$?" "7ba3a15b-a1c1-4399-a3bb-d0b0d02147e7"
        func_mmmv_wait_and_sync_t1
        func_mmmv_assert_folder_exists_t1 "$S_FP_TMP" \
            'ba688b45-fa4b-47c2-b17b-d0b0d02147e7'
    else
        if [ ! -d "$S_FP_TMP" ]; then
            echo ""
            if [ -h "$S_FP_TMP" ]; then
                echo "The symlink to an existing file "
            else
                echo "The file "
            fi
            echo ""
            echo "    $S_FP_TMP"
            echo ""
            echo "exists, but a folder or a symlink to a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='324ea844-bf9e-4c15-a27b-d0b0d02147e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_exc_assure_tmp_folder_existence_t1

#--------------------------------------------------------------------------

func_mmmv_ln_create_hardlink_t1() { # S_FP_TARGET  S_FP_LINK
    local S_FP_TARGET="$1" # is allowed to be a broken symlink, but 
                           # must NOT be a folder and must be 
                           # on the same filesystem volume with the S_FP_LINK .

    local S_FP_LINK="$2"   # must not exist during the call of this function .

    local SB_THROW_ON_INVALID_DATA="$3" # Optional.
                                        # Domain: {"t","f","",<unassigned>}.
                                        # default=="t"
    #----------------------------------------------------------------------
    if [ "$SB_THROW_ON_INVALID_DATA" == "" ]; then
        SB_THROW_ON_INVALID_DATA="t"
    else
        if [ "$SB_THROW_ON_INVALID_DATA" != "t" ]; then
            if [ "$SB_THROW_ON_INVALID_DATA" != "f" ]; then
                echo ""
                echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
                echo "Domain(SB_THROW_ON_INVALID_DATA) == "
                echo "    {\"t\",\"f\",\"\",<unassigned>}"
                echo ""
                echo "    SB_THROW_ON_INVALID_DATA==\"$SB_THROW_ON_INVALID_DATA\""
                echo ""
                echo "Aborting script."
                echo "GUID=='17c5e813-07aa-489a-827b-d0b0d02147e7'"
                echo ""
                exit 1 # because of a code defect, not just invalid data.
            fi
        fi
    fi
    local SB_DO_NOT_CREATE_THE_HARDLINK="f" #a fallback for not throwing/exiting
    #----------------------------------------------------------------------
    # The original file and the hardlink share the same inode 
    # and therefore the original file and the hardlink are
    # distinguishable from each other only by their paths. Hardlinks
    # to folders do not exist, can not be made, because that would
    # change a file system tree into a graph that has true loops,
    # not just symlink based loops. Hardlinks form a relation
    # between a file path and an inode of a file. Hardlinks to 
    # symlinks are possible, because symlinks are special purpose files
    # regardless of whether the symlinks reference a folder or a file or another symlink.
    # Revision control systems (Git, Subversion, etc.)
    # can/at_least_sometimes_do break hardlinks by making physical
    # copies of the files that are referenced by hardlinks.
    #
    #     https://superuser.com/questions/12972/how-can-you-see-the-actual-hard-link-by-ls
    #     (archival copy: https://archive.is/8feTw )
    #
    #     http://www.linfo.org/hard_link.html
    #     (archival copy: https://archive.is/HXFYC )
    #
    # Inode numbers can be displayed by executing
    #
    #     ls -l --inode   # short version is: "ls -li "
    # 
    # A 2019_06_30 citation of user "ninjalj" 2017_05_02 comment from  
    # 
    #     https://stackoverflow.com/questions/43733893/when-rm-a-file-but-hard-link-still-there-the-inode-will-be-marked-unused
    #     (archival copy: https://archive.is/5j0cv )
    #     ----citation--start----
    #     i-nodes contain a link count (visible in ls -l output). 
    #     Each hard link increments that count. Unlinking 
    #     (removing a link, be it the original filename->inode 
    #     link, or some hard link added later, which is the only thing 
    #     users can request) decrements the count.  
    #     ----citation--end------
    #
    #----------------------------------------------------------------------
    if [ -e "$S_FP_LINK" ]; then 
        if [ -d "$S_FP_LINK" ]; then # folder or a symlink to a folder
            if [ ! -h "$S_FP_LINK" ]; then # not a symlink, therefore a folder
                echo ""
                echo "The hardlink candidate, the "
                echo ""
                echo "    $S_FP_LINK"
                echo ""
                echo "already exists and it is a folder, not a symlink."
                echo "According to the implementation of this function "
                echo "this is a situation, where there is probably something wrong,"
                echo "because hardlinks can be made only to files and symlinks, "
                echo "regardless of whether the symlinks are broken or not."
                echo "Skipping the creation of the hardlink with the target path of "
                echo ""
                echo "    $S_FP_TARGET"
                echo ""
                echo "GUID=='12eeae34-1f61-4c10-b57b-d0b0d02147e7'"
                echo ""
                if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                    exit 1
                fi
                SB_DO_NOT_CREATE_THE_HARDLINK="t"
            # else # symlink to a folder
            fi
        # else # file or a symlink to a file
        fi
        if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
            echo ""
            echo "According to the specification of this function "
            echo "the hardlink, which in the case of this function call "
            echo "has the path of "
            echo ""
            echo "    $S_FP_LINK"
            echo ""
            echo "must not exist before the call to this function."
            echo "GUID=='34705edb-9c90-4a07-917b-d0b0d02147e7'"
            echo ""
            if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                exit 1
            fi
            SB_DO_NOT_CREATE_THE_HARDLINK="t"
        fi
    else # missing or a broken symlink
        if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
            if [ -h "$S_FP_LINK" ]; then # a broken symlink, therefore NOT missing
                echo ""
                echo "The hardlink candidate, the "
                echo ""
                echo "    $S_FP_LINK"
                echo ""
                echo "already exists and it is a broken symlink. According to "
                echo "the specification of this function the hardlink "
                echo "must not exist before the call to this function."
                echo "GUID=='95730c33-da5a-418d-a57b-d0b0d02147e7'"
                echo ""
                if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                    exit 1
                fi
                SB_DO_NOT_CREATE_THE_HARDLINK="t"
            fi
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
        if [ -e "$S_FP_TARGET" ]; then
            if [ -d "$S_FP_TARGET" ]; then # a folder or a symlink to a folder
                if [ ! -h "$S_FP_TARGET" ]; then # not a symlink, therefore a folder
                    echo ""
                    echo "The hardlink target candidate, the "
                    echo ""
                    echo "    $S_FP_TARGET"
                    echo ""
                    echo "is a folder, not a symlink to a folder. "
                    echo "Hardlinks can be made only to files and symlinks, "
                    echo "regardless of whether the symlinks are broken or not."
                    echo "Skipping the creation of the hardlink with the path of "
                    echo ""
                    echo "    $S_FP_LINK"
                    echo ""
                    echo "GUID=='46b7a7e2-4a9b-4f08-877b-d0b0d02147e7'"
                    echo ""
                    if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                        exit 1
                    fi
                    SB_DO_NOT_CREATE_THE_HARDLINK="t"
                # else # symlink to a folder
                fi
            # else # file or a symlink to a file
            fi
        else # missing or a broken symlink
            if [ ! -h "$S_FP_TARGET" ]; then # not a symlink, therefore missing
                echo ""
                echo "The hardlink target candidate with the path of  "
                echo ""
                echo "    $S_FP_TARGET"
                echo ""
                echo "does not exist. Skipping the creation of a hardlink"
                echo "with the path of "
                echo ""
                echo "    $S_FP_LINK"
                echo ""
                echo "GUID=='77cd3e12-a521-4c12-817b-d0b0d02147e7'"
                echo ""
                if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                    exit 1
                fi
                SB_DO_NOT_CREATE_THE_HARDLINK="t"
            # else # broken symlink
                   # It is possible to create hardlinks to broken symlinks.
            fi
        fi
    fi
    #----------------------------------------------------------------------
    local S_TMP_0="not_set_yet GUID=='7a6dbc22-eb72-49ca-927b-d0b0d02147e7'"
    if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
        ln  "$S_FP_TARGET" "$S_FP_LINK" 
        S_TMP_0="$?"
        if [ "$S_TMP_0" != "0" ]; then
            echo ""
            echo "The creation of a hardlink with the path of "
            echo ""
            echo "    $S_FP_LINK"
            echo ""
            echo "and the target path of "
            echo ""
            echo "    $S_FP_TARGET"
            echo ""
            echo "failed. The ln exited with the error code of $S_TMP_0 ."
            echo "GUID=='9546ca14-c08d-42ca-a47b-d0b0d02147e7'"
            echo ""
            if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                exit 1
            fi
            SB_DO_NOT_CREATE_THE_HARDLINK="t" # here to skip some tests later
        fi
        #------------------------------------------------------------------
        #func_mmmv_wait_and_sync_t1 # inlined at the next 2 lines
        wait # for background processes started by this Bash script to exit/finish
        sync # USB-sticks, etc.
        wait # for sync
        #------------------------------------------------------------------
        if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
            #--------------------------------------------------------------
            S_TMP_0="f" # "t" --- potential error condition detected
                        # "f" --- no error detected
            #--------------------------------------------------------------
            if [ -h "$S_FP_TARGET" ]; then
                # A broken symlink, including a hardlink to a broken symlink
                # gives "false" with the Bash "-e".
                if [ ! -h "$S_FP_LINK" ]; then
                    echo ""
                    echo "Problem detection branch marker "
                    echo "GUID=='1385fe96-b5b9-4784-837b-d0b0d02147e7'"
                    echo ""
                    S_TMP_0="t"
                else
                    if [ -e "$S_FP_TARGET" ]; then # symlink to a folder or a file
                        if [ ! -e "$S_FP_LINK" ]; then
                            echo ""
                            echo "Problem detection branch marker "
                            echo "GUID=='2b416951-7f24-47fe-8b7b-d0b0d02147e7'"
                            echo ""
                            S_TMP_0="t"
                        else
                            if [ -d "$S_FP_TARGET" ]; then
                                if [ ! -d "$S_FP_LINK" ]; then
                                    echo ""
                                    echo "Problem detection branch marker "
                                    echo "GUID=='36afb041-a712-440b-867b-d0b0d02147e7'"
                                    echo ""
                                    S_TMP_0="t"
                                fi
                            else
                                if [ -d "$S_FP_LINK" ]; then
                                    echo ""
                                    echo "Problem detection branch marker "
                                    echo "GUID=='5ae98d59-4c22-4855-b37b-d0b0d02147e7'"
                                    echo ""
                                    S_TMP_0="t"
                                fi
                            fi
                        fi
                    else # broken symlink
                        if [ -e "$S_FP_LINK" ]; then
                            echo ""
                            echo "Problem detection branch marker "
                            echo "GUID=='5ee989f3-2ee5-44b0-b77b-d0b0d02147e7'"
                            echo ""
                            S_TMP_0="t"
                        fi
                    fi
                fi
            else # As the S_FP_LINK can never be a hardlink to a folder and
                 # the S_FP_TARGET is not a symlink at this branch, the 
                 # S_FP_TARGET is a file. Therefore at this branch 
                 # the S_FP_LINK is also a file.
                if [ ! -e "$S_FP_TARGET" ]; then # just an extra test
                    echo ""
                    echo "Problem detection branch marker "
                    echo "GUID=='9914fcac-4e4a-4e2c-847b-d0b0d02147e7'"
                    echo ""
                    S_TMP_0="t"
                else
                    if [ -d "$S_FP_TARGET" ]; then # just an extra test
                        echo ""
                        echo "Problem detection branch marker "
                        echo "GUID=='d5e1173e-8a41-4445-b57b-d0b0d02147e7'"
                        echo ""
                        S_TMP_0="t"
                    else
                        if [ -h "$S_FP_LINK" ]; then
                            echo ""
                            echo "Problem detection branch marker "
                            echo "GUID=='3545e523-3a1a-4d32-a17b-d0b0d02147e7'"
                            echo ""
                            S_TMP_0="t"
                        else
                            if [ ! -e "$S_FP_LINK" ]; then
                                echo ""
                                echo "Problem detection branch marker "
                                echo "GUID=='310607de-5399-4a1c-b47b-d0b0d02147e7'"
                                echo ""
                                S_TMP_0="t"
                            else
                                if [ -d "$S_FP_LINK" ]; then
                                    echo ""
                                    echo "Problem detection branch marker "
                                    echo "GUID=='7169e14f-554b-4bab-857b-d0b0d02147e7'"
                                    echo ""
                                    S_TMP_0="t"
                                fi
                            fi
                        fi
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$S_TMP_0" == "t" ]; then
                echo ""
                echo "The creation of a hardlink with the path of "
                echo ""
                echo "    $S_FP_LINK "
                echo ""
                echo "and the target path of "
                echo ""
                echo "    $S_FP_TARGET"
                echo ""
                echo "might have succeeded, but did not go as expected."
                echo "The ln command succeeded, but there might have been "
                echo "some other operating system processes that altered some "
                echo "related files or folders or symlinks on disk before "
                echo "this Bash function could exit. One possible debugging "
                echo "idea is that it is possible to chain symlinks "
                echo "together by making a symlink to symlink that references "
                echo "a symlink that references "
                echo "a symlink that references "
                echo "a symlink that references "
                echo "a symlink that references ..."
                echo "and the operating system processes might have "
                echo "altered any of the symlinks in the chain, including "
                echo "the file or folder at the very end of the symlink chain."
                echo "GUID=='ace6ee4e-fa79-43e2-a17b-d0b0d02147e7'"
                echo ""
                if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                    exit 1
                fi
            else
                if [ "$S_TMP_0" != "f" ]; then
                    echo ""
                    echo -e "\e[31mThe implementation of this function is flawed. \e[39m"
                    echo "Aborting script."
                    echo "GUID=='4581215d-f29a-4781-b17b-d0b0d02147e7'"
                    echo ""
                    exit 1
                fi
            fi
            #--------------------------------------------------------------
        fi
        #------------------------------------------------------------------
    else
        if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" != "t" ]; then
            echo ""
            echo -e "\e[31mThe implementation of this function is flawed. \e[39m"
            echo "Aborting script."
            echo "GUID=='fa26e12e-3188-4316-847b-d0b0d02147e7'"
            echo ""
            exit 1
        fi
    fi
} # func_mmmv_ln_create_hardlink_t1

#--------------------------------------------------------------------------

func_mmmv_assert_environment_variable_set_t1() { 
    local S_ENVIRONMENT_VARIABLE_NAME="$1"
    local S_GUID_CANDIDATE="$2" 
    local S_OPTIONAL_ERR_MSG="$3" # will be appended to failure-message
    #----------------------------------------------------------------------
    local S_ENVIR_VALUE=""
    local S_SCRIPT_0="S_ENVIR_VALUE=\"\`echo \\\"\$$S_ENVIRONMENT_VARIABLE_NAME\\\" \`\""
    eval "$S_SCRIPT_0"
    if [ "$S_ENVIR_VALUE" == "" ]; then
        echo ""
        echo "The environment variable $S_ENVIRONMENT_VARIABLE_NAME is "
        echo "either not set or it has the value of an empty string."
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then
            printf "%b" "$S_OPTIONAL_ERR_MSG"
        fi
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi 
        echo "GUID=='68705b2a-625b-4c40-917b-d0b0d02147e7'"
        echo ""
        exit 1 # exit with an error
    #else 
         # echo "S_ENVIR_VALUE==\"$S_ENVIR_VALUE\""
    fi
} # func_mmmv_assert_environment_variable_set_t1

#--------------------------------------------------------------------------

func_mmmv_ar_ls_t1() { # S_ARRAY_VARIABLE_NAME S_FP_LS
    local S_ARRAY_VARIABLE_NAME="$1"
    local S_FP_LS="$2"
    #----------------------------------------------------------------------
    # The "ls -m " works on both, BSD and Linux.
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
    if [ -z "$IFS" ]; then  # The "-z" returns true, if the string length is zero.
        unset IFS
    fi
} # func_mmmv_ar_ls_t1

# Test/demo code:
#    func_mmmv_ar_ls_t1 "AR_X" "$HOME"
# 
#    AR_2=${AR_X[@]}  # flawed array assignment that tokenizes by space
#    S_TMP=${#AR_X[@]}
#    echo "AR_X length: $S_TMP"
#    echo ""
#    for s_iter in ${AR_X[@]}; do
#         echo "AR_X element:[$s_iter]" 
#    done
#--------------------------------------------------------------------------

func_mmmv_exec_with_every_ar_element_t1() { # S_CMD_PART_0  S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1 S_CMD_PART_2
    local S_CMD_PART_0="$1"
    local S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1="$2"
    local S_CMD_PART_2="$3"
    #----------------------------------------------------------------------
    local S_SCRIPT_0=""
    local S_SCRIPT_1=""
    local S_SCRIPT_2=""
    local S_SCRIPT_x0=""
    local S_SCRIPT_x1=""
    local S_SCRIPT_x2=""
    #----------------
    # Wastefully left uncommented to detect flaws and to make life more comfortable :-)
    local S_TMP=""
    S_SCRIPT_0="S_TMP=\${#"
    S_SCRIPT_1="$S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1"
    S_SCRIPT_2="[@]}"
    eval "$S_SCRIPT_0$S_SCRIPT_1$S_SCRIPT_2" 
    #echo "The length of the $S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1 is: $S_TMP"
    #----------------
    # The newline trick 
    local S_NEWLINE=$'\n'
    # originates from the answer of Gordon Davisson:
    # https://stackoverflow.com/questions/17821277/how-to-separate-multiple-commands-passed-to-eval-in-bash
    # archival copy: https://archive.fo/7XI3a 
    #--------
    local S_ITER=""
    S_SCRIPT_0="for S_ITER in \${$S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1[@]}; do " 
    S_SCRIPT_x0="echo \"\"; echo \"\$S_ITER\""
    #S_SCRIPT_1="echo \"\$S_ITER\" " 
    S_SCRIPT_1="$S_CMD_PART_0 \$S_ITER  $S_CMD_PART_2 ;" 
    S_SCRIPT_x1="echo \"\""
    S_SCRIPT_2="done"
    S_SCRIPT_x2=""
    #----
    local S_TMP_0="$S_SCRIPT_0$S_NEWLINE$S_SCRIPT_x0$S_NEWLINE"
    local S_TMP_1="$S_SCRIPT_1$S_NEWLINE$S_SCRIPT_x1$S_NEWLINE"
    local S_TMP_2="$S_SCRIPT_2$S_NEWLINE$S_SCRIPT_x2$S_NEWLINE"
    eval "$S_TMP_0$S_TMP_1$S_TMP_2"
} # func_mmmv_exec_with_every_ar_element_t1

#--------------------------------------------------------------------------

func_mmmv_ar_range_t1() { #S_ARRAY_VARIABLE_NAME I_MINIMUM_INDEX I_MAXIMUM_INDEX
    local S_ARRAY_VARIABLE_NAME="$1"
    local I_MIN=$2
    local I_MAX_PLUS_ONE=`expr $3 + 1`
    #----------------------------------------------------------------------
    local S_SCRIPT_0="$S_ARRAY_VARIABLE_NAME=()"
    eval "$S_SCRIPT_0"
    local i_n=""
    S_SCRIPT_0="$S_ARRAY_VARIABLE_NAME+=(\$i_n)"
    for ((i_n=$I_MIN;i_n<$I_MAX_PLUS_ONE;i_n++))
    do
        eval "$S_SCRIPT_0"
    done
} # func_mmmv_ar_range_t1

# Test/demo code:
#     S_TMP="9"
#     func_mmmv_ar_range_t1 "AR_A_GLOBAL_VARIABLE" 4 $S_TMP
#     for s_iter in ${AR_A_GLOBAL_VARIABLE[@]}; do
#             echo "s_iter==[$s_iter]"
#     done
#--------------------------------------------------------------------------

func_mmmv_create_array_t1() {
    local ARRR=()
    #------- 
    ARRR+=("first value as string")
    ARRR+=("second value as string") 
    ARRR+=("third value as string")
    ARRR+=("fourth value as string")
    #------- 
    export ARRR_sz=`declare -p ARRR`
} # func_mmmv_create_array_t1

#--------------------------------------------------------------------------

func_mmmv_iterate_over_array_02n_t1() {
    local S_ARRAY_VARIABLE_NAME="$1" 
    local S_ARRAY_SERIALIZED="$2" # `declare -p VARIABLENAME` or an empty string
    local S_ITERATION_FUNCTION_NAME="$3" # that accepts "$s_iter" as a parameter
    #----------------------------------------------------------------------
    eval ${S_ARRAY_SERIALIZED}
    #-------
    local S_SCRIPT_0="local S_LEN=\${#$S_ARRAY_VARIABLE_NAME[@]}"
    eval ${S_SCRIPT_0}
    #echo "ARRR length: $S_LEN"
    local I_MAX=`expr $S_LEN + 0`
    #-------
    local i_n=42
    local s_iter=""
    local S_SCRIPT_LINE_1="for ((i_n=0;i_n<\$I_MAX;i_n++))"
    local S_SCRIPT_LINE_2="s_iter=\${$S_ARRAY_VARIABLE_NAME[\$i_n]}"
    local S_SCRIPT_LINE_3="$S_ITERATION_FUNCTION_NAME \"\$s_iter\""
    S_SCRIPT_0="$S_SCRIPT_LINE_1 "$'\n'"do"$'\n'"$S_SCRIPT_LINE_2 "$'\n'"$S_SCRIPT_LINE_3 "$'\n'"done"
    #echo "$S_SCRIPT_0"
    eval "$S_SCRIPT_0"
} # func_mmmv_iterate_over_array_02n_t1

# Test/demo code:
#     func_iter() {
#         local S_ITER="$1"
#         echo "Greetings from func_iter: $S_ITER"
#     } # func_iter
#     
#     func_mmmv_create_array_t1
#     func_mmmv_iterate_over_array_02n_t1 "ARRR" "$ARRR_sz" "func_iter"
#--------------------------------------------------------------------------

func_mmmv_sb_head_exists_t1() { # S_OUTPUT_VARIABLE_NAME, S_HEAD_REGEX , S_HAYSTACK
    local S_OUTPUT_VARIABLE_NAME="$1"
    local S_HEAD_REGEX="$2"
    local S_HAYSTACK="$3"
    #----------------------------------------------------------------------
    local S_SCRIPT_0="$S_OUTPUT_VARIABLE_NAME=\"f\""
    eval "$S_SCRIPT_0"
    local S_NUMBER_OF_MATCHING_CHARACTERS=`expr match "$S_HAYSTACK" "$S_HEAD_REGEX"`
    if [ "$S_NUMBER_OF_MATCHING_CHARACTERS" != "0" ]; then
        S_SCRIPT_0="$S_OUTPUT_VARIABLE_NAME=\"t\""
        eval "$S_SCRIPT_0"
    fi
} # func_mmmv_sb_head_exists_t1 

# Test/demo code:
#     S_RGX="/home/ts2/tmp"
#     S_FP="/home/ts2/tmp/uuuuu/eee"
#     
#     func_mmmv_sb_head_exists_t1 "S_CC" $S_RGX $S_FP
#     echo "S_CC: $S_CC"
#--------------------------------------------------------------------------

func_mmmv_include_bashfile_if_possible_t1(){ # S_FP_BASHFILE S_GUID_CANDIDATE SB_THROW_ON_ERROR
    local S_FP_BASHFILE="$1" # Full path to the file   
    local S_GUID_CANDIDATE="$2" 
    local SB_THROW_ON_ERROR="$3" # ~/.bashrc must not call the "exit" command.
                                 # If the SB_THROW_ON_ERROR=="t", the 
                                 # "exit" command can be called in case of error.
                                 # If the SB_THROW_ON_ERROR=="f", the 
                                 # "exit" command will not be called, 
                                 # only an error message is printed to console.
                                 # default: "f"
    #----------------------------------------------------------------------
    if [ "$SB_THROW_ON_ERROR" == "" ]; then
        SB_THROW_ON_ERROR="f" # the default value
    else
        if [ "$SB_THROW_ON_ERROR" != "t" ]; then
            if [ "$SB_THROW_ON_ERROR" != "f" ]; then
                echo ""
                echo "The SB_THROW_ON_ERROR(==$SB_THROW_ON_ERROR)"
                echo "has a wrong vaue. Only \"t\" and \"f\" are allowed."
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi 
                echo "GUID=='311c5207-31c9-43d9-b17b-d0b0d02147e7'"
                echo ""
            fi
        fi
    fi
    #-----------------------------------------
    local SB_INCLUSION_POSSIBLE="t"
    if [ "$S_FP_BASHFILE" == "" ]; then
        SB_INCLUSION_POSSIBLE="f"
        echo ""
        echo "The S_FP_BASHFILE had a value of an empty string."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi 
        echo "GUID=='ee3aa31f-4af7-4103-b46b-d0b0d02147e7'"
        echo ""
        if [ "$SB_THROW_ON_ERROR" == "t" ]; then
            exit 1
        fi
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ ! -e "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "does not exist or it is a broken symlink."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='5c69dc47-1694-4a7c-816b-d0b0d02147e7'"
            echo ""
            if [ "$SB_THROW_ON_ERROR" == "t" ]; then
                exit 1
            fi
        fi
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ -d "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "references a folder, but it must reference a file."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='9d524c13-9e71-4893-836b-d0b0d02147e7'"
            echo ""
            if [ "$SB_THROW_ON_ERROR" == "t" ]; then
                exit 1
            fi
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        source "$S_FP_BASHFILE"
    else
        if [ "$SB_INCLUSION_POSSIBLE" != "f" ]; then
            echo ""
            echo -e "\e[31mThe implementation of this function is flawed. \e[39m"
            echo "SB_INCLUSION_POSSIBLE==$SB_INCLUSION_POSSIBLE"
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='59a50eb2-3093-4d37-a46b-d0b0d02147e7'"
            echo ""
            if [ "$SB_THROW_ON_ERROR" == "t" ]; then
                exit 1 
            fi
        fi
    fi
} # func_mmmv_include_bashfile_if_possible_t1

#--------------------------------------------------------------------------

func_mmmv_include_bashfile_if_possible_t2(){ # S_FP_BASHFILE S_GUID_CANDIDATE 
    local S_FP_BASHFILE="$1" # Full path to the file   
    local S_GUID_CANDIDATE="$2" 
    #----------------------------------------------------------------------
    # ~/.bashrc must not call the "exit" command.
    #-----------------------------------------
    local SB_INCLUSION_POSSIBLE="t"
    if [ "$S_FP_BASHFILE" == "" ]; then
        SB_INCLUSION_POSSIBLE="f"
        echo ""
        echo "The S_FP_BASHFILE had a value of an empty string."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi 
        echo "GUID=='4aa48f21-008f-4eb6-826b-d0b0d02147e7'"
        echo ""
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ ! -e "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "does not exist or it is a broken symlink."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='50cbf73a-4606-4a93-936b-d0b0d02147e7'"
            echo ""
        fi
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ -d "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "references a folder, but it must reference a file."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='17823c44-d845-440e-b16b-d0b0d02147e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        source "$S_FP_BASHFILE"
        func_mmmv_wait_and_sync_t1
        S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # to restore its value
    else
        if [ "$SB_INCLUSION_POSSIBLE" != "f" ]; then
            echo ""
            echo -e "\e[31mThe implementation of this function is flawed. \e[39m"
            echo "SB_INCLUSION_POSSIBLE==$SB_INCLUSION_POSSIBLE"
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='2109105c-f16d-47c7-b26b-d0b0d02147e7'"
            echo ""
        fi
    fi
} # func_mmmv_include_bashfile_if_possible_t2

#--------------------------------------------------------------------------

func_mmmv_assert_exists_on_path_t1() {
    local S_NAME_OF_THE_EXECUTABLE="$1" # first function argument
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    local S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE 2>/dev/null\`"
    local S_TMP_1=""
    local S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    if [ "$S_TMP_1" == "" ]; then
        S_TMP_0="This bash script requires the \""
        S_TMP_1="\" to be on the PATH."
        S_TMP_2="$S_TMP_0$S_NAME_OF_THE_EXECUTABLE$S_TMP_1"
        #--------
        echo ""
        echo "$S_TMP_2"
        echo "GUID=='b5e55b55-24c6-446c-a36b-d0b0d02147e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_assert_exists_on_path_t1

# Test/demo code:
#     func_mmmv_assert_exists_on_path_t1 "ruby"
#     func_mmmv_assert_exists_on_path_t1 "rubyy"
#--------------------------------------------------------------------------

func_mmmv_ln_create_or_overwrite_symlink_t1() { # S_FP_TARGET  S_FP_LINK
    local S_FP_TARGET="$1"
    local S_FP_LINK="$2"
    #----------------------------------------------------------------------
    local S_CMD_LN="ln -s $S_FP_TARGET $S_FP_LINK"
    if [ -e "$S_FP_LINK" ]; then
        local S_FP_OLDTARGET="`readlink $S_FP_LINK`"
        if [ "$S_FP_OLDTARGET" != "$S_FP_TARGET" ]; then
            rm -f $S_FP_LINK
            $S_CMD_LN
        fi
    else
        $S_CMD_LN
    fi
    if [ ! -e "$S_FP_LINK" ]; then
        echo ""
        echo ""
        echo -e "\e[31mBash function execution failed.  \e[39m"
        echo "Could not execute the command:"
        echo "$S_CMD_LN"
        echo ""
        echo "PWD==`pwd`"
        echo "GUID=='a4aa85b8-92f1-4cfd-846b-d0b0d02147e7'"
        echo ""
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_ln_create_or_overwrite_symlink_t1

#--------------------------------------------------------------------------

func_mmmv_operatingsystem_is_Linux() { # S_OUTPUT_VARIABLE_NAME
    local S_OUTPUT_VARIABLE_NAME="$1"
    #----------------------------------------------------------------------
    local S_OUT="f"
    local S_X="`uname -a | grep -l Linux `"
    if [ "$S_X" == "(standard input)" ]; then
        S_OUT="t"
    fi
    local S_SCRIPT_0="$S_OUTPUT_VARIABLE_NAME=\"$S_OUT\""
    eval ${S_SCRIPT_0}
    # echo "ANSWER: $S_OUT"
} # func_mmmv_operatingsystem_is_Linux

#--------------------------------------------------------------------------

func_mmmv_operatingsystem_is_FreeBSD() { # S_SB_ANSWER
    local S_OUTPUT_VARIABLE_NAME="$1"
    #----------------------------------------------------------------------
    local S_OUT="f"
    local S_X="`uname -a | grep -l FreeBSD`"
    if [ "$S_X" == "(standard input)" ]; then
        S_OUT="t"
    fi
    local S_SCRIPT_0="$S_OUTPUT_VARIABLE_NAME=\"$S_OUT\""
    eval ${S_SCRIPT_0}
    # echo "ANSWER: $S_OUT"
} # func_mmmv_operatingsystem_is_FreeBSD

#--------------------------------------------------------------------------

func_mmmv_determine_operatingsystem_t1() {
    local SB_TMP_0_orig="$SB_TMP_0"
        func_mmmv_operatingsystem_is_Linux "SB_TMP_0"
        if [ "$SB_TMP_0" == "t" ]; then
            export S_MMMV_OPERATING_SYSTEM="linux"
        fi
        func_mmmv_operatingsystem_is_FreeBSD "SB_TMP_0"
        if [ "$SB_TMP_0" == "t" ]; then
            export S_MMMV_OPERATING_SYSTEM="freebsd"
        fi
    export SB_TMP_0="$SB_TMP_0_orig"
} # func_mmmv_determine_operatingsystem_t1

# Test/demo code:
#     func_mmmv_operatingsystem_is_Linux "S_OUTPUT_VARIABLE_NAME"
#     func_mmmv_operatingsystem_is_FreeBSD "S_SB_ANSWER"
#     func_mmmv_determine_operatingsystem_t1
#--------------------------------------------------------------------------

func_mmmv_exit_if_environment_variable_not_set_t1() { # S_ENVIRONMENT_VARIABLE_NAME
    local S_ENVIRONMENT_VARIABLE_NAME="$1"
    local S_ENVIRONMENT_VARIABLE_DOCSTRING="$2" # will be appended to failure-message
    #----------------------------------------------------------------------
    local S_ENVIR_VALUE=""
    local S_SCRIPT_0="S_ENVIR_VALUE=\"\`echo \$$S_ENVIRONMENT_VARIABLE_NAME\`\""
    eval "$S_SCRIPT_0"
    if [ "$S_ENVIR_VALUE" == "" ]; then
        echo ""
        echo "The environment variable $S_ENVIRONMENT_VARIABLE_NAME is not set, but "
        echo "it must be set or this script will not run (properly)."
        if [ "$S_ENVIRONMENT_VARIABLE_DOCSTRING" != "" ]; then
            echo ""
            echo "$S_ENVIRONMENT_VARIABLE_DOCSTRING"
        fi
        echo ""
        exit 1;
    #else 
         # echo "S_ENVIR_VALUE==\"$S_ENVIR_VALUE\""
    fi
} # func_mmmv_exit_if_environment_variable_not_set_t1

# Test/demo code:
#     func_mmmv_exit_if_environment_variable_not_set_t1 "CFLAGS" 

#--------------------------------------------------------------------------

func_mmmv_assert_Linux_or_BSD_t1(){
    local S_GUID_CANDIDATE="$1"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mS_GUID_CANDIDATE==\"\", but it is expected to be a GUID. \e[39m"
        echo "GUID=='7fa4a459-d027-44f6-816b-d0b0d02147e7'"
        echo ""
        # if [ "$S_FP_ORIG" != "" ]; then
        #     func_mmmv_exc_verify_S_FP_ORIG_t1
        #     cd "$S_FP_ORIG"
        # fi
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi 
    #--------------------
    #S_TMP_0="`uname -a | grep -E \"([Ll][Ii][Nn][Uu][Xx]|[Bb][Ss][Dd]|[Cc][Yy][Gg][Ww][Ii][Nn])\"`"
    S_TMP_0="`uname -a | grep -E \"([Ll][Ii][Nn][Uu][Xx]|[Bb][Ss][Dd])\"`"
    if [ "$S_TMP_0" == "" ]; then
        echo ""
        echo "The classical command line utilities at "
        echo "different operating systems, for example, Linux and BSD,"
        echo "differ. This script is designed to run only on Linux and BSD."
        echo "If You are willing to risk that some of Your data "
        echo "is deleted and/or Your operating system instance"
        echo "becomes permanently flawed, to the point that "
        echo "it will not even boot, then You may edit the Bash script that "
        echo "calls the function that displays this error message "
        echo "by uncommenting that function."
        echo ""
        echo "If You do decide to edit the Bash script, then "
        echo "a recommendation is to test Your modifications "
        echo "within a virtual appliance or, if virtual appliances are not"
        echo "an option, as some new operating system user that does not have "
        echo "any access to the vital data/files."
        echo ""
        echo "Aborting script without doing anything."
        echo ""
        echo "GUID=='9903c51d-7a7d-40ef-a16b-d0b0d02147e7'"
        echo ""
        # if [ "$S_FP_ORIG" != "" ]; then
        #     func_mmmv_exc_verify_S_FP_ORIG_t1
        #     cd "$S_FP_ORIG"
        # fi
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_assert_Linux_or_BSD_t1

#--------------------------------------------------------------------------
#S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$S_FP_DIR" == "" ]; then
    echo ""
    echo "It is assumed that the environment variable S_FP_DIR"
    echo "is defined before this Bash script is included."
    echo -e "\e[31mExiting with an error. \e[39m"
    echo "GUID=='c9ff2627-b852-47cc-856b-d0b0d02147e7'"
    echo ""
    if [ "$S_FP_ORIG" != "" ]; then
        func_mmmv_exc_verify_S_FP_ORIG_t1
        cd "$S_FP_ORIG"
    fi
    exit 1
fi
#-------------------------------------------
if [ "$S_FP_ORIG" == "" ]; then
    echo ""
    echo "It is assumed that the environment variable S_FP_ORIG"
    echo "is defined before this Bash script is included."
    echo -e "\e[31mExiting with an error. \e[39m"
    echo "GUID=='11ae4210-2356-442b-956b-d0b0d02147e7'"
    echo ""
    exit 1
else
    func_mmmv_exc_verify_S_FP_ORIG_t2
fi

#==========================================================================
S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
S_SUFFIX_TIMESTAMP="_$S_TIMESTAMP"

#--------------------------------------------------------------------------

func_msg_01(){
    #------------------------------
    echo ""
    echo -e "\e[32m"
    echo "    DISPLAY==\"$DISPLAY\""
    echo -e "\e[39m"
    echo "The file "
    echo ""
    echo -e "\e[32m    $S_FP_XAUTHORITY_WSL\e[39m"
    echo ""
    echo "contains passwords (\"MIT-MAGIC-COOKIE-1\") for the following displays:"
    echo -e "\e[32m"
    xauth -f "$S_FP_XAUTHORITY_WSL" list
    echo -e "\e[39m"
    echo "GUID=='77dc375b-3861-4a2d-a16b-d0b0d02147e7'"
    echo ""
    #------------------------------
} # func_msg_01

#--------------------------------------------------------------------------

func_main(){
    #----------------------------------------------------------------------
    func_mmmv_assert_exists_on_path_t1 "ruby"
    func_mmmv_assert_exists_on_path_t1 "sed"
    func_mmmv_assert_exists_on_path_t1 "grep"
    func_mmmv_assert_exists_on_path_t1 "rev"
    func_mmmv_assert_exists_on_path_t1 "tr"
    func_mmmv_assert_exists_on_path_t1 "xauth"
    #----------------------------------------------------------------------
    if [ "`sed --help 2> /dev/null | grep -i GNU `" == "" ]; then
        echo ""
        echo -e "\e[31mThis script assumes that the \"sed\" is the GNU sed, not BSD sed.\e[39m"
        echo "GUID=='53811cd4-5d18-4524-b36b-d0b0d02147e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
    #----------------------------------------------------------------------
    # Assuming that the sed is the GNU sed, not BSD sed.
    export DISPLAY="`/mnt/c/Windows/SysWOW64/ipconfig.exe | grep -A 8 'vEthernet' | grep -A 7 ' (WSL)' | grep 'IPv4 Address' | sed -e 's/\([[:alpha:]]\|[[:blank:]]\|[[:space:]]\|:\)/X/g' | sed -e 's/X4X/X/g' | sed -e 's/\.X/X/g' | sed -e 's/X//g' `:0"
    #echo "DISPLAY==$DISPLAY"
    #----------------------------------------------------------------------
    S_TMP_32_HEXDIGITS="`ruby -e \"s=''; 32.times{s<<(rand(16).to_s(16))}; printf(s)\"`"
    S_FP_XAUTHORITY_WSL="$XAUTHORITY"
    if [ "$S_FP_XAUTHORITY_WSL" == "" ]; then
        S_FP_XAUTHORITY_WSL="$HOME/.Xauthority" # the default
    fi
    xauth -f "$S_FP_XAUTHORITY_WSL" add "$DISPLAY" . "$S_TMP_32_HEXDIGITS"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "2e0f4712-566d-47d1-9ebb-d0b0d02147e7"
    #func_msg_01
    #----------------------------------------------------------------------
    # The 
    S_WIN_FP_WINDOWS_HOME="`cd /mnt/c/Windows/Temp ; /mnt/c/Windows/System32/cmd.exe  \"/C\" \"echo %USERPROFILE%\" `";
    # returns something like "C:\Users\MyAwesomeWindowsUsername"
    S_WINDOWS_USERNAME="`echo \"$S_WIN_FP_WINDOWS_HOME\" | rev | sed -e 's/\\\\.\\+\$//g' | rev | tr -d '\n\r' `"
    #printf "%q" "$S_WINDOWS_USERNAME" # == "MyAwesomeWindowsUsername", without quotation marks.
    S_FP_WINDOWS_HOME="/mnt/c/Users/$S_WINDOWS_USERNAME"
    #----------------------------------------------------------------------
    S_FP_WINDOWS_WSL="$S_FP_WINDOWS_HOME/WSL"     # is allowed to be something else
    S_FP_WINDOWS_WSL_TMP="$S_FP_WINDOWS_WSL/tmp_" # is allowed to be something else
    mkdir -p "$S_FP_WINDOWS_WSL_TMP"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "156d84a4-ca58-42f3-bdbb-d0b0d02147e7"
    S_FP_WINDOWS_WSL_TMP_XA="$S_FP_WINDOWS_WSL_TMP/old_Xauthority"
    mkdir -p "$S_FP_WINDOWS_WSL_TMP_XA"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "368f02e2-176d-452b-9cbb-d0b0d02147e7"
    S_FP_WINDOWS_XAUTHORITY="$S_FP_WINDOWS_WSL/_Xauthority"
    S_FP_WINDOWS_XAUTHORITY_WIN="C:\\Users\\$S_WINDOWS_USERNAME\\WSL\\_Xauthority"
    S_FP_WINDOWS_XAUTHORITY_OLD="$S_FP_WINDOWS_WSL_TMP_XA/_Xauthority$S_SUFFIX_TIMESTAMP"
    #----------------------------------------------------------------------
    if [ -e "$S_FP_WINDOWS_XAUTHORITY_OLD" ]; then
        echo ""
        echo "The "
        echo ""
        echo -e "\e[31m    $S_FP_WINDOWS_XAUTHORITY_OLD \e[39m"
        echo ""
        echo -e "\e[31malready exists.\e[39m"
        echo "GUID=='0281c58a-1b5d-4ce6-9c1b-d0b0d02147e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
    if [ -e "$S_FP_WINDOWS_XAUTHORITY" ]; then
        mv "$S_FP_WINDOWS_XAUTHORITY" "$S_FP_WINDOWS_XAUTHORITY_OLD"
        func_mmmv_assert_error_code_zero_t1 "$?" \
            "26e64d36-05da-4bcc-a2bb-d0b0d02147e7"
    fi
    #----------------------------------------------------------------------
    cp "$S_FP_XAUTHORITY_WSL" "$S_FP_WINDOWS_XAUTHORITY"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "281c554f-acd3-4cf7-94bb-d0b0d02147e7"
    #----------------------------------------------------------------------
    S_FP_WINDOWS_X_LOGFILES="$S_FP_WINDOWS_WSL_TMP/X_logfiles"
    mkdir -p "$S_FP_WINDOWS_X_LOGFILES"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "9f34405b-d597-4f9c-93bb-d0b0d02147e7"
    #S_FP_WINDOWS_X_LOG="$S_FP_WINDOWS_WSL_TMP/X_logfiles/X_log_$S_TIMESTAMP.txt"
    S_FP_WINDOWS_X_LOG_WIN="C:\\Users\\$S_WINDOWS_USERNAME\\WSL\\tmp_\\X_logfiles\\X_log_$S_TIMESTAMP.txt"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "5bf0ce32-126a-48e7-a1ab-d0b0d02147e7"
    #----------------------------------------------------------------------
    # C:\Program Files (x86)\VcXsrv\vcxsrv.exe
    S_FP_VCXSRV_EXE='/mnt/c/Program Files (x86)/VcXsrv/vcxsrv.exe' # single quotes are to avoid backslashes.
    if [ ! -e "$S_FP_VCXSRV_EXE" ]; then
        echo ""
        echo "The "
        echo ""
        echo -e "\e[31m    $S_FP_VCXSRV_EXE \e[39m"
        echo ""
        echo "does not exist. Please update the "
        echo -e "value of the variable\e[31m S_FP_VCXSRV_EXE \e[39m ."
        echo "GUID=='2167e2e2-8bb7-4746-b51b-d0b0d02147e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    else
        func_mmmv_assert_file_exists_t1 "$S_FP_VCXSRV_EXE" \
            '43d5dadb-b83c-4523-b41b-d0b0d02147e7'
    fi
    #----------------------------------------------------------------------
    # Most of the line
    #
    #     vcxsrv.exe -multiwindow -clipboard -wgl -auth {.XAuthority file} -logfile {A Log file} -logverbose {int log level}
    #
    # has been copy-pasted from the 
    #
    #     https://sourceforge.net/p/vcxsrv/wiki/VcXsrv%20%26%20Win10/
    #
    #----------------------------------------------------------------------
    S_FP_WINDOWS_BAT="$S_FP_WINDOWS_WSL_TMP/start_VcXsrv.bat"
    rm -f "$S_FP_WINDOWS_BAT"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "31470902-2099-4a95-93ab-d0b0d02147e7"
    #------------------------------
    echo "cd C:/" > $S_FP_WINDOWS_BAT
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "215a6d52-4614-422c-85ab-d0b0d02147e7"
    echo "cd \"Program Files (x86)\"" >> $S_FP_WINDOWS_BAT
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "de782112-50ec-4f2f-93ab-d0b0d02147e7"
    echo "cd VcXsrv" >> $S_FP_WINDOWS_BAT
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "d8cae252-fc18-4210-91ab-d0b0d02147e7"
    #------------------------------
    SI_LOGLEVEL="1"
    echo "vcxsrv.exe -multiwindow -clipboard -wgl -auth $S_FP_WINDOWS_XAUTHORITY_WIN -logfile $S_FP_WINDOWS_X_LOG_WIN -logverbose $SI_LOGLEVEL" >> $S_FP_WINDOWS_BAT 
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "9c914c4b-ad57-43f6-b5ab-d0b0d02147e7"
    #------------------------------
    func_mmmv_assert_file_exists_t1 "$S_FP_WINDOWS_BAT" \
        '3a77cb71-fc2b-4403-9d1b-d0b0d02147e7'
    #----------------------------------------------------------------------
    echo ""
    echo "Please add "
    echo ""
    echo -e "\e[32m    export DISPLAY=\"$DISPLAY\"\e[39m"
    echo ""
    echo "to the ~/.bashrc and please execute the "
    echo ""
    echo -e "\e[32m    $S_FP_WINDOWS_BAT\e[39m"
    echo ""
    echo "from the Windows side."
    if [ "`which xeyes 2>/dev/null`" != "" ]; then
        echo -e "You might want to use the program \e[32m xeyes \e[39m "
        echo "to test, whether the settings work."
    fi
    echo "Thank You."
    echo ""
    echo "GUID=='bd1e962c-49c0-41f1-831b-d0b0d02147e7'"
    echo ""
    #----------------------------------------------------------------------
} # func_main

func_main
#==========================================================================
# S_VERSION_OF_THIS_FILE="59c6a31a-8a88-4d1d-b1ab-d0b0d02147e7"
#==========================================================================
