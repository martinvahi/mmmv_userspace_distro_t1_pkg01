#!/usr/bin/env bash
#==========================================================================
# Initial author of this script: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------
echo ""
echo "Please comment out an exit clause that resides next to the "
echo "GUID=='83214d30-6e26-4b97-9253-31a1401095e7'"
echo ""
exit 1 # for the safe/passive storage of this script

#-----------------start--of--boilerplate-----------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME=$1
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of the Bash script is aborted."
        echo "GUID=='1b93a215-89a4-4f26-a553-31a1401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2
func_mmmv_exit_if_not_on_path_t2 "whoami"
func_mmmv_exit_if_not_on_path_t2 "nilfs-clean"
#--------------------------------------------------------------------------
if [ "`whoami`" != "root" ]; then
    echo ""
    echo "This script is meant to be executed only by the root user."
    echo "GUID=='32e4c185-1a47-49a0-9a53-31a1401095e7'"
    echo ""
    #----
    cd $S_FP_ORIG
    exit 1;
fi
#-----------------end----of--boilerplate-----------------------------------
S_TMP_0="nilfs-clean"
if [ "`which $S_TMP_0 2>/dev/null`" != "" ]; then
    #--------------------
    # https://nilfs.sourceforge.io/en/man8/nilfs-clean.8.html
    #--------------------
    S_NILFSCLEAN_SUSPEND_ALL=""
    S_NILFSCLEAN_RESUME_ALL=""
    #--------------------
    S_TMP_0="/dev/sdb7"
    #----
    S_TMP_1="nilfs-clean --suspend $S_TMP_0 ; sync ; wait ; sync ;"
    alias mmmv_admin_nilfs_cleaner_daemon_suspend_home="$S_TMP_1"
    S_NILFSCLEAN_SUSPEND_ALL="$S_TMP_1 ; $S_NILFSCLEAN_SUSPEND_ALL"
    S_TMP_1="nilfs-clean --resume  $S_TMP_0 ; sync ; wait ; sync ;"
    alias mmmv_admin_nilfs_cleaner_daemon_resume_home="$S_TMP_1"
    S_NILFSCLEAN_RESUME_ALL="$S_TMP_1  ; $S_NILFSCLEAN_RESUME_ALL"
    #--------------------
    S_TMP_0="/dev/sdd1"
    #----
    S_TMP_1="nilfs-clean --suspend $S_TMP_0 ; sync ; wait ; sync ;"
    alias mmmv_admin_nilfs_cleaner_daemon_suspend_magnet_03="$S_TMP_1"
    S_NILFSCLEAN_SUSPEND_ALL="$S_TMP_1 ; $S_NILFSCLEAN_SUSPEND_ALL"
    S_TMP_1="nilfs-clean --resume  $S_TMP_0 ; sync ; wait ; sync ;"
    alias mmmv_admin_nilfs_cleaner_daemon_resume_magnet_03="$S_TMP_1"
    S_NILFSCLEAN_RESUME_ALL="$S_TMP_1  ; $S_NILFSCLEAN_RESUME_ALL"
    #--------------------
    S_TMP_0="/dev/sdc1"
    #----
    S_TMP_1="nilfs-clean --suspend $S_TMP_0 ; sync ; wait ; sync ;"
    alias mmmv_admin_nilfs_cleaner_daemon_suspend_magnet_04="$S_TMP_1"
    S_NILFSCLEAN_SUSPEND_ALL="$S_TMP_1 ; $S_NILFSCLEAN_SUSPEND_ALL"
    S_TMP_1="nilfs-clean --resume  $S_TMP_0 ; sync ; wait ; sync ;"
    alias mmmv_admin_nilfs_cleaner_daemon_resume_magnet_04="$S_TMP_1"
    S_NILFSCLEAN_RESUME_ALL="$S_TMP_1  ; $S_NILFSCLEAN_RESUME_ALL"
    #--------------------
    alias mmmv_admin_nilfs_cleaner_daemon_suspend_all="$S_NILFSCLEAN_SUSPEND_ALL"
    alias mmmv_admin_nilfs_cleaner_daemon_resume_all="$S_NILFSCLEAN_RESUME_ALL"
    #--------------------
else
    echo ""
    echo "\"$S_TMP_0\" is missing from the PATH."
    echo "Skipping the declaration of "
    echo "some \"$S_TMP_0\" related aliases."
    echo "GUID=='17e82564-726c-42c6-b1fc-6062304015e7'"
    echo ""
fi
#--------------------------------------------------------------------------
cd $S_FP_ORIG
exit 0 # no errors detected
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="439caf05-14eb-4ebe-a253-31a1401095e7"
#==========================================================================
