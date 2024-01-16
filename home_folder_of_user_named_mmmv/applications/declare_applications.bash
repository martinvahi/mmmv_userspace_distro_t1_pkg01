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
    echo "GUID=='a936484d-2057-4530-b811-71a0210118e7'"
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
    echo "GUID=='5464b5df-265c-43be-8d01-71a0210118e7'"
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
        "$MMMV_OPENJ9_HOME" "2134a0b4-1258-423e-8905-71a0210118e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "3578ab21-2ffc-4214-8522-71a0210118e7" \
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
            "$M2" "b12cb52d-18d9-423b-b2f9-71a0210118e7" 
        alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "53c8dd1f-7e0b-452d-8025-71a0210118e7" 
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c3277bb9-31e3-4346-8085-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "119090f8-8c00-4557-9c53-71a0210118e7" 
    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
    export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "364ad58c-59d5-4b50-88ae-71a0210118e7" 
    export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    SB_GLIMPSE_EXISTS_ON_PATH="t"
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    SB_AGREP_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "647aa6bc-e921-44a0-81b2-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6341cd73-26f4-4837-a33e-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c8744750-d56d-4f3a-93ab-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "a1bdd46c-9dac-4515-85a2-71a0210118e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "9b06c175-0000-4247-be55-71a0210118e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "cca2eb3b-3537-459e-bb11-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "32d85512-fcff-457a-bd64-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6b18a7ce-bb03-4301-bbd4-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "083b609c-d1ee-42e0-a062-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2cmdline/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c64f4dcd-5cc8-4d56-9a1d-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b27f3c03-e4a2-43a1-9dd2-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c31b03d3-696b-4112-a774-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "330e5b75-ab5d-4481-9871-71a0210118e7"
        #----------------------------------------
        S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_TMP_0" "44167d28-565c-425b-9d24-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6476bde0-e7eb-440c-9e92-71a0210118e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5a22c358-12f5-4d8d-9075-71a0210118e7" 
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPATH="$S_TMP_0/include:$CPATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "22355e89-2855-42e4-85e3-71a0210118e7"
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    #----------------------------------------------------------------------
    MMMV_OPENJ9_HOME_JAVA17="$S_FP_APPLICATIONS/Java/jdk-17.0.1+12"
    # func_declare_OpenJ9_alias_t1 \
    #     "$MMMV_OPENJ9_HOME_JAVA17" \
    #     "mmmv_ui_add2PATH_Java_OpenJ9_Java17"
    MMMV_OPENJ9_HOME_JAVA8="$S_FP_APPLICATIONS/Java/jdk8u312-b07"
    # func_declare_OpenJ9_alias_t1 \
    #   "$MMMV_OPENJ9_HOME_JAVA8" \
    #   "mmmv_ui_add2PATH_Java_OpenJ9_Java8"
    #----------------------------------------------------------------------
#--------------------------------------------------------------------------
else
    if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" != "f" ]; then
        echo ""
        echo -e "\e[31mThis script is flawed.\e[39m"
        echo "SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == \"$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED\""
        echo "GUID=='064b4d1c-1cd1-4d6f-9074-71a0210118e7'"
        echo ""
        # "exit 1" must not be here, because 
        # an exit clause would end the login session.
    fi
fi # SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == "t"
#==========================================================================
# S_VERSION_OF_THIS_FILE="d1178d46-6102-4201-9fc4-71a0210118e7"
#==========================================================================
