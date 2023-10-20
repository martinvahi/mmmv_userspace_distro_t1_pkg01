#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------

func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
    wait # for sync to finish
} # func_mmmv_wait_and_sync_t1

#--------------------------------------------------------------------------

func_mmmv_exc_verify_S_FP_ORIG_t1() {
    if [ "$S_FP_ORIG" == "" ]; then
        echo ""
        echo "The code of this script is flawed."
        echo "The environment variable S_FP_ORIG is expected "
        echo "to be initialized at the start of the script by "
        echo ""
        echo "    S_FP_ORIG=\"\`pwd\`\""
        echo ""
        echo "Aborting script."
        echo "GUID=='7aa66320-0ab8-4049-b518-73f1d031a7e7'"
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
        echo "Aborting script."
        echo "GUID=='b88e2838-97dc-460a-a518-73f1d031a7e7'"
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
        echo "Aborting script."
        echo "GUID=='136dbe31-4f78-44c9-9f18-73f1d031a7e7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t1(){
    local S_GUID_CANDIDATE="$1" # first function argument
    func_mmmv_exc_verify_S_FP_ORIG_t1
    #--------
    echo ""
    echo "The code of this script is flawed."
    echo "Aborting script."
    if [ "$S_GUID_CANDIDATE" != "" ]; then 
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
    fi
    echo "GUID=='15585df1-beb4-4465-8818-73f1d031a7e7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1 # exit with an error
} # func_mmmv_exc_exit_with_an_error_t1

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='79fcc05d-cf6b-4bfb-9518-73f1d031a7e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

func_mmmv_exit_if_not_on_path_t2 "cat"
func_mmmv_exit_if_not_on_path_t2 "grep"

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
        echo "GUID=='c9af8c1c-bfb6-422a-b418-73f1d031a7e7'"
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
        echo "GUID=='37cade36-c0f3-4a24-9318-73f1d031a7e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
    func_mmmv_wait_and_sync_t1
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
    #------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo "The Bash code that calls this function is flawed."
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "Aborting script."
        echo "GUID=='3d88a415-3628-4eba-a118-73f1d031a7e7'"
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
        echo "Aborting script."
        echo "GUID=='ed610939-c82b-43c6-9218-73f1d031a7e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t2

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='26763d3f-f694-4e4f-b318-73f1d031a7e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but a file or "
            echo "a symlinkt to a file is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='ad6d0557-72b2-4772-9318-73f1d031a7e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            echo "The file "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='c680a844-a229-4739-8418-73f1d031a7e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ -d "$S_FP" ]; then
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
            echo "GUID==\"$S_GUID\""
            echo "GUID=='d4f5eb22-ae58-49a4-a518-73f1d031a7e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
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
    #------------------------------
    local SB_LACK_OF_PARAMETERS="f"
    if [ "$S_FP" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$SB_LACK_OF_PARAMETERS" == "t" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters, which are "
        echo "S_FP, S_GUID_CANDIDATE, and it has an optional 3. parameter, "
        echo "which is SB_OPTIONAL_BAN_SYMLINKS."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='49ee094e-d921-4e97-a518-73f1d031a7e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo "This code is flawed."
            echo "GUID=='3df005b3-ca70-476b-8618-73f1d031a7e7'"
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
                echo "GUID=='3a71ef32-2368-45e7-8318-73f1d031a7e7'"
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
            echo "GUID=='a4e3e432-9708-4943-b418-73f1d031a7e7'"
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
            echo "GUID=='145250f4-bab8-4bdd-a518-73f1d031a7e7'"
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
            echo "GUID=='595a59cd-c73c-4dd5-9118-73f1d031a7e7'"
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
                    echo "GUID=='fff06429-024a-441c-a118-73f1d031a7e7'"
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

func_angervaks_optionally_update_GUIDs_in_bashrc(){
    #--------
    if [ "$SB_RUBY_EXISTS_ON_PATH" != "t" ]; then # includes the value of ""
        SB_RUBY_EXISTS_ON_PATH="f" # global variable
        if [ "`which ruby 2> /dev/null`" != "" ]; then
            # The Ruby version might be wrong, but at least 
            # something called "ruby" is on PATH.
            SB_RUBY_EXISTS_ON_PATH="t" 
        fi
    fi
    #--------
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        func_mmmv_wait_and_sync_t1 # just in case, just for reliability
        S_FP_UPGUID_BASH="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_devel_tools/2015_01_22_mmmv_devel_tools_without_JumpGUID_and_IDE_integration_v_02_with_UpGUID_bugfix/src/mmmv_devel_tools/GUID_trace/src/UpGUID/src/upguid"
        func_mmmv_assert_file_exists_t1 "$S_FP_UPGUID_BASH" \
            "e99cb210-a5e8-4aa9-9218-73f1d031a7e7"
        $S_FP_UPGUID_BASH -f $S_FP_BASHRC
        func_mmmv_assert_error_code_zero_t1 "$?" \
            "dd01cd40-35d6-4071-b418-73f1d031a7e7"
        func_mmmv_wait_and_sync_t1
    fi
    #--------
} # func_angervaks_optionally_update_GUIDs_in_bashrc

#--------------------------------------------------------------------------
S_FP_BASHRC="$HOME/.bashrc"

func_angervaks_grep_for_inclusion_line_t1() {
    #--------
    if [ ! -e "$S_FP_BASHRC" ]; then
        if [ -h "$S_FP_BASHRC" ]; then
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHRC"
            echo ""
            echo "is a broken symlink. Aborting script."
            echo "GUID=='d2429924-6cad-478a-8518-73f1d031a7e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            # Create an empty text file.
            echo "#!/usr/bin/env bash" >> "$S_FP_BASHRC" # The ">>" is used in stead of the ">" for safety.
            func_mmmv_assert_error_code_zero_t1 "$?" \
                "967b6c64-6d8b-481f-9818-73f1d031a7e7"
            func_mmmv_wait_and_sync_t1
            echo "#===========================================================================" >> "$S_FP_BASHRC"
            func_mmmv_assert_error_code_zero_t1 "$?" \
                "8e702712-5491-4efb-b318-73f1d031a7e7"
            func_mmmv_wait_and_sync_t1
        fi
    else
        # To make sure that it is not a folder or a symlink to a folder.
        func_mmmv_assert_file_exists_t1 "$S_FP_BASHRC" \
            "77923720-323a-43ea-9318-73f1d031a7e7"
    fi
    #--------
    S_TMP_0="`grep -E \"source[ ]+\\\"$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash\\\"\" ~/.bashrc `"
    if [ "$S_TMP_0" == "" ]; then
        S_TMP_0="`grep -E \"MMMV_FP_COMMON_BASHRC[=]\\\"$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash\\\"\" ~/.bashrc `"
    fi
    if [ "$S_TMP_0" == "" ]; then
        S_TMP_0="`grep -i -E \"\#[-]+mmmv[-]+machine[-]+instance[-]+specific[-]+section[-]+start[-]+\" ~/.bashrc `"
    fi
} # func_angervaks_grep_for_inclusion_line_t1

#--------------------------------------------------------------------------
# Usually the
#export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
# would do, but there are use cases, where user "mmmv" is not used and 
# for that reason the value for the MMMV_USERSPACE_DISTRO_T1_HOME is derived.
#--------------------
# To avoid assigning a wrong value to the MMMV_USERSPACE_DISTRO_T1_HOME, 
# there is a slight check that this script resides
# at a right path in relation to the correct value of the MMMV_USERSPACE_DISTRO_T1_HOME.
S_TMP_0="`cd $S_FP_DIR/../../ ; pwd`"
func_mmmv_assert_folder_exists_t1 \
    "$S_TMP_0/mmmv/bin" "f9c0aa14-7a16-494e-a218-73f1d031a7e7"
#--------------------
func_mmmv_assert_folder_exists_t1 \
    "$S_TMP_0" "b1c35b1d-76a1-49ff-b218-73f1d031a7e7"
export MMMV_USERSPACE_DISTRO_T1_HOME="$S_TMP_0"
#--------------------------------------------------------------------------
S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/_bashrc_suffix_template_t1.bash"
# The 
func_mmmv_assert_file_exists_t1 "$S_FP_TEMPLATE" \
    "65d0d215-77b5-4e6b-8518-73f1d031a7e7"
# is meant to give a warning also when the template is not needed.

#--------------------------------------------------------------------------
S_TMP_0=""
SB_MODIFY_THE_BASHRC="t"
func_angervaks_grep_for_inclusion_line_t1
if [ "$S_TMP_0" != "" ]; then
    SB_MODIFY_THE_BASHRC="f"
fi
#--------------------
if [ "$SB_MODIFY_THE_BASHRC" == "t" ]; then
    #--------
    S_TMP_0="/tmp"
    if [ -e "$HOME/tmp" ]; then
        S_TMP_0="$HOME/tmp"
    fi
    if [ -e "$HOME/tmp_" ]; then
        S_TMP_0="$HOME/tmp_"
    fi
    S_TMP_1="$S_TMP_0/_bashrc_old_$S_TIMESTAMP"
    if [ -e $S_TMP_1 ]; then
        echo ""
        echo "This script is probably flawed."
        echo "A file or a folder with the path of "
        echo ""
        echo "    $S_TMP_1"
        echo ""
        echo "already exists. Aborting script."
        echo "GUID=='2a3ca075-2631-430e-b118-73f1d031a7e7'"
        echo ""
        #----
        cd "$S_FP_ORIG"
        exit 1 # exit with error
    fi
    func_mmmv_assert_file_exists_t1 "$S_FP_BASHRC" \
        "20477d5f-d5d5-447b-a318-73f1d031a7e7"
    #--------
    cp ~/.bashrc $S_TMP_1
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "223b615d-7ce7-4cb9-8518-73f1d031a7e7"
    func_mmmv_wait_and_sync_t1
    func_mmmv_assert_file_exists_t1 "$S_TMP_1" \
        "4b68cbaf-37dc-4d26-a518-73f1d031a7e7"
    #--------
    cat $S_FP_TEMPLATE >> $S_FP_BASHRC
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "a1b4ea98-6105-4a80-8518-73f1d031a7e7"
    func_mmmv_wait_and_sync_t1
    func_angervaks_grep_for_inclusion_line_t1
    if [ "$S_TMP_0" == "" ]; then
        echo ""
        echo "The adding of the mmmv inclusion line "
        echo "to the ~/.bashrc failed. Aborting script."
        echo "GUID=='d37c2306-bd35-4867-9418-73f1d031a7e7'"
        echo ""
        #----
        cd "$S_FP_ORIG"
        exit 1 # exit with error
    fi
    #--------
    func_angervaks_optionally_update_GUIDs_in_bashrc
    #--------
    echo ""
    echo -e "Added Bash code to the suffix of the\e[32m $S_FP_BASHRC \e[39m."
    echo ""
    #--------
else
    if [ "$SB_MODIFY_THE_BASHRC" != "f" ]; then
        func_mmmv_exc_exit_with_an_error_t1 \
            "655c3f28-410c-48fd-9518-73f1d031a7e7"
    fi
    echo ""
    echo "The "
    echo ""
    echo -e "\e[33m    $S_FP_BASHRC \e[39m"
    echo ""
    echo -e "seems to have been \e[33malready initialized\e[39m by the current script."
    echo -e "Not adding anything to the\e[33m $S_FP_BASHRC \e[39m."
    echo "GUID=='6042fa5b-32de-4eb9-a108-73f1d031a7e7'"
    echo ""
fi

#--------------------------------------------------------------------------

func_mmmv_cd_S_FP_ORIG_and_exit_t1(){
    func_mmmv_exc_verify_S_FP_ORIG_t1
    cd "$S_FP_ORIG"
    func_mmmv_assert_error_code_zero_t2 "$?" \
        "72b00cb1-0586-4fd5-8418-73f1d031a7e7"
    exit 0
} # func_mmmv_cd_S_FP_ORIG_and_exit_t1

func_mmmv_cd_S_FP_ORIG_and_exit_t1
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="02583820-dbec-498d-a118-73f1d031a7e7"
#==========================================================================
