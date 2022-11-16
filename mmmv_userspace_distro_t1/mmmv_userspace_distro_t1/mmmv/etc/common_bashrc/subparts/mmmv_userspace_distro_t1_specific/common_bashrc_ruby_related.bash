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
    echo "GUID=='78f99626-cb79-40ef-a149-b363808096e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------
export GEM_HOME="$HOME/.mmmv/mmmv_gem_home"
if [ ! -e "$GEM_HOME" ]; then
    if [ -h "$GEM_HOME" ]; then
        echo ""
        echo "The GEM_HOME(== "
        echo "$GEM_HOME"
        echo ") is a broken symlink. "
        echo "GUID=='266e0353-c666-44a5-a439-b363808096e7'"
        echo ""
        # It's OK for the GEM_HOME to be a symlink and
        # if it is a symlink, then the symlink 
        # should not be deleted by this script.
    else
        mkdir -p $GEM_HOME 
        func_mmmv_wait_and_sync_t1
        if [ ! -e "$GEM_HOME" ]; then
            echo ""
            echo "The GEM_HOME(== "
            echo "$GEM_HOME"
            echo ") is missing. and its creation also failed."
            echo "GUID=='7c5dcd42-7df2-4cb8-b339-b363808096e7'"
            echo ""
        fi
    fi
fi
if [ -e "$GEM_HOME" ]; then
    S_FP_0="$GEM_HOME/bin"
    if [ ! -e "$S_FP_0" ]; then
        if [ -h "$S_FP_0" ]; then
            echo ""
            echo "The "
            echo "$S_FP_0"
            echo ") is a broken symlink and it will be replaced with a folder."
            echo "GUID=='419dd2d5-086c-48ba-a239-b363808096e7'"
            echo ""
            rm -f "$S_FP_0" # removes a broken symlink, if the broken symlink exists
        fi
        mkdir -p  $S_FP_0 # for the case, where no gems have been installed yet
        func_mmmv_wait_and_sync_t1
    fi
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_FP_0" "a24d195a-faef-461c-9139-b363808096e7"
    if [ -e "$S_FP_0" ]; then
        if [ -d "$S_FP_0" ]; then
            Z_PATH="$S_FP_0:$Z_PATH"
            S_FP_1="$S_FP_0/solargraph"
            if [ -e "$S_FP_1" ]; then
                if [ ! -d "$S_FP_1" ]; then
                    alias mmmv_run_solargraph_jit_01="nice -n 5 ruby --jit $S_FP_1 "
                else
                    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                        "$S_FP_1" "26f63ac0-8f13-4e5a-a239-b363808096e7"
                fi
            fi
        fi
    fi
fi

#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_utilities/orderless_linediff"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4066f355-772d-439b-aa39-b363808096e7" 
else
    if [ "$SB_RUBY_EXISTS_ON_PATH" != "f" ]; then
        echo ""
        echo "There's a flaw at some subpart of the ~/.bashrc. The "
        echo ""
        echo "    SB_RUBY_EXISTS_ON_PATH==\"$SB_RUBY_EXISTS_ON_PATH\""
        echo ""
        echo "but its valid domain is {\"t\", \"f\"}."
        echo "GUID=='f40620c1-17d5-4d04-a339-b363808096e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="b2a6b3f9-4214-4030-9539-b363808096e7"
#==========================================================================
