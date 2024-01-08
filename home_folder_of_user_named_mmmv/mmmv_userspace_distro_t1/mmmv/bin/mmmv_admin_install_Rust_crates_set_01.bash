#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# This script consists of 3 parts, which can be 
# navigated by searching for the following strings:
#
#     script_boilerplate_section
#     script_user_interface_section
#     script_data_section
#
# The boilerplate might be seen as the library of Bash functions that
# the rest of this script depends on. The user interface part handles
# command-line arguments, of which there are currently none.  
#
#--------------------------------------------------------------------------
#::::::::::::::::::::::script_boilerplate_section:::start::::::::::::::::::
#--------------------------------------------------------------------------
#S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
#S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
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
        echo "GUID=='8bbff150-cf0d-46bb-93d2-7051f07018e7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    local SB_IS_SYMLINK="f"     # possible values: "t", "f"
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
        echo "GUID=='4e5bd5c3-4a5b-4ec7-84d2-7051f07018e7'"
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
        echo "GUID=='289aa032-7ff3-4438-b2d2-7051f07018e7'"
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
    echo "GUID=='ed594e13-a8e0-4bb5-9fd2-7051f07018e7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1 # exit with an error
} # func_mmmv_exc_exit_with_an_error_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t2(){
    local S_GUID_CANDIDATE="$1"   # first function argument
    local S_OPTIONAL_ERR_MSG="$2" # second function argument
    func_mmmv_exc_verify_S_FP_ORIG_t1
    #--------
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo "The code of this script is flawed. "
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID=='583ab414-2de4-4c82-92c2-7051f07018e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    else
        echo ""
        echo "Something went wrong."
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo "GUID=='90fd6f26-c27e-4bd0-92c2-7051f07018e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_exit_with_an_error_t2

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='7947ae2c-7df8-47b0-91c2-7051f07018e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

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
        echo "GUID=='214a4388-b7d3-48c7-a6c2-7051f07018e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1
    fi
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='2169bc22-57e0-484d-84c2-7051f07018e7'"
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
            echo "GUID=='6cfeb056-3db6-46a9-b4c2-7051f07018e7'"
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
            echo "GUID=='1c1e133d-f664-49cb-b1c2-7051f07018e7'"
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
            echo "GUID=='acf3e111-0426-42c7-92c2-7051f07018e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_file_exists_t1

#--------------------------------------------------------------------------

func_mmmv_assert_folder_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='b570e34f-c32e-4eb2-b5c2-7051f07018e7'"
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
            echo "points to a broken symlink, but a folder "
            echo "or a symlink to a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='5c01fee3-a7d3-4aaf-b2c2-7051f07018e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            echo "The folder "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='3f301d2c-ddb5-4ee1-b4c2-7051f07018e7'"
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
            echo "exists, but a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='d9a5b420-63cc-464b-a3c2-7051f07018e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_folder_exists_t1

#--------------------------------------------------------------------------

func_install_Rust_crate(){
    local S_CRATE_PARAMETERS="$1" # the part after the "gem install "
    local S_GUID_CANDIDATE="$2"
    #--------
    local S_CARGO_PARAMS=" "
    if [ "$MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1" != "" ]; then
        S_CARGO_PARAMS=" -j $MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1 "
    fi
    #--------
    nice -n 15 cargo install $S_CARGO_PARAMS $S_CRATE_PARAMETERS
    func_mmmv_assert_error_code_zero_t1 "$?" "$S_GUID_CANDIDATE"
    func_mmmv_wait_and_sync_t1
    #--------
} # func_install_Rust_crate

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::script_boilerplate_section::::::end:::::::::::::::::
#::::::::::::::::::::::script_user_interface_section:::start:::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Some basic checks:
#func_mmmv_exit_if_not_on_path_t2 "gem"
func_mmmv_exit_if_not_on_path_t2 "cargo"
func_mmmv_exit_if_not_on_path_t2 "rustc"

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::script_user_interface_section:::end:::::::::::::::::
#::::::::::::::::::::::script_data_section:::::::::::::start:::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

func_install_Rust_crate "gitui" \
    "4b535352-5ba8-4e2e-b4d2-7051f07018e7"

func_install_Rust_crate "exa" \
    "26d42a38-a29d-4eaf-b3d2-7051f07018e7"

func_install_Rust_crate "ripgrep" \
    "f36c095a-af55-42d9-93d2-7051f07018e7"
    # installs the command line utility "rg".

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# TODO: list crates here

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::data::conversion:::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# https://pngquant.org
# https://github.com/kornelski/pngquant
func_install_Rust_crate "pngquant" \
    "5864e55d-852a-4183-82d2-7051f07018e7"

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::: database engine interfaces ::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# TODO: list crates here

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::: online service specific applications :::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Wikipedia surfing tui-application.
func_install_Rust_crate "wiki-tui" \
    "5dacfc03-cfb0-4fa1-bdc2-7051f07018e7"

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="bdaec72a-3bab-4067-a2c2-7051f07018e7"
#==========================================================================
