#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in the public domain.
# SPDX-License-Identifier: 0BSD
#
# As of 2021 an alternative to using this script 
# is to use a file manager named Krusader for
# disassembling and reassembling large files, but
# the disassembly and reassembly has to be done
# by using the same tool(Krusader or this script) for
# both activities. That is to say, disassembly with the Krusader
# and reassembly with this script or vice versa, 
# disassembly with this script and reassembly with the
# Krusader does not guarantee that the reassembled file
# matches bit by bit with the disassembled file.
#
#     https://docs.kde.org/stable5/en/krusader/krusader/krusader.pdf 
#     https://web.archive.org/web/20210828055719/https://docs.kde.org/stable5/en/krusader/krusader/krusader.pdf
#     optionally present local copy:
#         $MMMV_USERSPACE_DISTRO_T1_HOMEhome/attic/documentation/
#             third_party_documentation/Linux_and_BSD_administration/
#             SSH/tutorials/2021_08_28_downloaded_Krusader_File_Manager_Handbook.pdf
#
#--------------------------------------------------------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------
func_main_and_all_settings(){
    #func_err_msg_0 "305c239a-ccc6-43b0-95d4-0290a08018e7"

    S_FN="ibm-semeru-open-jdk_x64_linux_17.0.1_12_openj9-0.29.1.tar.gz"
    I_PIECE_SIZE_IN_MiB=20

    # Please uncomment the function that You wish to use:
    #func_file_disassembly
    func_file_reassembly
} # func_main_and_all_settings

#--------------------------------------------------------------------------
#:::::::::::::::::::start::of::the::implementation:::::::::::::::::::::::::
#--------------------------------------------------------------------------
func_err_msg_0(){
    local S_GUID_CANDIDATE="$1"
    echo ""
    echo "Please update this script by editing the code of "
    echo "the function that contains the following GUID:"
    echo "$S_GUID_CANDIDATE"
    echo ""
    exit 1 # exit with an error
} # func_err_msg_0

#--------------------------------------------------------------------------
#:::::::::::::::::::::::start::of::boilerplate:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
} # func_mmmv_wait_and_sync_t1
#--------------------------------------------------------------------------
func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='19774e55-dff9-49d7-81d4-0290a08018e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2
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
        echo "GUID=='18cec0b1-9c3d-4cba-bad4-0290a08018e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo "This code is flawed."
            echo "GUID=='4a911e2b-50ec-4b8f-93d4-0290a08018e7'"
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
                echo "GUID=='50fe0161-2ddf-4fee-b4d4-0290a08018e7'"
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
            echo "GUID=='169057d1-91a3-49c7-8ed4-0290a08018e7'"
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
            echo "GUID=='ea1d6a12-fd4a-40c5-84d4-0290a08018e7'"
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
            echo "GUID=='7c235f20-906a-4e90-93d4-0290a08018e7'"
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
                    echo "GUID=='17073484-bf71-4532-b5d4-0290a08018e7'"
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
        echo "GUID=='43ba6e55-733a-4165-93d4-0290a08018e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo "This code is flawed."
            echo "GUID=='07d8a057-b8e9-40db-b3d4-0290a08018e7'"
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
                echo "GUID=='216e2855-6ead-4472-81d4-0290a08018e7'"
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
            echo "GUID=='1afea435-af70-4958-85c4-0290a08018e7'"
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
            echo "GUID=='a4541511-97ef-4050-a2c4-0290a08018e7'"
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
            echo "GUID=='5d9ba417-2504-4dc8-94c4-0290a08018e7'"
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
                    echo "GUID=='5f9451a3-5b6a-443e-92c4-0290a08018e7'"
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
        echo "GUID=='19421c64-d503-4f72-84c4-0290a08018e7'"
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
        echo "GUID=='43b4c330-c886-430e-94c4-0290a08018e7'"
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
        echo "GUID=='188186ed-6f25-425e-a3c4-0290a08018e7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t1
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
    # tests from scatch every time a folder 
    # needs to be created.
    #--------
    func_mmmv_exc_verify_S_FP_ORIG_t1
    if [ "$S_FP_FOLDER" == "" ]; then
        echo ""
        echo "The function formal parameter S_FP_FOLDER "
        echo "is expected to be a full path to a folder that "
        echo "either already exists or that has to be created."
        echo "Aborting script."
        echo "GUID=='b8ff2358-da31-4688-95c4-0290a08018e7'"
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
            echo "GUID=='e95d2259-d23a-41dc-92c4-0290a08018e7'"
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
            func_mmmv_exc_exit_with_an_error_t2 "63e59163-2d7e-426c-82d4-0290a08018e7" \
                "S_FP_FOLDER==$S_FP_FOLDER"
        fi
        if [ ! -e "$S_FP_FOLDER" ]; then 
            func_mmmv_exc_exit_with_an_error_t2 "023847aa-c6af-46ba-81d4-0290a08018e7" \
                "Folder creation failed. S_FP_FOLDER==$S_FP_FOLDER"
        fi
    fi
    #--------
} # func_mmmv_create_folder_t1

#--------------------------------------------------------------------------
#:::::::::::::::::::::::::end::of::boilerplate:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
func_mmmv_exit_if_not_on_path_t2 "cat"
func_mmmv_exit_if_not_on_path_t2 "split"
func_mmmv_exit_if_not_on_path_t2 "nice"
func_mmmv_exit_if_not_on_path_t2 "time"
#--------------------------------------------------------------------------
func_file_disassembly(){
    #------------------------------
    local S_FP_ALL_IN_ONE="$S_FP_DIR/$S_FN"
    #------------------------------
    func_mmmv_assert_file_exists_t1  \
        "$S_FP_ALL_IN_ONE" "e297d893-d757-4af3-a6d4-0290a08018e7"
    #------------------------------
    local S_TMP_0="M"
    local S_TMP_1="$I_PIECE_SIZE_IN_MiB$S_TMP_0"
    time nice -n 20 split --numeric-suffixes --suffix-length=4 \
        --bytes=$S_TMP_1 $S_FP_ALL_IN_ONE  $S_FP_ALL_IN_ONE.part_
    func_mmmv_wait_and_sync_t1 # for USB-sticks, network drives, etc.
} # func_file_disassembly
#--------------------------------------------------------------------------
func_file_reassembly(){
    #------------------------------
    local S_FP_ALL_IN_ONE="$S_FP_DIR/$S_FN"
    local S_TMP_0=".part_*"
    local S_TMP_1="$S_FP_ALL_IN_ONE$S_TMP_0"
    #------------------------------
    local S_TMP_2=".part_0000"
    local S_TMP_3="$S_FP_ALL_IN_ONE$S_TMP_2" # should always exist
    func_mmmv_assert_file_exists_t1  \
        "$S_TMP_3" "a5809b3d-c5f5-40df-95d4-0290a08018e7"
    #------------------------------
    local S_FP_REASSEMBLY_RESULTS="$S_FP_DIR/reassembly_results"
    local S_FP_REASSEMBLY_RESULT_FOLDER="$S_FP_REASSEMBLY_RESULTS/v_$S_TIMESTAMP"
    local S_FP_REASSEMBLY_RESULT="$S_FP_REASSEMBLY_RESULT_FOLDER/$S_FN"
    func_mmmv_create_folder_t1 \
        "$S_FP_REASSEMBLY_RESULTS" # to get a more precise error message
    func_mmmv_create_folder_t1 "$S_FP_REASSEMBLY_RESULT_FOLDER"
    #------------------------------
    nice -n 20 cat $S_TMP_1 > $S_FP_REASSEMBLY_RESULT
    func_mmmv_wait_and_sync_t1 # for USB-sticks, network drives, etc.
    func_mmmv_assert_file_exists_t1  \
        "$S_FP_REASSEMBLY_RESULT" "198c4840-9cc6-4993-91d4-0290a08018e7"
    echo ""
    # Bash text color settings:
    #     https://misc.flogisoft.com/bash/tip_colors_and_formatting
    #     archival copy: https://archive.is/2pzTs
    echo -e "\e[32mPlease verify the SHA256 of the reassembled file\e[39m, the "
    echo ""
    echo "    $S_FP_REASSEMBLY_RESULT"
    echo ""
    echo "GUID=='68d91923-ca80-4d34-b2c4-0290a08018e7'"
    echo ""
} # func_file_reassembly
#--------------------------------------------------------------------------
S_FN="subject_to_overriding"
I_PIECE_SIZE_IN_MiB="subject_to_overriding"
func_main_and_all_settings

exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="973d314a-74c9-4e76-a4d4-0290a08018e7"
#==========================================================================
