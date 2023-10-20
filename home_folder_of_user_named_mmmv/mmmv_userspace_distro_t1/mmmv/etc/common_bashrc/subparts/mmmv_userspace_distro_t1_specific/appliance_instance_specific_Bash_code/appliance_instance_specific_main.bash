#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../../../../; pwd`"
fi
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    #--------------------
    echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    #--------------------
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE . \e[39m"
    echo "GUID=='82a6ba88-3448-42fa-8f45-3332b01077e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
S_FP_APPLICATIONS="`cd $MMMV_USERSPACE_DISTRO_T1_HOME/../; pwd`/applications"
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_APPLIANCE_INSTANCE_SPECIFIC_MAIN_BASH_TIMESTAMP" == "$S_TIMESTAMP" ]; then
    # This Bash file should be run exactly once per session and this if-clause
    # aims to detect multiple runs of this Bash file.
    S_FP_TMP_0="${BASH_SOURCE[0]}"
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
        echo ""
        echo -e "\e[31m Some mmmv_userspace_distro_t1 Bash code is flawed. \e[39m"
        echo "The Bash file that outputs this error message "
        echo ""
        echo "    $S_FP_TMP_0"
        echo ""
        echo "is expected to be run only once per session. "
        echo "GUID=='6f118cd3-a8ea-4f88-a135-3332b01077e7'"
        echo ""
    fi
else
    MMMV_USERSPACE_DISTRO_T1_APPLIANCE_INSTANCE_SPECIFIC_MAIN_BASH_TIMESTAMP="$S_TIMESTAMP"
fi
#--------------------------------------------------------------------------
# Sample code for copy-pasting:
# alias angervaks_cp_someplace="printf ' $HOME/destination/folder/ '  | xargs cp   "
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    if [ "$HOSTNAME" == "localhost" ]; then
    #----------------------------------------------------------------------
        S_FP_0="`cd $MMMV_USERSPACE_DISTRO_T1_HOME/../; pwd`/applications/declare_applications.bash"
        #func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
        #------------------------------------------------------------------
        S_TMP_0="/sdcard/Martin"
        SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="f"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_Martin" "$S_TMP_0" \
            "3a834e41-81c5-4739-9135-3332b01077e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
        #------------------------------------------------------------------
        MMMV_USERSPACE_DISTRO_T1_HOSTNAME_SPECIFIC_INITIALISATIONS_TIMESTAMP="$S_TIMESTAMP"
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
# Some templates for copy-pasting:

# alias mmmv_dev_update_testing_copy_of_mmmv_devel_tools_GitHub_repository="S_TIMESTAMP_T1=\"\`mmmv_timestamp_t1.bash\`\" ; S_FP_00=\"\$HOME/Projektid/progremise_infrastruktuur/progremise_t66vahendid/mmmv_devel_tools/githubi_konto_mmmv_devel_tools/mmmv_devel_tools\" ; S_FP_0=\"\$HOME/m_local/lib/minu_enda_loomingu_vanad_versioonid/mmmv_devel_tools_GitHubis_publitseeritu_testkoopia\" ; S_FP_1=\"\$S_FP_0/old_copies/\$S_TIMESTAMP_T1\" ; S_FP_2=\"\$S_FP_0/mmmv_devel_tools\"; mkdir -p \"\$S_FP_1\" ; sync; wait;  if [ -e \"\$S_FP_2\" ]; then mv \"\$S_FP_2\" \"\$S_FP_1/\" ; fi ; sync; wait; cp -f -R \"\$S_FP_00\"  \"\$S_FP_0/\" ; sync; wait; "

#--------------------------------------------------------------------------
S_TMP_0="_home_mmmv_bashrc_subpart.bash"
S_TMP_1="/m_local/etc/$HOSTNAME$S_TMP_0"
S_FP_0="/home/mmmv$S_TMP_1" # does NOT need to exist
if [ -e "$S_FP_0" ]; then
    #----------------------------------------
    if [ ! -d "$S_FP_0" ]; then
        source "$S_FP_0"
    else
        # The 
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" \
            "35d54b72-2b8d-4e7a-aa55-3332b01077e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        # is here to conditionally display an error message.
    fi
    #----------------------------------------
else
    S_FP_0="$HOME$S_TMP_1" # does NOT need to exist
    if [ -e "$S_FP_0" ]; then
        #----------------------------------------
        if [ ! -d "$S_FP_0" ]; then
            source "$S_FP_0"
        else
            # The 
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_0" \
                "59862f54-5f1b-45b0-9815-3332b01077e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            # is here to conditionally display an error message.
        fi
        #----------------------------------------
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            if [ "$HOSTNAME" != "hoidla01" ]; then
                echo ""
                echo "Could not find an optioally used file "
                echo ""
                echo "    $S_FP_0"
                echo ""
                echo "You might find it useful for storing "
                echo "host specific general ~/.bashrc subpart code."
                echo "GUID=='26f1c3d2-3c5d-4240-9f25-3332b01077e7'"
                echo ""
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="9431a181-ba5a-48f6-a115-3332b01077e7"
#==========================================================================
