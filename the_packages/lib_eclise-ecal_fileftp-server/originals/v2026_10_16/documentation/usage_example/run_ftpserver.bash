#!/usr/bin/env bash
#==========================================================================
# Author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# The initial version of this file has been written with the help of
# This file has been tested with ("make -v")
#     GNU Make 4.3
#     Built for x86_64-pc-linux-gnu
#     Copyright (C) 1988-2020 Free Software Foundation, Inc.
#     License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
#     This is free software: you are free to change and redistribute it.
#     There is NO WARRANTY, to the extent permitted by law.
# ("bash --version")
#     GNU bash, version 5.2.21(1)-release (x86_64-pc-linux-gnu)
#     Copyright (C) 2022 Free Software Foundation, Inc.
#     License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
#
#     This is free software; you are free to change and redistribute it.
#     There is NO WARRANTY, to the extent permitted by law.
# on ("uname -a")
#     Linux ArtoHP 7.0.0-34-generic #34~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Fri Sep  4 15:38:29 UTC 2 x86_64 GNU/Linux
#
# Control flow entry is the func_main.
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------

func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
    wait # for sync
} # func_mmmv_wait_and_sync_t1

#--------------------------------------------------------------------------

func_mmmv_assert_exists_on_PATH_t3() {
    local S_NAME_OF_THE_EXECUTABLE="$1" # first function argument
    #----------------------------------------------------------------------
    local S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE 2> /dev/null\`"
    local S_TMP_1=""
    local S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    if [ "$S_TMP_1" == "" ]; then
        S_TMP_0="This bash script requires the \""
        S_TMP_1="\" to be on the PATH."
        #--------
        echo ""
        echo -e "$S_TMP_0\e[31m$S_NAME_OF_THE_EXECUTABLE\e[39m$S_TMP_1"
        echo "GUID=='53ae622c-d08a-4865-a3f2-41030101aae7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_assert_exists_on_PATH_t3

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t5(){
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
        echo "GUID=='81831553-9d10-4bb7-8ef2-41030101aae7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
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
        echo "GUID=='549ac53d-3d15-415b-81f2-41030101aae7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t5

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t2() {
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_OPTIONAL_BAN_SYMLINKS="$3" # domain: {"t", "f", ""} default: "f"
                                        # is the last formal parameter in
                                        # stead of the S_GUID_CANDIDATE,
                                        # because that way this function
                                        # is backwards compatible with
                                        # an earlier version of this
                                        # function.
    #----------------------------------------------------------------------
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
        echo "GUID=='d4079a2e-4345-4665-a2f2-41030101aae7'"
        echo ""
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo -e "\e[31mThis code is flawed. \e[39m"
            echo "GUID=='9f47b040-c58f-4965-82f2-41030101aae7'"
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
                echo "GUID=='1a12a5f1-1413-49dd-91f2-41030101aae7'"
                echo ""
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
            echo "GUID=='cebf0eca-2148-473c-84f2-41030101aae7'"
            echo ""
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
            echo "GUID=='3427df94-235b-4fef-92f2-41030101aae7'"
            echo ""
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
            echo "GUID=='b0ddc574-229e-4d8e-85f2-41030101aae7'"
            echo ""
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
                    echo "GUID=='d14f9040-7289-4f00-81f2-41030101aae7'"
                    echo ""
                    exit 1 # exiting with an error
                fi
            fi
        fi
    fi
} # func_mmmv_assert_file_exists_t2

#--------------------------------------------------------------------------

func_initialize_global_variables(){
    S_FP_FTPSERVER_BINARY="$S_FP_DIR/ftpserver"
    S_FP_MAKEFILE="$S_FP_DIR/Makefile"
    S_FP_MAINCPP="$S_FP_DIR/main.cpp"
    S_FP_LIB_FOLDER="`cd $S_FP_DIR/../ ; pwd`/lib"
    S_FP_LIB_SO="$S_FP_LIB_FOLDER/libfineftp-server.so"
} # func_initialize_global_variables

func_exc_verify_that_lib_exists(){
    local SB_OPTIONAL_BAN_SYMLINKS="f" # library is referenced through a symlink
    func_mmmv_assert_file_exists_t2 \
        "$S_FP_LIB_SO" \
        "1e133016-c07c-4ab0-a5f2-41030101aae7" \
        "$SB_OPTIONAL_BAN_SYMLINKS"
} # func_exc_verify_that_lib_exists

func_exc_compile_if_not_compiled_yet(){
    local SB_OPTIONAL_BAN_SYMLINKS="t"
    func_mmmv_wait_and_sync_t1
    func_mmmv_assert_file_exists_t2 \
        "$S_FP_MAKEFILE" \
        "1b587b04-425d-4e1e-93f2-41030101aae7" \
        "$SB_OPTIONAL_BAN_SYMLINKS"
    func_mmmv_assert_file_exists_t2 \
        "$S_FP_MAINCPP" \
        "137cd163-7fa5-427e-b1f2-41030101aae7" \
        "$SB_OPTIONAL_BAN_SYMLINKS"
    func_mmmv_assert_exists_on_PATH_t3 "g++"
    func_mmmv_assert_exists_on_PATH_t3 "make"
    cd $S_FP_DIR
    func_mmmv_assert_error_code_zero_t5 "$?" \
        "54f1481f-cc67-465b-95f2-41030101aae7"
    make # tested only with GNU Make
    func_mmmv_assert_error_code_zero_t5 "$?" \
        "6f1bb141-6fd5-4373-a5f2-41030101aae7"
    func_mmmv_wait_and_sync_t1
    func_mmmv_assert_file_exists_t2 \
        "$S_FP_FTPSERVER_BINARY" \
        "950e321b-571f-4fc8-84f2-41030101aae7" \
        "$SB_OPTIONAL_BAN_SYMLINKS"
} # func_exc_compile_if_not_compiled_yet

func_main(){
    func_initialize_global_variables
    func_exc_verify_that_lib_exists
    if [ ! -e $S_FP_FTPSERVER_BINARY ]; then
        func_exc_compile_if_not_compiled_yet
    fi
    LD_LIBRARY_PATH="$S_FP_LIB_FOLDER:$LD_LIBRARY_PATH"
    echo ""
    echo -e "\e[32mStarting FTP server\e[39m at a hardcoded port, which "
    echo "is written at "
    echo "    $S_FP_MAINCPP"
    echo "The FTP server can be stopped with a keyboard shortcut Ctrl-c ."
    echo ""
    $S_FP_FTPSERVER_BINARY
    #$S_FP_FTPSERVER_BINARY > /dev/null # to avoid printing user interaction log to console
    func_mmmv_assert_error_code_zero_t5 "$?" \
        "21a1a4b1-1f76-459d-85f2-41030101aae7"
} # func_main
func_main

#==========================================================================
# S_VERSION_OF_THIS_FILE="4f1b2422-ceb1-4168-91f2-41030101aae7"
#==========================================================================
