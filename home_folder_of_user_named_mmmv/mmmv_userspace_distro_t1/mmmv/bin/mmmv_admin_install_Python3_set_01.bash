#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
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
        echo "GUID=='d531c215-3a7e-4567-b5fd-91017130a7e7'"
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
                    echo "GUID=='16c20fb1-4444-4729-8bfd-91017130a7e7'"
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
                    echo -e "points to a\e[31m broken symlink\e[39m, but a file or"
                    echo "a symlink to a file is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='5cd75c43-7eab-4252-82fd-91017130a7e7'"
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
                    echo -e "\e[31mdoes not exist\e[39m."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='3ba592b2-6a13-4119-83fd-91017130a7e7'"
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
                    echo -e "exists, but a\e[31m file or a symlink to a file is expected\e[39m."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='62041de3-0245-4c55-a5fd-91017130a7e7'"
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
            echo "GUID=='0c314c4f-83b4-458a-95fd-91017130a7e7'"
            echo ""
        fi
    fi
    #------------------------------
} # func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1

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
        echo "GUID=='c1863a21-5f33-4275-a6fd-91017130a7e7'"
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
        echo "GUID=='3ee79c3b-c25b-445d-91fd-91017130a7e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='208b2a4c-5382-4ad7-85fd-91017130a7e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

func_mmmv_exit_if_not_on_path_t2 "pip3"

#--------------------------------------------------------------------------
S_CMD_NICE="nice -n 5 "
S_FP_PIP3_BASH="$S_FP_DIR/mmmv_pip3_install"
func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_FP_PIP3_BASH" \
    "7a6a103d-0938-4acb-a4fd-91017130a7e7"

#--------------------------------------------------------------------------
# The autopep8 
# https://pypi.org/project/autopep8/
# is a Python code formatter that
# formats the code so that it conforms to the 
# Python Style Guide "PEP 8"
# https://peps.python.org/pep-0008/
$S_CMD_NICE $S_FP_PIP3_BASH autopep8 
func_mmmv_assert_error_code_zero_t1 "$?" \
    "95119657-6494-4f1a-bdfd-91017130a7e7"

# The trafilatura 
#     https://github.com/adbar/trafilatura
# is a Python3 program that parses HTML and outputs 
# the analysis/parsing results in some structured text format. 
# For example, JSON. Usage example:
#
#     trafilatura --precision --no-comments --json --URL "https://sogenbits.com"  | \
#         python -m json.tool | jq '.["raw_text"]'
#
# The json.tool at the line above is a Python2 program that
# is used for formatting/pretty-printing JSON. The jq 
#     https://github.com/jqlang/jq
#     https://jqlang.github.io/jq/manual/#Basicfilters
# is a C program that can probably be obtained from
# a standard package collection.
$S_CMD_NICE $S_FP_PIP3_BASH trafilatura
func_mmmv_assert_error_code_zero_t1 "$?" \
    "859f2a45-da78-4da0-b4fd-91017130a7e7"

#--------------------------------------------------------------------------
# https://www.antlr.org/
# https://github.com/antlr/
$S_CMD_NICE $S_FP_PIP3_BASH antlr4-tools
func_mmmv_assert_error_code_zero_t1 "$?" \
    "380e0034-9902-4f68-b3fd-91017130a7e7"

#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="5cbb9593-5d4e-4b1f-9efd-91017130a7e7"
#==========================================================================
