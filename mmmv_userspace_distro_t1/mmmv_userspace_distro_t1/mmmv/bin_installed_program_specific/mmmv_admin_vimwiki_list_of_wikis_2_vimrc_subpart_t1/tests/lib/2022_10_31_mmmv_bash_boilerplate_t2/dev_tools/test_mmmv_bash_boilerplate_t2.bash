#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# S_VERSION_OF_THIS_FILE="157fbb4b-8b23-47b8-a5e7-f2c18001c6e7"
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`" # required by some tests
#S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------
func_assert_error_code_zero(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #------------------------------
    if [ "$S_ERR_CODE" != "" ]; then
        # If the "$?" were evaluated in this function, 
        # then it would be "0" even, if it is
        # something else at the calling code.
        if [ "$S_ERR_CODE" != "0" ]; then
            echo ""
            echo -e "\e[31mTest failed. \e[39m"
            echo "    S_ERR_CODE==\"$S_ERR_CODE\""
            echo "GUID=='34b73221-a74e-4822-b2e7-f2c18001c6e7'"
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            echo ""
            #--------
            exit 1
        fi
    fi
    #------------------------------
} # func_assert_error_code_zero

#--------------------------------------------------------------------------
S_FP_MMMV_BASH_BOILERPLATE_T2_BASH="`cd $S_FP_DIR/../ ; pwd`/mmmv_bash_boilerplate_t2.bash"
#--------------------------------------------------------------------------
if [ ! -e "$S_FP_MMMV_BASH_BOILERPLATE_T2_BASH" ]; then
    func_assert_error_code_zero "42" '2f11a66e-2fad-4747-82e7-f2c18001c6e7'
fi
if [ -d "$S_FP_MMMV_BASH_BOILERPLATE_T2_BASH" ]; then
    func_assert_error_code_zero "42" 'd328b55f-054a-4f7c-a3e7-f2c18001c6e7'
fi
if [ -h "$S_FP_MMMV_BASH_BOILERPLATE_T2_BASH" ]; then
    func_assert_error_code_zero "42" '4cf6882d-7a9a-4c6f-a4e7-f2c18001c6e7'
fi
source "$S_FP_MMMV_BASH_BOILERPLATE_T2_BASH"
func_assert_error_code_zero "$?" '42e42a63-fa7f-43f1-9ae7-f2c18001c6e7'
#--------------------------------------------------------------------------
func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 "/usr" \
    '5ec73642-04e9-4737-b5e7-f2c18001c6e7'
#--------------------------------------------------------------------------
func_mmmv_assert_Linux_or_BSD_t1 \
    '48022433-3f89-436c-85e7-f2c18001c6e7'
#--------------------------------------------------------------------------
func_mmmv_assert_error_code_zero_t1 "0" \
    '56ad3b6f-3851-4f2e-a3e7-f2c18001c6e7'
#--------------------------------------------------------------------------
func_mmmv_assert_error_code_zero_t2 "0" \
    'ee417232-1dc3-4588-b3e7-f2c18001c6e7'
#--------------------------------------------------------------------------
func_mmmv_assert_error_code_zero_t3 "0" \
    '503d0f13-ab67-4378-95e7-f2c18001c6e7'
#--------------------------------------------------------------------------
func_mmmv_assert_error_code_zero_t4 "0" \
    '71ed3d41-2f94-411f-83e7-f2c18001c6e7'
#--------------------------------------------------------------------------
S_TMP_000="Foo"
func_mmmv_assert_nonempty_string_but_do_not_exit_t1 \
    "$S_TMP_000" "S_TMP_000" \
    '92a881f7-18e8-470b-b1e7-f2c18001c6e7'
func_mmmv_assert_nonempty_string_t1 \
    "$S_TMP_000" "S_TMP_000" \
    'ae83e127-c733-4fc5-a5e7-f2c18001c6e7'
SB_NO_ERRORS_YET="t"
S_TMP_000=" "
func_mmmv_assert_nonempty_string_but_do_not_exit_t1 \
    "$S_TMP_000" "S_TMP_000" \
    'fab99552-b2b9-4df6-b3d7-f2c18001c6e7'
func_mmmv_assert_nonempty_string_t1 \
    "$S_TMP_000" "S_TMP_000" \
    '8c54a6df-5abf-442b-89d7-f2c18001c6e7'
# #--start-of-tests-that-are-expected-to-fail--
# SB_NO_ERRORS_YET="f"
# S_TMP_000="Bar"
# func_mmmv_assert_nonempty_string_but_do_not_exit_t1 \
#     "$S_TMP_000" "S_TMP_000" \
#     'ee720a51-2824-4c3d-a2d7-f2c18001c6e7'
# S_TMP_000=""
# func_mmmv_assert_nonempty_string_but_do_not_exit_t1 \
#     "$S_TMP_000" "S_TMP_000" \
#     '27978c4b-c786-4bc1-82d7-f2c18001c6e7'
#--------------------------------------------------------------------------
SB_NO_ERRORS_YET="t"
S_TMP_000="t"
func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1 \
    "$S_TMP_000" "S_TMP_000" \
    '1346c321-5ce8-4d53-b3d7-f2c18001c6e7'
func_mmmv_assert_sbvar_domain_t_f_t1 \
    "$S_TMP_000" "S_TMP_000" \
    '03c80059-f0c0-424b-b1d7-f2c18001c6e7'
S_TMP_000="f"
func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1 \
    "$S_TMP_000" "S_TMP_000" \
    '7976bc4d-b7ec-4004-b4d7-f2c18001c6e7'
func_mmmv_assert_sbvar_domain_t_f_t1 \
    "$S_TMP_000" "S_TMP_000" \
    '6bd49610-6b38-4a51-84d7-f2c18001c6e7'
# #--start-of-tests-that-are-expected-to-fail--
# SB_NO_ERRORS_YET="f"
# S_TMP_000="t"
# func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1 \
#     "$S_TMP_000" "S_TMP_000" \
#     '8e87314c-53c2-4711-82d7-f2c18001c6e7'
# SB_NO_ERRORS_YET="f"
# S_TMP_000="f"
# func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1 \
#     "$S_TMP_000" "S_TMP_000" \
#     '82ba4614-8a13-4757-94d7-f2c18001c6e7'
# SB_NO_ERRORS_YET="t"
# S_TMP_000="f"
# func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1 \
#     "$S_TMP_000" "S_TMP_000" \
#     '3c77d793-53d2-4c1f-bbd7-f2c18001c6e7'
# SB_NO_ERRORS_YET="t"
# S_TMP_000=""
# func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1 \
#     "$S_TMP_000" "S_TMP_000" \
#     'b3cb2c22-0294-4dae-b3d7-f2c18001c6e7'
# SB_NO_ERRORS_YET="t"
# S_TMP_000=" "
# func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1 \
#     "$S_TMP_000" "S_TMP_000" \
#     '5dfbec33-0e88-447c-9ed7-f2c18001c6e7'
# SB_NO_ERRORS_YET="t"
# S_TMP_000="X"
# func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1 \
#     "$S_TMP_000" "S_TMP_000" \
#     '23444328-10c3-4dca-83d7-f2c18001c6e7'
#--------------------------------------------------------------------------
# func_mmmv_cd_S_FP_ORIG_and_exit_t1
#--------------------------------------------------------------------------
# func_mmmv_create_folder_t1
#--------------------------------------------------------------------------
# func_mmmv_exc_exit_with_an_error_t1
#--------------------------------------------------------------------------
# func_mmmv_exc_exit_with_an_error_t2
#--------------------------------------------------------------------------
# func_mmmv_exit_t1
#--------------------------------------------------------------------------
func_mmmv_include_bashfile_if_possible_t1 \
    "$S_FP_MMMV_BASH_BOILERPLATE_T2_BASH" \
    '38945c81-b974-4796-a4d7-f2c18001c6e7'
#--------------------------------------------------------------------------
func_mmmv_include_bashfile_if_possible_t2 \
    "$S_FP_MMMV_BASH_BOILERPLATE_T2_BASH" \
    'afc0ed17-6bbc-4732-83d7-f2c18001c6e7'
#--------------------------------------------------------------------------
func_mmmv_init_s_timestamp_if_not_inited_t1
#--------------------------------------------------------------------------
# func_mmmv_report_an_error_but_do_not_exit_t1
#--------------------------------------------------------------------------
func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1
func_mmmv_exc_verify_S_FP_ORIG_t1
func_mmmv_exc_verify_S_FP_ORIG_t2
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
echo ""
echo -e "\e[32mSuperficial tests passed without detecting any errors. \e[39m"
echo ""
exit 0 # no errors detected
#==========================================================================
