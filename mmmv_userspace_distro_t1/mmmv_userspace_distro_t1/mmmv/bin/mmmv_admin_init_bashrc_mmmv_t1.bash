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
        echo "GUID=='3273ab05-5e8c-494d-a54c-c0a280d026e7'"
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
        echo "GUID=='836bbf12-0e1e-4f20-b14c-c0a280d026e7'"
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
        echo "GUID=='280bf87b-ed2e-4ffc-933c-c0a280d026e7'"
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
    echo "GUID=='13dc26b4-1ac5-4cd1-833c-c0a280d026e7'"
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
        echo "GUID=='e4054431-5e9a-42a6-b23c-c0a280d026e7'"
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
        echo "GUID=='b42b2526-9415-4d2d-a33c-c0a280d026e7'"
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
        echo "GUID=='21b2c563-f50d-40e1-b82c-c0a280d026e7'"
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
        echo "GUID=='d1d5824d-2d71-46ca-a42c-c0a280d026e7'"
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
        echo "GUID=='2b3e1a1b-2224-4d23-a42c-c0a280d026e7'"
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
        echo "GUID=='810c9626-b09b-4bea-952c-c0a280d026e7'"
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
            echo "GUID=='fff3774b-3bb2-478a-b32c-c0a280d026e7'"
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
            echo "GUID=='4ec0c731-2ee6-4b92-a32c-c0a280d026e7'"
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
            echo "GUID=='3c609b14-43b4-4b51-b32c-c0a280d026e7'"
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
        echo "GUID=='6212bb3d-27cb-48e5-a52c-c0a280d026e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo "This code is flawed."
            echo "GUID=='1a68f512-7071-4e27-912c-c0a280d026e7'"
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
                echo "GUID=='04367575-a3ee-4095-b52c-c0a280d026e7'"
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
            echo "GUID=='f657b959-fa3a-4cbf-b32c-c0a280d026e7'"
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
            echo "GUID=='e627f851-f45a-4657-912c-c0a280d026e7'"
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
            echo "GUID=='88eed021-cf98-4dda-a42c-c0a280d026e7'"
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
                    echo "GUID=='2bc39c3a-1e84-474c-b32c-c0a280d026e7'"
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
            echo "GUID=='4c1516a8-32b5-4b6a-812c-c0a280d026e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            # Create an empty text file.
            echo "#!/usr/bin/env bash" >> "$S_FP_BASHRC" # The ">>" is used in stead of the ">" for safety.
            func_mmmv_assert_error_code_zero_t1 "$?" \
                "ee8ce749-8725-4be3-a44c-c0a280d026e7"
            func_mmmv_wait_and_sync_t1
            echo "#===========================================================================" >> "$S_FP_BASHRC"
            func_mmmv_assert_error_code_zero_t1 "$?" \
                "5ecd2124-40aa-415b-854c-c0a280d026e7"
            func_mmmv_wait_and_sync_t1
        fi
    else
        # To make sure that it is not a folder or a symlink to a folder.
        func_mmmv_assert_file_exists_t1 "$S_FP_BASHRC" \
            "514ca97e-3b54-4c34-933c-c0a280d026e7"
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
    "$S_TMP_0/mmmv/bin" "6160a65e-94f8-439a-ac3c-c0a280d026e7"
#--------------------
func_mmmv_assert_folder_exists_t1 \
    "$S_TMP_0" "1b16fc74-b125-47f0-af3c-c0a280d026e7"
export MMMV_USERSPACE_DISTRO_T1_HOME="$S_TMP_0"
#--------------------------------------------------------------------------
S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/_bashrc_suffix_template_t1.bash"
# The 
func_mmmv_assert_file_exists_t1 "$S_FP_TEMPLATE" \
    "b4136f35-e45f-459b-a13c-c0a280d026e7"
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
        echo "GUID=='dff49846-c7d4-4eb7-922c-c0a280d026e7'"
        echo ""
        #----
        cd "$S_FP_ORIG"
        exit 1 # exit with error
    fi
    func_mmmv_assert_file_exists_t1 "$S_FP_BASHRC" \
        "3c9acf13-a0d8-4ab9-922c-c0a280d026e7"
    #--------
    cp ~/.bashrc $S_TMP_1
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "b4945b36-225f-479b-a32c-c0a280d026e7"
    func_mmmv_wait_and_sync_t1
    func_mmmv_assert_file_exists_t1 "$S_TMP_1" \
        "f1c5385c-96f7-424e-b92c-c0a280d026e7"
    #--------
    cat $S_FP_TEMPLATE >> $S_FP_BASHRC
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "7116845f-e5bf-4cfd-a52c-c0a280d026e7"
    func_mmmv_wait_and_sync_t1
    func_angervaks_grep_for_inclusion_line_t1
    if [ "$S_TMP_0" == "" ]; then
        echo ""
        echo "The adding of the mmmv inclusion line "
        echo "to the ~/.bashrc failed. Aborting script."
        echo "GUID=='79b0721a-f4f5-472d-b22c-c0a280d026e7'"
        echo ""
        #----
        cd "$S_FP_ORIG"
        exit 1 # exit with error
    fi
else
    if [ "$SB_MODIFY_THE_BASHRC" != "f" ]; then
        func_mmmv_exc_exit_with_an_error_t1 \
            "fcb1b532-eb98-4dcc-932c-c0a280d026e7"
    fi
    echo ""
    echo "The ~/.bashrc seems to have been already "
    echo "initialized by the current script. "
    echo "Not adding anything to the ~/.bashrc ."
    echo "GUID=='c94a9a16-5136-460d-942c-c0a280d026e7'"
    echo ""
fi

#--------------------------------------------------------------------------

func_mmmv_cd_S_FP_ORIG_and_exit_t1(){
    func_mmmv_exc_verify_S_FP_ORIG_t1
    cd "$S_FP_ORIG"
    func_mmmv_assert_error_code_zero_t2 "$?" \
        "bb03672f-1f12-46b1-932c-c0a280d026e7"
    exit 0
} # func_mmmv_cd_S_FP_ORIG_and_exit_t1

func_mmmv_cd_S_FP_ORIG_and_exit_t1
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="4abbbba4-be00-4268-8b2c-c0a280d026e7"
#==========================================================================
