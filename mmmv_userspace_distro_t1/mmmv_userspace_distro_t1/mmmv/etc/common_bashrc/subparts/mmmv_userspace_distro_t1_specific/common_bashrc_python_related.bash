#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================

if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    echo "/home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo "Exiting with an error code $S_ERR_CODE ."
    echo "GUID=='42f4ca1e-4dfd-4491-b513-e0e1514127e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------
# Python related parts.
#
# The place, where the pip/pip3 stores Python packages, 
# is determined by the environment variable PYTHONUSERBASE .
# The name of the variable seems to be the same for both, 
# Python2 and Python3.
#
#     https://docs.python.org/3/using/cmdline.html#environment-variables
#     https://docs.python.org/2/using/cmdline.html#environment-variables
#
# However, at 
#     https://www.python.org/dev/peps/pep-0370/#implementation
#     (archival copy: https://archive.is/2QaiU )
# there is the following citation:
# 
#    ----citation----start----------------------------------------
#    The user site directory can be suppressed with a new 
#    option -s or the environment variable PYTHONNOUSERSITE . 
#    The feature can be disabled globally by setting site.ENABLE_USER_SITE 
#    to the value False . It must be set by editing site.py . 
#    It can't be altered in sitecustomize.py or later.
#
#    The path to the user base directory can be overwritten 
#    with the environment variable PYTHONUSERBASE . 
#    The default location is used when PYTHONUSERBASE is not set or empty.
#    ----citation----end------------------------------------------
#
# A citation from some real-life "site.py":
#
#    ----citation----start----------------------------------------
#    Enable per user site-packages directory
#    set it to False to disable the feature or True to force the feature
#    ENABLE_USER_SITE = None
#    ----citation----end------------------------------------------
# 
#--------------------------------------------------------------------------

PYTHONUSERBASE="$HOME/.mmmv/mmmv_python_pip_storage"
if [ ! -e "$PYTHONUSERBASE" ]; then
    mkdir -p $PYTHONUSERBASE 
    func_mmmv_wait_and_sync_t1
    if [ ! -e "$PYTHONUSERBASE" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
            echo ""
            echo "The PYTHONUSERBASE (== "
            echo "$PYTHONUSERBASE"
            echo ") is missing. and its creation also failed."
            echo "GUID=='a1d64637-5fbd-461b-b413-e0e1514127e7'"
            echo ""
        fi
    fi
fi
SB_VERIFICATION_FAILED="t" # a variable for the output of the
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$PYTHONUSERBASE" "3e2ccc2f-46ff-457b-a113-e0e1514127e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    PYTHONPATH="$PYTHONUSERBASE:$PYTHONPATH"
    S_FP_0="$PYTHONUSERBASE/bin"
    if [ ! -e "$S_FP_0" ]; then
        mkdir -p "$S_FP_0"
        func_mmmv_wait_and_sync_t1
    fi
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_FP_0" "7119462b-d34d-4762-9513-e0e1514127e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    fi
else
    PYTHONUSERBASE=""
fi

export PYTHONUSERBASE
export PYTHONPATH
#export PYTHONNOUSERSITE="$PYTHONUSERBASE"

#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="da327842-beeb-4527-9513-e0e1514127e7"
#==========================================================================
