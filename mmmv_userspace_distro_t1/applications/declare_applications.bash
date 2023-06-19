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
    echo "GUID=='b2b92f18-4c00-4cbf-a25a-327031a067e7'"
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
    echo "GUID=='3737789f-3353-4c9a-844a-327031a067e7'"
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
    #    #----------------------------------------------------------------------
    #    export M2="$S_FP_APPLICATIONS/Maven/v_3_6_3" # ..../bin/mvn depends on sh
    #    if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then # TODO: eliminate the if-clause by updating the function below
    #        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #            "$M2" "c46dd844-0368-40a7-a55a-327031a067e7" 
    #        alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
    #    fi
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "2ceaca22-0252-4c34-b24a-327031a067e7" 
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "3f37d035-aa2d-4e01-844a-327031a067e7" 
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/Minase/v2023_01_01"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "5b076223-f33a-476f-824a-327031a067e7" 
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/MinEd_Text_Editor/v2015_03_xx"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "1b90f93f-d348-4fd3-814a-327031a067e7" 
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "52499fe3-495e-4db2-b34a-327031a067e7" 
    #    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
    #    export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "f1573b73-27bd-4cc1-ae4a-327031a067e7" 
    #    export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    #    SB_GLIMPSE_EXISTS_ON_PATH="t"
    #    SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    #    SB_AGREP_EXISTS_ON_PATH="t"
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/Vim/v_9_x"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "91bb2f55-cdd2-41a7-934a-327031a067e7" 
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "c75caf3e-6b38-4efe-934a-327031a067e7" 
    #    #----------------------------------------------------------------------
    #    # S_TMP_0="$S_FP_APPLICATIONS/lib_OpenSSL/v_3_0_4"
    #    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    #     "$S_TMP_0" "2ec3453b-0b12-45d5-954a-327031a067e7"
    #    # export LD_LIBRARY_PATH="$S_TMP_0/lib64:$LD_LIBRARY_PATH"
    #    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    #    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "168dc154-3b18-44a7-954a-327031a067e7" 
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/img2sixel/v2022_12_26"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "14a98190-1458-42cb-854a-327031a067e7" 
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/exa/v_0_10_1"
    #    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #        "$S_TMP_0" "ba8adf27-c353-4d35-b24a-327031a067e7" 
    #    SB_EXA_EXISTS_ON_PATH="t"
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/Bash/v_5_1"
    #    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    #    "$S_TMP_0" "1610a811-3084-4bcf-a34a-327031a067e7" 
    #    if [ -e "$S_TMP_0" ]; then
    #        if [ -d "$S_TMP_0" ]; then
    #            alias mmmv_ui_add2PATH_Bash_v_5_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    #        else
    #            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #                "$S_TMP_0" "9bdc9648-2724-4ce7-b44a-327031a067e7" \
    #                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #        fi
    #    fi
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/XTerm/v2023_01_07_newest"
    #    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    #    "$S_TMP_0" "a67ee8bb-1fe6-4594-824a-327031a067e7" 
    #    if [ -e "$S_TMP_0" ]; then
    #        if [ -d "$S_TMP_0" ]; then
    #            alias mmmv_ui_add2PATH_Xterm_v2023_01_07_newest="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    #        else
    #            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #                "$S_TMP_0" "4a1a5558-e70c-4f1b-914a-327031a067e7" \
    #                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #        fi
    #    fi
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    #    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    #    "$S_TMP_0" "31833244-2cbb-4277-934a-327031a067e7" 
    #    if [ -e "$S_TMP_0" ]; then
    #        if [ -d "$S_TMP_0" ]; then
    #            alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    #        else
    #            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #                "$S_TMP_0" "9414d854-d943-4b82-944a-327031a067e7" \
    #                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #        fi
    #    fi
    #    #----------------------------------------------------------------------
    #    S_TMP_0="$S_FP_APPLICATIONS/GCC/v_11_2_0"
    #    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    #    "$S_TMP_0" "348d9e1e-1c6b-401d-934a-327031a067e7" 
    #    if [ -e "$S_TMP_0" ]; then
    #        if [ -d "$S_TMP_0" ]; then
    #            alias mmmv_ui_add2PATH_GCC_v_11_2_0="export PATH=\"$S_TMP_0/bin:\$PATH\" ; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$S_TMP_0/lib64:\$LD_LIBRARY_PATH\" ; export CPLUS_INCLUDE_PATH=\"$S_TMP_0/include/c++/11.2.1:$CPLUS_INCLUDE_PATH\""
    #        else
    #            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #                "$S_TMP_0" "17374d57-108e-4565-814a-327031a067e7" \
    #                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #        fi
    #    fi
    #    # https://stackoverflow.com/questions/2497344/what-is-the-environment-variable-for-gcc-g-to-look-for-h-files  -during-compila
    #    #C_INCLUDE_PATH
    #    #----------------------------------------------------------------------
    #    export MMMV_ADA_HOME="$S_FP_APPLICATIONS/Ada/v2019_05_17_GNAT_Community"
    #    MMMV_ADA_INCLUDE="$MMMV_ADA_HOME/include"
    #    MMMV_ADA_LD_LIBRARY_PATH="$MMMV_ADA_HOME/lib64:$MMMV_ADA_HOME/lib"
    #    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    #    "$MMMV_ADA_HOME" "2edda446-bb9d-47ae-a24a-327031a067e7" 
    #    alias mmmv_ui_add2PATH_Ada_2_envs_t1="export PATH=\"$MMMV_ADA_HOME/bin:\$PATH\" ; export MANPATH=\"$MMMV_ADA_HOME/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$MMMV_ADA_LD_LIBRARY_PATH:\$LD_LIBRARY_PATH\" ; "
    #    #----------------------------------------------------------------------
    #    export MMMV_PARASAIL_HOME="$S_FP_APPLICATIONS/ParaSail/parasail_release_8_4"
    #    if [ "$SB_TCSH_EXISTS_ON_PATH" == "t" ]; then
    #        #------------------------------------------------------------------
    #        SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #            "$MMMV_PARASAIL_HOME" "3356e662-1209-4c0b-b44a-327031a067e7" \
    #            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #            #----------------------------------------
    #            # The order, how different MMMV_PARASAIL_HOME
    #            # subparts are added to the PATH and MANPATH, 
    #            # is somewhat important, id est the order of 
    #            # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1(...) 
    #            # calls is not totally random in this if-clause.
    #            #----------------------------------------
    #            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #            #----------------------------------------
    #            S_FP_CANDIDATE="$MMMV_PARASAIL_HOME/bin/pslc.csh"
    #            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    #                "$S_FP_CANDIDATE" "08eed949-24fc-4882-a54a-327031a067e7" \
    #                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #                #--------
    #                func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #                    "$MMMV_PARASAIL_HOME" "1ab2c129-72d7-4d24-b14a-327031a067e7"
    #                #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
    #                alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEbin=" cd $MMMV_PARASAIL_HOME ; nice -n 12 $S_FP_CANDIDATE -b3 "
    #                #--------
    #            fi
    #            #----------------------------------------
    #            S_FP_TMP_0="$MMMV_PARASAIL_HOME/_linux"
    #            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #                "$S_FP_TMP_0" "41c6f11e-f0f7-469a-a54a-327031a067e7"
    #            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #                func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #                    "$S_FP_TMP_0" "d2ffba3a-9f89-4ee2-b34a-327031a067e7"
    #            fi
    #            #----------------------------------------
    #            MMMV_PARASAIL_HOME_INSTALL="$MMMV_PARASAIL_HOME/install"
    #            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #                "$MMMV_PARASAIL_HOME_INSTALL" \
    #                "f8a6485c-3386-4cd6-814a-327031a067e7" \
    #                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #                #--------------------
    #                func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #                    "$MMMV_PARASAIL_HOME_INSTALL" \
    #                    "5fb9605e-3796-408e-944a-327031a067e7" 
    #                #--------------------
    #                S_FP_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/pslc.csh"
    #                S_FP_PARASAIL_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/parasail_pslc.csh"
    #                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    #                    "$S_FP_PSLC_CSH" "798ebd59-de71-47f4-b24a-327031a067e7" \
    #                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #                if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #                    #--------
    #                    if [ ! -e "$S_FP_PARASAIL_PSLC_CSH" ]; then
    #                        ln -s "$S_FP_PSLC_CSH" "$S_FP_PARASAIL_PSLC_CSH"
    #                    fi
    #                    #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
    #                    alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEinstallbin=" cd $MMMV_PARASAIL_HOME_INSTALL ; nice -n 12 $S_FP_PSLC_CSH -b3 "
    #                    #--------
    #                fi
    #                #--------------------
    #            fi
    #            #----------------------------------------
    #        fi
    #        #------------------------------------------------------------------
    #    fi
    #    #----------------------------------------
    #    SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="f"
    #    S_FP_TMP_0="$S_FP_APPLICATIONS/ParaSail/v_6_5"
    #    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #        "$S_FP_TMP_0" "c6432531-e3af-45af-834a-327031a067e7" \
    #        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #        S_FP_1="$S_FP_APPLICATIONS/ParaSail/v_6_5/build"
    #        SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #            "$S_FP_1" "525f9642-9d8d-4c38-a44a-327031a067e7" \
    #            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    #        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #            S_FP_2="$S_FP_1/bin"
    #            alias mmmv_ParaSail_6_5_parasail_main="$S_FP_2/parasail_main"
    #            alias mmmv_ParaSail_6_5_parython_main="$S_FP_2/parython_main"
    #            alias mmmv_ParaSail_6_5_test_runtime="$S_FP_2/test_runtime"
    #            alias mmmv_ParaSail_6_5_sparkel_main="$S_FP_2/sparkel_main"
    #        fi
    #    fi
    #    #----------------------------------------------------------------------
    #    func_declare_OpenJ9_alias_t1(){
    #        #----------------------------------------
    #        local MMMV_OPENJ9_HOME="$1"
    #        local S_ALIAS_NAME="$2"
    #        #----------------------------------------
    #        local MMMV_OPENJ9_LD_LIBRARY_PATH="$MMMV_OPENJ9_HOME/lib:$MMMV_OPENJ9_HOME/lib/server:$MMMV_OPENJ9_HOME/lib/j9vm:$MMMV_OPENJ9_HOME/lib/default"
    #        local S_FP_OPENJ9_CONFIG="/home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_java_related_OpenJ9.bash"
    #        local S_TMP_0=""
    #        #----------------------------------------
    #        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    #            "$MMMV_OPENJ9_HOME" "1a151b4f-db22-4fef-814a-327031a067e7" \
    #            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #            #----------------------------------------
    #            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    #                "$S_FP_OPENJ9_CONFIG" "1d785e22-675e-40cf-944a-327031a067e7" \
    #                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #                #alias mmmv_ui_add2PATH_Java_OpenJ9_2_envs_t1="export JAVA_HOME=\"$MMMV_OPENJ9_HOME\" ; export PATH=\"$MMMV_OPENJ9_HOME/bin:\$PATH\" ; export MANPATH=\"$MMMV_OPENJ9_HOME/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$MMMV_OPENJ9_LD_LIBRARY_PATH:\$LD_LIBRARY_PATH\" ; source \"$S_FP_OPENJ9_CONFIG\" ; "
    #                S_TMP_0="alias $S_ALIAS_NAME=\"export JAVA_HOME=\\\"$MMMV_OPENJ9_HOME\\\" ; export PATH=\\\"$MMMV_OPENJ9_HOME/bin:\\\$PATH\\\" ; export MANPATH=\\\"$MMMV_OPENJ9_HOME/man:\\\$MANPATH\\\" ; export LD_LIBRARY_PATH=\\\"$MMMV_OPENJ9_LD_LIBRARY_PATH:\\\$LD_LIBRARY_PATH\\\" ; source \\\"$S_FP_OPENJ9_CONFIG\\\" ; \""
    #                eval ${S_TMP_0}
    #            fi
    #            #----------------------------------------
    #        fi
    #        #----------------------------------------
    #    } # func_declare_OpenJ9_alias
    #    #----------------------------------------------------------------------
    #    MMMV_OPENJ9_HOME_JAVA17="$S_FP_APPLICATIONS/Java/Java17_OpenJ9/jdk-17.0.1+12"
    #    func_declare_OpenJ9_alias_t1 \
    #        "$MMMV_OPENJ9_HOME_JAVA17" \
    #        "mmmv_ui_add2PATH_Java_OpenJ9_Java17"
    #    MMMV_OPENJ9_HOME_JAVA8="$S_FP_APPLICATIONS/Java/Java8_OpenJ9/jdk8u312-b07"
    #    func_declare_OpenJ9_alias_t1 \
    #        "$MMMV_OPENJ9_HOME_JAVA8" \
    #        "mmmv_ui_add2PATH_Java_OpenJ9_Java8"
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/lib_OpenSSL/v_3_0_4"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "482017fa-f304-4de2-a54a-327031a067e7"
    # export LD_LIBRARY_PATH="$S_TMP_0/lib64:$LD_LIBRARY_PATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/jigdo/v_0_8_1"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "9c64c933-3134-49ed-834a-327031a067e7"
    #----------------------------------------------------------------------
    # export MMMV_RETHINKDB_HOME="$S_FP_APPLICATIONS/RethinkDB/v2017_04_12"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_RETHINKDB_HOME" "c4bc48f0-7bac-4d38-914a-327031a067e7" "t"
    # #----------------------------------------------------------------------
    # export MMMV_NODEJS_HOME="$S_FP_APPLICATIONS/NodeJS/v_6_10_3"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_NODEJS_HOME" "94f3ee8a-2d34-4874-a14a-327031a067e7" 
    # #----------------------------------------------------------------------
    # export MMMV_UNISON_HOME="$S_FP_APPLICATIONS/Unison/v_2_48_4"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_UNISON_HOME" "5a95cb2a-436b-4d41-854a-327031a067e7" 
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
        echo "GUID=='28f40f54-d1b1-445a-aa4a-327031a067e7'"
        echo ""
        # "exit 1" must not be here, because 
        # an exit clause would end the login session.
    fi
fi # SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == "t"
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="b1245d30-215b-401e-834a-327031a067e7"
#==========================================================================
