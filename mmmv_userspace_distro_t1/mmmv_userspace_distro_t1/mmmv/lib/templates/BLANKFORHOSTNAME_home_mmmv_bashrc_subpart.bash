#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: <INCOMPLETE: name of the author comes here>
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
#S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
#if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
#    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../../../../; pwd`"
#fi
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" != "" ]; then
        echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    else
        echo "\$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    fi
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE . \e[39m"
    echo "GUID=='f156c434-df42-4674-84b9-31b1900167e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
if [ "$HOSTNAME" == "BLANKFORHOSTNAME" ]; then
    #----------------------------------------------------------------------
    S_FP_0="/home/mmmv/applications/declare_applications.bash"
    func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    #----------------------------------------------------------------------
    # S_FP_BASHFILE="/some/custom/foo.bash"
    # SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # domain: {"","t","f"}
    # func_mmmv_include_bashfile_if_possible_t2 "$S_FP_BASHFILE" \
    #     "25ccf49d-bd6f-4de0-92b9-31b1900167e7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    #----------------------------------------------------------------------
#    S_TMP_PRINTERNAME="Martini_OKI_ML5520_maatriksprinter"
#    alias mmmv_print_OKI_ML5520_maatriksprinter="lp -d Martini_OKI_ML5520_maatriksprinter " # name of the file comes here
    #----------------------------------------------------------------------
    MMMV_USERSPACE_DISTRO_T1_HOSTNAME_SPECIFIC_INITIALISATIONS_TIMESTAMP="$S_TIMESTAMP"
fi
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="442f0891-8e79-4255-82b9-31b1900167e7"
#==========================================================================
