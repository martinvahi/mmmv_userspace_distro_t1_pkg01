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
    echo "GUID=='832fe94d-affe-4c43-9d22-d292704067e7'"
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
    echo "GUID=='172dc152-46b6-4a25-9522-d292704067e7'"
    echo "Thank You."
    echo ""
    SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED="f"
    # "exit 1" must not be here, because 
    # an exit clause would end the login session.
} # func_first_use_warning
func_first_use_warning # Please outcomment this line after
                       # the customisations have been made. Thank You.
#--------------------------------------------------------------------------
if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" == "t" ]; then
#--------------------------------------------------------------------------
    S_FP_APPLICATIONS="$S_FP_DIR_TMP_0"
    #----------------------------------------------------------------------
    export M2="$S_FP_APPLICATIONS/Maven/v_3_6_3" # ..../bin/mvn depends on sh
    if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then # TODO: eliminate the if-clause by updating the function below
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$M2" "6939011d-7df7-45b8-b322-d292704067e7" 
        alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "31544518-68f0-4e6f-9222-d292704067e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c2a5109d-b052-465d-a322-d292704067e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Minase/v2023_01_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "75ba90e3-898b-45db-b622-d292704067e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/MinEd_Text_Editor/v2015_03_xx"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "999e8e16-6f93-4d15-9222-d292704067e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1b1e5828-d540-44bc-b312-d292704067e7" 
    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
    export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "070c9423-a6ad-4c11-b312-d292704067e7" 
    export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    SB_GLIMPSE_EXISTS_ON_PATH="t"
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    SB_AGREP_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Vim/v_9_x"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "effa0125-bca8-414a-9312-d292704067e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "62c834a4-a976-4771-9312-d292704067e7" 
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/lib_OpenSSL/v_3_0_4"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "f6d18147-7ec8-4bdb-b412-d292704067e7"
    # export LD_LIBRARY_PATH="$S_TMP_0/lib64:$LD_LIBRARY_PATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ce68b817-c471-4958-a512-d292704067e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/img2sixel/v2022_12_26"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "65f67d49-8690-4277-8112-d292704067e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/exa/v_0_10_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f2d24733-ee43-4a26-a212-d292704067e7" 
    SB_EXA_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Bash/v_5_1"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "27d9b1dd-89e4-4c9d-8412-d292704067e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_Bash_v_5_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "ec5bd511-0ff7-4e8d-8112-d292704067e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/XTerm/v2023_01_07_newest"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "8d5f9939-1905-416d-8512-d292704067e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_Xterm_v2023_01_07_newest="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "16552ee2-88e6-4b02-8512-d292704067e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "d17d7220-1e19-42cc-9112-d292704067e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "65aebead-50f2-4ad3-a812-d292704067e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GCC/v_11_2_0"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "e2c68739-92a2-41be-a712-d292704067e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_GCC_v_11_2_0="export PATH=\"$S_TMP_0/bin:\$PATH\" ; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$S_TMP_0/lib64:\$LD_LIBRARY_PATH\" ; export CPLUS_INCLUDE_PATH=\"$S_TMP_0/include/c++/11.2.1:$CPLUS_INCLUDE_PATH\""
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "456a724e-a807-4e10-a512-d292704067e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        fi
    fi
    # https://stackoverflow.com/questions/2497344/what-is-the-environment-variable-for-gcc-g-to-look-for-h-files  -during-compila
    #C_INCLUDE_PATH
    #----------------------------------------------------------------------
    export MMMV_ADA_HOME="$S_FP_APPLICATIONS/Ada/v2019_05_17_GNAT_Community"
    MMMV_ADA_INCLUDE="$MMMV_ADA_HOME/include"
    MMMV_ADA_LD_LIBRARY_PATH="$MMMV_ADA_HOME/lib64:$MMMV_ADA_HOME/lib"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$MMMV_ADA_HOME" "94b3a414-8a8c-42f4-9712-d292704067e7" 
    alias mmmv_ui_add2PATH_Ada_2_envs_t1="export PATH=\"$MMMV_ADA_HOME/bin:\$PATH\" ; export MANPATH=\"$MMMV_ADA_HOME/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$MMMV_ADA_LD_LIBRARY_PATH:\$LD_LIBRARY_PATH\" ; "
    #----------------------------------------------------------------------
    export MMMV_PARASAIL_HOME="$S_FP_APPLICATIONS/ParaSail/parasail_release_8_4"
    if [ "$SB_TCSH_EXISTS_ON_PATH" == "t" ]; then
        #------------------------------------------------------------------
        SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_PARASAIL_HOME" "86c36046-7e20-40ec-9512-d292704067e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #----------------------------------------
            # The order, how different MMMV_PARASAIL_HOME
            # subparts are added to the PATH and MANPATH, 
            # is somewhat important, id est the order of 
            # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1(...) 
            # calls is not totally random in this if-clause.
            #----------------------------------------
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            #----------------------------------------
            S_FP_CANDIDATE="$MMMV_PARASAIL_HOME/bin/pslc.csh"
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_CANDIDATE" "6c829819-9a64-46f3-9312-d292704067e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                #--------
                func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                    "$MMMV_PARASAIL_HOME" "cef1e175-eece-4e44-a412-d292704067e7"
                #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
                alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEbin=" cd $MMMV_PARASAIL_HOME ; nice -n 12 $S_FP_CANDIDATE -b3 "
                #--------
            fi
            #----------------------------------------
            S_FP_TMP_0="$MMMV_PARASAIL_HOME/_linux"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_TMP_0" "17c5f04a-12bc-405c-9512-d292704067e7"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                    "$S_FP_TMP_0" "a2dc7428-efdb-4883-9512-d292704067e7"
            fi
            #----------------------------------------
            MMMV_PARASAIL_HOME_INSTALL="$MMMV_PARASAIL_HOME/install"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$MMMV_PARASAIL_HOME_INSTALL" \
                "b3ab6415-ac4b-4f3a-a112-d292704067e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                #--------------------
                func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                    "$MMMV_PARASAIL_HOME_INSTALL" \
                    "050b3ce9-863e-49e7-9412-d292704067e7" 
                #--------------------
                S_FP_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/pslc.csh"
                S_FP_PARASAIL_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/parasail_pslc.csh"
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_PSLC_CSH" "51e79211-f797-4607-8e12-d292704067e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
                if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                    #--------
                    if [ ! -e "$S_FP_PARASAIL_PSLC_CSH" ]; then
                        ln -s "$S_FP_PSLC_CSH" "$S_FP_PARASAIL_PSLC_CSH"
                    fi
                    #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
                    alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEinstallbin=" cd $MMMV_PARASAIL_HOME_INSTALL ; nice -n 12 $S_FP_PSLC_CSH -b3 "
                    #--------
                fi
                #--------------------
            fi
            #----------------------------------------
        fi
        #------------------------------------------------------------------
    fi
    #----------------------------------------
    SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="f"
    S_FP_TMP_0="$S_FP_APPLICATIONS/ParaSail/v_6_5"
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_FP_TMP_0" "a228e5dd-195f-4b5d-9412-d292704067e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_FP_1="$S_FP_APPLICATIONS/ParaSail/v_6_5/build"
        SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_1" "1ebe1d50-fa11-429c-9412-d292704067e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            S_FP_2="$S_FP_1/bin"
            alias mmmv_ParaSail_6_5_parasail_main="$S_FP_2/parasail_main"
            alias mmmv_ParaSail_6_5_parython_main="$S_FP_2/parython_main"
            alias mmmv_ParaSail_6_5_test_runtime="$S_FP_2/test_runtime"
            alias mmmv_ParaSail_6_5_sparkel_main="$S_FP_2/sparkel_main"
        fi
    fi
    #----------------------------------------------------------------------
    func_declare_OpenJ9_alias_t1(){
        #----------------------------------------
        local MMMV_OPENJ9_HOME="$1"
        local S_ALIAS_NAME="$2"
        #----------------------------------------
        local MMMV_OPENJ9_LD_LIBRARY_PATH="$MMMV_OPENJ9_HOME/lib:$MMMV_OPENJ9_HOME/lib/server:$MMMV_OPENJ9_HOME/lib/j9vm:$MMMV_OPENJ9_HOME/lib/default"
        local S_FP_OPENJ9_CONFIG="/home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_java_related_OpenJ9.bash"
        local S_TMP_0=""
        #----------------------------------------
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_OPENJ9_HOME" "d10aa04b-0ffe-4605-a212-d292704067e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #----------------------------------------
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_OPENJ9_CONFIG" "36b1c751-5b98-48f7-8312-d292704067e7" \
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
    #----------------------------------------------------------------------
    MMMV_OPENJ9_HOME_JAVA17="$S_FP_APPLICATIONS/Java/Java17_OpenJ9/jdk-17.0.1+12"
    func_declare_OpenJ9_alias_t1 \
        "$MMMV_OPENJ9_HOME_JAVA17" \
        "mmmv_ui_add2PATH_Java_OpenJ9_Java17"
    # MMMV_OPENJ9_HOME_JAVA8="$S_FP_APPLICATIONS/Java/Java8_OpenJ9/jdk8u312-b07"
    # func_declare_OpenJ9_alias_t1 \
    #     "$MMMV_OPENJ9_HOME_JAVA8" \
    #     "mmmv_ui_add2PATH_Java_OpenJ9_Java8"
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/lib_OpenSSL/v_3_0_4"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "4d570826-177c-4374-8312-d292704067e7"
    # export LD_LIBRARY_PATH="$S_TMP_0/lib64:$LD_LIBRARY_PATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/jigdo/v_0_8_1"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "72030b19-2cb7-4a9c-a212-d292704067e7"
    #----------------------------------------------------------------------
    # export MMMV_RETHINKDB_HOME="$S_FP_APPLICATIONS/RethinkDB/v2017_04_12"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_RETHINKDB_HOME" "54392ce5-e9da-4ed4-8212-d292704067e7" "t"
    # #----------------------------------------------------------------------
    # export MMMV_NODEJS_HOME="$S_FP_APPLICATIONS/NodeJS/v_6_10_3"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_NODEJS_HOME" "2d7d3659-7513-4ec8-8312-d292704067e7" 
    # #----------------------------------------------------------------------
    # export MMMV_UNISON_HOME="$S_FP_APPLICATIONS/Unison/v_2_48_4"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_UNISON_HOME" "520cdcee-fef2-49fb-b312-d292704067e7" 
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
        echo "GUID=='5d4b7d1e-00f7-468d-9222-d292704067e7'"
        echo ""
        # "exit 1" must not be here, because 
        # an exit clause would end the login session.
    fi
fi # SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == "t"
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="21235147-db19-440f-8712-d292704067e7"
#==========================================================================
