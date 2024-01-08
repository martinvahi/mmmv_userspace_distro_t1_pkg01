#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
S_FN_SCRIPTFILE_TMP_0="`basename ${BASH_SOURCE[0]}`"
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../; pwd`/mmmv_userspace_distro_t1"
fi
#--------------------------------------------------------------------------

if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    #--------------------
    #echo "/home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    #--------------------
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE\e[39m ."
    echo "GUID=='265375cb-2a71-4444-92c1-41a3a08018e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED="t"
func_first_use_warning(){
    echo ""
    echo ""
    echo -e "\e[33mPlease customise this script\e[39m, the "
    echo ""
    echo -e "\e[33m    $S_FP_DIR_TMP_0/$S_FN_SCRIPTFILE_TMP_0\e[39m"
    echo ""
    echo "so that it matches Your setup. This message has been "
    echo "displayed from Bash code that resides near the following GUID:"
    echo "GUID=='04a43459-fbfd-4ce1-a5c1-41a3a08018e7'"
    echo "Thank You."
    echo ""
    SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED="f"
    # "exit 1" must not be here, because 
    # an exit clause would end the login session.
} # func_first_use_warning
#func_first_use_warning # Please outcomment this line after
                       # the customisations have been made. Thank You.
#--------------------------------------------------------------------------
func_declare_OpenJ9_alias_t1(){
    #----------------------------------------
    local MMMV_OPENJ9_HOME="$1"
    local S_ALIAS_NAME="$2"
    #----------------------------------------
    local MMMV_OPENJ9_LD_LIBRARY_PATH="$MMMV_OPENJ9_HOME/lib:$MMMV_OPENJ9_HOME/lib/server:$MMMV_OPENJ9_HOME/lib/j9vm:$MMMV_OPENJ9_HOME/lib/default"
    local S_TMP_0="mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_java_related_OpenJ9.bash"
    local S_FP_OPENJ9_CONFIG="/home/mmmv/mmmv_userspace_distro_t1/$S_TMP_0"
    if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" != "" ]; then
        S_FP_OPENJ9_CONFIG="$MMMV_USERSPACE_DISTRO_T1_HOME/$S_TMP_0"
    fi
    #----------------------------------------
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$MMMV_OPENJ9_HOME" "a5739f22-379f-4fee-b2c1-41a3a08018e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "2f3e0a03-977a-4699-bcc1-41a3a08018e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #alias mmmv_ui_add2PATH_Java_OpenJ9_2_envs_t1="export JAVA_HOME=\"$MMMV_OPENJ9_HOME\" ; export PATH=\"$MMMV_OPENJ9_HOME/bin:\$PATH\" ; export MANPATH=\"$MMMV_OPENJ9_HOME/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$MMMV_OPENJ9_LD_LIBRARY_PATH:\$LD_LIBRARY_PATH\" ; source \"$S_FP_OPENJ9_CONFIG\" ; "
            S_TMP_0="alias $S_ALIAS_NAME=\"export JAVA_HOME=\\\"$MMMV_OPENJ9_HOME\\\" ; export PATH=\\\"$MMMV_OPENJ9_HOME/bin:\\\$PATH\\\" ; export MANPATH=\\\"$MMMV_OPENJ9_HOME/man:\\\$MANPATH\\\" ; export LD_LIBRARY_PATH=\\\"$MMMV_OPENJ9_LD_LIBRARY_PATH:\\\$LD_LIBRARY_PATH\\\" ; source \\\"$S_FP_OPENJ9_CONFIG\\\" ; \""
            eval ${S_TMP_0}
        fi
        #----------------------------------------
    fi
    #----------------------------------------
} # func_declare_OpenJ9_alias
#--------------------------------------------------------------------------
if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" == "t" ]; then
#--------------------------------------------------------------------------
    S_FP_APPLICATIONS="$S_FP_DIR_TMP_0"
    #----------------------------------------------------------------------
    export M2="$S_FP_APPLICATIONS/Maven/v_3_6_3" # ..../bin/mvn depends on sh
    if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then # TODO: eliminate the if-clause by updating the function below
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$M2" "6282d106-9ba4-443d-b8b1-41a3a08018e7" 
        alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "511db755-7e1b-49da-b1b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "834b283f-65a8-4e18-a1b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "66e89413-5949-426c-84b1-41a3a08018e7" 
    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
    export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4de21610-4f01-464d-a5b1-41a3a08018e7" 
    export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    SB_GLIMPSE_EXISTS_ON_PATH="t"
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    SB_AGREP_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2d636336-6746-4fcd-81b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f3c11d21-329e-48dc-93b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "11a3faa2-16cc-41c3-95b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b3b8ac4d-4aca-4126-a3b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9a632433-8cca-4af2-b3b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "540c6341-17d8-4963-b1b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ad27ebda-04fb-4be0-84b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0b893b34-053d-4c13-91b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2ccc821f-67b4-4f07-a4b1-41a3a08018e7"
        #----------------------------------------
        S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_TMP_0" "10acdfe5-f8e1-4ecf-85b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "908bdd44-0094-42a0-83b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1155a745-f4f9-4759-a8b1-41a3a08018e7" 
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPATH="$S_TMP_0/include:$CPATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1fd8b759-50e0-4708-92b1-41a3a08018e7"
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    #----------------------------------------------------------------------
    MMMV_OPENJ9_HOME_JAVA17="$S_FP_APPLICATIONS/Java/Java17_OpenJ9/jdk-17.0.1+12"
    # func_declare_OpenJ9_alias_t1 \
    #     "$MMMV_OPENJ9_HOME_JAVA17" \
    #     "mmmv_ui_add2PATH_Java_OpenJ9_Java17"
    MMMV_OPENJ9_HOME_JAVA8="$S_FP_APPLICATIONS/Java/Java8_OpenJ9/jdk8u312-b07"
    # func_declare_OpenJ9_alias_t1 \
    #   "$MMMV_OPENJ9_HOME_JAVA8" \
    #   "mmmv_ui_add2PATH_Java_OpenJ9_Java8"
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/Vim/v_9_x"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "42154e12-2b8f-432d-a2b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/Minase/v2023_01_01"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "5409eb41-d023-4bff-94b1-41a3a08018e7" 
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/MinEd_Text_Editor/v2015_03_xx"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "9151ac77-7a66-4f99-bab1-41a3a08018e7" 
    #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/img2sixel/v2022_12_26"
#     func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#         "$S_TMP_0" "10aa4133-d737-45bf-a4a1-41a3a08018e7" 
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/exa/v_0_10_1"
#     func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#         "$S_TMP_0" "3c2a055f-faba-4048-b1a1-41a3a08018e7" 
#     SB_EXA_EXISTS_ON_PATH="t"
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/Bash/v_5_1"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "5aab2836-8cec-4929-94a1-41a3a08018e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_Bash_v_5_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "e0613d5c-926a-416a-a4a1-41a3a08018e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/XTerm/v2023_01_07_newest"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "e0a2e441-7eac-4e06-a4a1-41a3a08018e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_Xterm_v2023_01_07_newest="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "e9c8c141-51a1-4f3c-a2a1-41a3a08018e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "2e23fb41-3091-44ab-a5a1-41a3a08018e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "27794649-c207-45c0-81a1-41a3a08018e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/GCC/v_11_2_0"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "1cb5d25f-11b9-4306-91a1-41a3a08018e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_GCC_v_11_2_0="export PATH=\"$S_TMP_0/bin:\$PATH\" ; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$S_TMP_0/lib64:\$LD_LIBRARY_PATH\" ; export CPLUS_INCLUDE_PATH=\"$S_TMP_0/include/c++/11.2.1:$CPLUS_INCLUDE_PATH\""
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "178ea95b-9e03-472a-84a1-41a3a08018e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     # https://stackoverflow.com/questions/2497344/what-is-the-environment-variable-for-gcc-g-to-look-for-h-files  -during-compila
#     #C_INCLUDE_PATH
#     #----------------------------------------------------------------------
#     export MMMV_ADA_HOME="$S_FP_APPLICATIONS/Ada/v2019_05_17_GNAT_Community"
#     MMMV_ADA_INCLUDE="$MMMV_ADA_HOME/include"
#     MMMV_ADA_LD_LIBRARY_PATH="$MMMV_ADA_HOME/lib64:$MMMV_ADA_HOME/lib"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$MMMV_ADA_HOME" "9d77ac1b-37b1-47d7-91a1-41a3a08018e7" 
#     alias mmmv_ui_add2PATH_Ada_2_envs_t1="export PATH=\"$MMMV_ADA_HOME/bin:\$PATH\" ; export MANPATH=\"$MMMV_ADA_HOME/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$MMMV_ADA_LD_LIBRARY_PATH:\$LD_LIBRARY_PATH\" ; "
#     #----------------------------------------------------------------------
#     export MMMV_PARASAIL_HOME="$S_FP_APPLICATIONS/ParaSail/parasail_release_8_4"
#     if [ "$SB_TCSH_EXISTS_ON_PATH" == "t" ]; then
#         #------------------------------------------------------------------
#         SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#         func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#             "$MMMV_PARASAIL_HOME" "e6d2573c-248a-4a5c-a2a1-41a3a08018e7" \
#             "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#             #----------------------------------------
#             # The order, how different MMMV_PARASAIL_HOME
#             # subparts are added to the PATH and MANPATH, 
#             # is somewhat important, id est the order of 
#             # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1(...) 
#             # calls is not totally random in this if-clause.
#             #----------------------------------------
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             #----------------------------------------
#             S_FP_CANDIDATE="$MMMV_PARASAIL_HOME/bin/pslc.csh"
#             func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
#                 "$S_FP_CANDIDATE" "ebf5b64c-ad72-4eb7-a3a1-41a3a08018e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 #--------
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$MMMV_PARASAIL_HOME" "55436ad5-96bc-47e8-a2a1-41a3a08018e7"
#                 #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
#                 alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEbin=" cd $MMMV_PARASAIL_HOME ; nice -n 12 $S_FP_CANDIDATE -b3 "
#                 #--------
#             fi
#             #----------------------------------------
#             S_FP_TMP_0="$MMMV_PARASAIL_HOME/_linux"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_FP_TMP_0" "d15e3914-1af1-4cba-bda1-41a3a08018e7"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$S_FP_TMP_0" "dd3f4a50-dc94-43d1-a1a1-41a3a08018e7"
#             fi
#             #----------------------------------------
#             MMMV_PARASAIL_HOME_INSTALL="$MMMV_PARASAIL_HOME/install"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$MMMV_PARASAIL_HOME_INSTALL" \
#                 "3c75d655-f251-48fd-94a1-41a3a08018e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 #--------------------
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$MMMV_PARASAIL_HOME_INSTALL" \
#                     "1994ef22-e646-4b7d-a1a1-41a3a08018e7" 
#                 #--------------------
#                 S_FP_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/pslc.csh"
#                 S_FP_PARASAIL_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/parasail_pslc.csh"
#                 func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
#                     "$S_FP_PSLC_CSH" "550d2b3c-cdc8-47cb-b4a1-41a3a08018e7" \
#                     "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#                 if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                     #--------
#                     if [ ! -e "$S_FP_PARASAIL_PSLC_CSH" ]; then
#                         ln -s "$S_FP_PSLC_CSH" "$S_FP_PARASAIL_PSLC_CSH"
#                     fi
#                     #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
#                     alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEinstallbin=" cd $MMMV_PARASAIL_HOME_INSTALL ; nice -n 12 $S_FP_PSLC_CSH -b3 "
#                     #--------
#                 fi
#                 #--------------------
#             fi
#             #----------------------------------------
#         fi
#         #------------------------------------------------------------------
#     fi
#     #----------------------------------------
#     SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="f"
#     S_FP_TMP_0="$S_FP_APPLICATIONS/ParaSail/v_6_5"
#     func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#         "$S_FP_TMP_0" "160a5d12-f039-4e25-83a1-41a3a08018e7" \
#         "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#     if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#         S_FP_1="$S_FP_APPLICATIONS/ParaSail/v_6_5/build"
#         SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#         func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#             "$S_FP_1" "4d6a6556-7c2c-4c18-a1a1-41a3a08018e7" \
#             "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#             S_FP_2="$S_FP_1/bin"
#             alias mmmv_ParaSail_6_5_parasail_main="$S_FP_2/parasail_main"
#             alias mmmv_ParaSail_6_5_parython_main="$S_FP_2/parython_main"
#             alias mmmv_ParaSail_6_5_test_runtime="$S_FP_2/test_runtime"
#             alias mmmv_ParaSail_6_5_sparkel_main="$S_FP_2/sparkel_main"
#         fi
#     fi
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/jigdo/v_0_8_1"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "ba36643d-d787-48a5-b2a1-41a3a08018e7"
    #----------------------------------------------------------------------
    # export MMMV_RETHINKDB_HOME="$S_FP_APPLICATIONS/RethinkDB/v2017_04_12"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_RETHINKDB_HOME" "2c6dea86-f812-43a6-b391-41a3a08018e7" "t"
    # #----------------------------------------------------------------------
    # export MMMV_NODEJS_HOME="$S_FP_APPLICATIONS/NodeJS/v_6_10_3"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_NODEJS_HOME" "44f854b3-0f35-4467-9391-41a3a08018e7" 
    # #----------------------------------------------------------------------
    # export MMMV_UNISON_HOME="$S_FP_APPLICATIONS/Unison/v_2_48_4"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_UNISON_HOME" "3fed3fb4-523d-4486-8491-41a3a08018e7" 
    # #----------------------------------------------------------------------
    # #export GOROOT_FINAL="$S_FP_APPLICATIONS/Go/v2016_06"
    # #export GOROOT="$GOROOT_FINAL"
    # #export GOARCH="arm"
    # #export GOOS="linux"
    # #----------------------------------------------------------------------
#--------------------------------------------------------------------------
else
    if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" != "f" ]; then
        echo ""
        echo -e "\e[31mThis script is flawed.\e[39m"
        echo "SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == \"$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED\""
        echo "GUID=='1c85c817-f4f0-4ff2-b3c1-41a3a08018e7'"
        echo ""
        # "exit 1" must not be here, because 
        # an exit clause would end the login session.
    fi
fi # SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == "t"
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="ae6c9a24-1857-4d3e-9291-41a3a08018e7"
#==========================================================================
