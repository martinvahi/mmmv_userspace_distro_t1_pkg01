#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
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

func_mmmv_exit_if_not_on_path_t2b() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #----------------------------------------------------------------------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo -e "\e[31mCommand \"$S_COMMAND_NAME\" could not be found from the PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='7100c194-8089-4417-8031-b2e2d0c1c7e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2b


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
    #func_mmmv_exc_verify_S_FP_ORIG_t2
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
        echo "GUID=='02877dd5-ea8b-409c-b911-b2e2d0c1c7e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo -e "\e[31mThis code is flawed. \e[39m"
            echo "GUID=='4fe89be5-5173-420c-9b51-b2e2d0c1c7e7'"
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
                echo "GUID=='23008f60-c694-4565-9441-b2e2d0c1c7e7'"
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
            echo -e "points to a\e[31m broken symlink\e[39m, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "a file is expected."
            else
                echo "a file or a symlink to a file is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='a5cd4fce-1ef2-4481-8411-b2e2d0c1c7e7'"
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
            echo -e "\e[31mdoes not exist\e[39m."
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='d14934e5-2bbe-4dcc-b041-b2e2d0c1c7e7'"
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
                echo -e "a\e[31m file is expected\e[39m."
            else
                echo -e "a\e[31m file or a symlink to a file is expected\e[39m."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='2ea5a322-6d9f-4a4c-ac11-b2e2d0c1c7e7'"
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
                    echo -e "is a symlink to a file, but a\e[31m file is expected\e[39m."
                    echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='23cc7a12-e831-4df8-b750-b2e2d0c1c7e7'"
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
    #func_mmmv_exc_verify_S_FP_ORIG_t2
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
        echo "GUID=='3cc19f74-7b00-46f3-8140-b2e2d0c1c7e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo -e "\e[31mThis code is flawed. \e[39m"
            echo "GUID=='64f04cea-35ae-49c4-aa30-b2e2d0c1c7e7'"
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
                echo "GUID=='e1cedbb2-dc55-42d6-abc0-b2e2d0c1c7e7'"
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
            echo -e "points to a\e[31m broken symlink\e[39m, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo -e "a\e[31m folder is expected\e[39m."
            else
                echo -e "a\e[31m folder or a symlink to a folder is expected\e[39m."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='37bc29d2-290f-490c-bf40-b2e2d0c1c7e7'"
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
            echo -e "\e[31mdoes not exist\e[39m."
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='72a4c4e3-3600-41b7-8910-b2e2d0c1c7e7'"
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
                echo -e "a\e[31m folder is expected\e[39m."
            else
                echo -e "a\e[31m folder or a symlink to a folder is expected\e[39m."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='c7c3dad4-783e-41c5-97d0-b2e2d0c1c7e7'"
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
                    echo -e "is a symlink to a folder, but a\e[31m folder is expected\e[39m."
                    echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='e4f7c4bf-8b4b-466e-b120-b2e2d0c1c7e7'"
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
        echo "GUID=='842c08bb-096c-42b6-afa0-b2e2d0c1c7e7'"
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
        echo "GUID=='4cb6a912-fccf-49db-8740-b2e2d0c1c7e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_main(){ 
    #------------------------------
    func_mmmv_exit_if_not_on_path_t2b "g++"
    #------------------------------
    S_FP_SRC="$S_FP_DIR/mmmv_hardwarethreadcount_t1.cpp"
    S_FP_A_OUT="$S_FP_DIR/a.out"
    S_FP_BIN="`cd $S_FP_DIR/../ ; pwd `/bin"
    S_FP_COMPILATION_RESULT="$S_FP_BIN/mmmv_hardwarethreadcount_t1"
    #------------------------------
    func_mmmv_assert_file_exists_t1 "$S_FP_SRC" \
        "ae5f048f-54eb-4370-8d91-b2e2d0c1c7e7"
    mkdir -p "$S_FP_BIN"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "1e89a343-3bee-44ea-ab21-b2e2d0c1c7e7"
    func_mmmv_wait_and_sync_t1
    func_mmmv_assert_folder_exists_t1 "$S_FP_BIN" \
        "5524c4d1-0fb3-4777-8821-b2e2d0c1c7e7"
    cd $S_FP_DIR
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "7d149995-baf8-4477-9f11-b2e2d0c1c7e7"
    #------------------------------
    g++ "$S_FP_SRC" 
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "b3b75fc5-d8be-45d8-aa11-b2e2d0c1c7e7"
    func_mmmv_wait_and_sync_t1
    func_mmmv_assert_file_exists_t1 "$S_FP_SRC" \
        "4d3b5ad4-8dff-42a6-9311-b2e2d0c1c7e7"
    #------------------------------
    nice -n 5 $S_FP_A_OUT 1> /dev/null
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "06d52820-da42-4bd5-b011-b2e2d0c1c7e7"
    #------------------------------
    rm -f "$S_FP_COMPILATION_RESULT"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "45648204-7d55-44a0-bd30-b2e2d0c1c7e7"
    func_mmmv_wait_and_sync_t1
    mv "$S_FP_A_OUT" "$S_FP_COMPILATION_RESULT"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "5b0ce804-16f9-4b8b-ba10-b2e2d0c1c7e7"
    func_mmmv_wait_and_sync_t1
    #------------------------------
    chmod 0755 "$S_FP_COMPILATION_RESULT"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "1435d92d-7ce2-4cf7-af50-b2e2d0c1c7e7"
    func_mmmv_wait_and_sync_t1
    #------------------------------
    nice -n 5 $S_FP_COMPILATION_RESULT 1> /dev/null
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "1769e3a2-efe6-44cd-8c20-b2e2d0c1c7e7"
    #------------------------------
    echo ""
    echo "The location of the compiled binary is:"
    echo -e "\e[92m    $S_FP_COMPILATION_RESULT \e[39m"
    echo ""
    echo "Thank You for trying out this script. "
    echo ""
    #------------------------------
} # func_main
func_main

#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="3d14bd72-ce59-4a8d-ad20-b2e2d0c1c7e7"
#==========================================================================
