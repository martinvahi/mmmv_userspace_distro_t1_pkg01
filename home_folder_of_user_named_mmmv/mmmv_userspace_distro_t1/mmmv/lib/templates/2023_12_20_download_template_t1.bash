#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: <INCOMPLETE: name of the author comes here>
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# The main control flow entry in this script is the func_main(),
# which resides near the end of this file. The structure of this file:
#
#     <boilerplate, the library of reusable Bash functions>
#     <this script specific implementation functions>
#     func_download_all_files() # the list of URLs
#     func_main() # like in C/C++
#
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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
        echo "GUID=='fee7cc1f-ed11-4220-b260-d2b0a041c7e7'"
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
        echo "GUID=='2d3eeaf4-99cf-455f-9460-d2b0a041c7e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2b() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #----------------------------------------------------------------------
    #func_mmmv_exc_verify_S_FP_ORIG_t2
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo -e "\e[31mCommand \"$S_COMMAND_NAME\" could not be found from the PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='d2f270ae-7823-4317-8c60-d2b0a041c7e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2b

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
            echo "GUID=='5117e92f-c96b-4ae3-8260-d2b0a041c7e7'"
            echo ""
        fi
    fi
} # func_mmmv_init_s_timestamp_if_not_inited_t1

#--------------------------------------------------------------------------

func_initialize(){
    #------------------------------
    func_mmmv_exit_if_not_on_path_t2b "wget"
    # The rest are standard utilities that are always present,
    # so no need to test their presence.
    #------------------------------
    func_mmmv_init_s_timestamp_if_not_inited_t1
    cd "$S_FP_DIR"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "3c74af33-2a1b-4410-9360-d2b0a041c7e7"
    S_FP_DOWNLOAD_FOLDER="$S_FP_DIR/the_files/downloaded_at_$S_TIMESTAMP"
    mkdir -p "$S_FP_DOWNLOAD_FOLDER"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "498ab5e2-b87a-470a-a560-d2b0a041c7e7"
    func_mmmv_wait_and_sync_t1
    cd "$S_FP_DOWNLOAD_FOLDER"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "6277c23c-d5bd-48c7-a160-d2b0a041c7e7"
    #------------------------------
} # func_initialize

#--------------------------------------------------------------------------

func_jump_to_folder(){
    local S_RELATIVE_PATH="$1"
    #------------------------------
    if [ "$S_RELATIVE_PATH" == "" ]; then
        echo ""
        echo "S_RELATIVE_PATH==\"\", but a path relative to the "
        echo "    $S_FP_DOWNLOAD_FOLDER "
        echo "is expected. "
        echo "GUID=='5575b63b-8336-46ee-8260-d2b0a041c7e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
    cd "$S_FP_DOWNLOAD_FOLDER" # just to be sure
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "fabd172d-b4ab-4324-a560-d2b0a041c7e7"
    mkdir -p "$S_RELATIVE_PATH"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "ac15cc20-a51f-4daa-8260-d2b0a041c7e7"
    func_mmmv_wait_and_sync_t1
    cd "$S_RELATIVE_PATH"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "956fdd48-ffda-4ba4-a260-d2b0a041c7e7"
    #------------------------------
} # func_jump_to_folder

#--------------------------------------------------------------------------

func_download_single_file(){
    local S_URL="$1"
    local S_FP_RELATIVE_PATH_OPTIONAL="$2" # relative to the S_FP_DOWNLOAD_FOLDER
    #------------------------------
    if [ "$S_URL" == "" ]; then
        echo ""
        echo "S_URL==\"\", but an URL is expected."
        echo "GUID=='50f02352-2716-4ce7-a160-d2b0a041c7e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
    if [ "$S_FP_RELATIVE_PATH_OPTIONAL" != "" ]; then
        func_jump_to_folder "$S_FP_RELATIVE_PATH_OPTIONAL"
    fi
    #------------------------------
    nice -n 2 wget "$S_URL"
    local SI_ERR_CODE="$?"
    if [ "$SI_ERR_CODE" != "0" ]; then
        echo "S_URL==\"$S_URL\" "
        func_mmmv_assert_error_code_zero_t1 "$SI_ERR_CODE" \
            "07241fd9-dc28-45b1-8160-d2b0a041c7e7"
    fi 
    func_mmmv_wait_and_sync_t1
    #------------------------------
    cd "$S_FP_DOWNLOAD_FOLDER" # from $S_FP_RELATIVE_PATH_OPTIONAL
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "568ee127-9050-4336-8350-d2b0a041c7e7"
    #------------------------------
} # func_download_single_file

func_dsf(){ # a shorthand
    local S_URL="$1"
    local S_FP_RELATIVE_PATH_OPTIONAL="$2"
    #------------------------------
    func_download_single_file  "$S_URL" "$S_FP_RELATIVE_PATH_OPTIONAL"
    #------------------------------
} # func_dsf

#--------------------------------------------------------------------------

# INCOMPLETE: please customise this function to Your needs. Thank You.
func_download_all_files(){ 
    #------------------------------
    local S_TMP_0="./BoehmDemersWeiser_garbage_collector_for_C_and_Cpp"
    func_dsf "https://hboehm.info/gc/gc_source/gc-8.2.4.tar.gz" "$S_TMP_0"

    S_TMP_0="./GuiTools"
    func_dsf "https://github.com/rochus-keller/GuiTools/archive/master.zip" "$S_TMP_0"
    S_TMP_0="./GuiTools/refs_heads"
    func_dsf "https://github.com/rochus-keller/GuiTools/archive/refs/heads/master.zip" "$S_TMP_0"

    S_TMP_0="./PeLib"
    func_dsf "https://github.com/rochus-keller/PeLib/archive/refs/heads/OBX.zip" "$S_TMP_0"

    S_TMP_0="./LeanQt_Qt_Designer_fork"
    func_dsf "https://github.com/rochus-keller/LeanQt/archive/refs/heads/master.zip" "$S_TMP_0"

    S_TMP_0="./BUSY_build_system_that_competes_with_CMake"
    func_dsf "https://github.com/rochus-keller/BUSY/archive/refs/heads/master.zip" "$S_TMP_0"
    #------------------------------
} # func_download_all_files

#--------------------------------------------------------------------------

func_main(){
    func_initialize
    func_download_all_files
    echo ""
    echo -e "\e[32mAll files downloaded\e[39m."
    echo ""
    exit 0 # no errors
} # func_main
func_main

#==========================================================================
# S_VERSION_OF_THIS_FILE="963f2cd4-ab63-4164-9350-d2b0a041c7e7"
#==========================================================================
