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
    echo "GUID=='278c3ab0-840f-42b9-931e-83d1514127e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------
# With the exception of placing the viewnior first, 
# the image viewing programs are approximately ordered so
# that the lightweight programs are preferred to the heavyweight programs.
SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="t"
if [ "$SB_VIEWNIOR_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer="nice -n 5 viewnior --fullscreen "
    SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
else
    if [ "$SB_XLOADIMAGE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_image_viewer="nice -n 5 xloadimage "
        SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
    else
        if [ "$SB_XVIEW_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_image_viewer="nice -n 5 xview "
            SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
        else
            if [ "$SB_FEH_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_image_viewer="nice -n 5 feh "
                SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
            else
                if [ "$SB_MIRAGE_EXISTS_ON_PATH" == "t" ]; then
                    alias mmmv_image_viewer="nice -n 5 mirage "
                    SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
                fi
            fi
        fi
    fi
fi
#---------------
if [ "$SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER" == "t" ]; then
    if [ "$SB_GEEQIE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_image_viewer="nice -n 5 geeqie "
        SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
    else
        if [ "$SB_SXIV_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_image_viewer="nice -n 5 sxiv "
            SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
        else
            if [ "$SB_GPICVIEW_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_image_viewer="nice -n 5 gpicview "
                SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
            fi
        fi
    fi
fi
#---------------
if [ "$SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER" == "t" ]; then
    if [ "$SB_NOMACS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_image_viewer="nice -n 5 nomacs "
        SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
    else
        if [ "$SB_EOM_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_image_viewer="nice -n 5 eom "
            SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
        else
            if [ "$SB_MCOMIX_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_image_viewer="nice -n 5 mcomix "
                SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
            else
                if [ "$SB_EOG_EXISTS_ON_PATH" == "t" ]; then
                    alias mmmv_image_viewer="nice -n 5 eog "
                    SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
                fi
            fi
        fi
    fi
fi
#---------------
if [ "$SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER" == "t" ]; then
    if [ "$SB_RISTRETTO_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_image_viewer="nice -n 5 ristretto "
        SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
    else
        if [ "$SB_GWENVIEW_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_image_viewer="nice -n 5 gwenview "
            SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER="f"
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER" != "f" ]; then
        if [ "$SB_FAILED_TO_INIT_ALIAS_MMMV_IMAGE_VIEWER" == "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                echo ""
                echo "The alias mmmv_image_viewer was left undefined, because "
                echo "none of the followning image viewer programs were found on the PATH:"
                echo ""
                echo "    viewnior, xloadimage, xview, feh, mirage, geeqie, sxiv, "
                echo "    gpicview, nomacs, eom, mcomix, eog, ristretto, gwenview "
                echo ""
                echo "GUID=='9c5e4e27-dae0-488c-b11e-83d1514127e7'"
                echo ""
                # TODO: add some Java image viewer as the very last fallback option.
            fi
        else
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                echo ""
                echo "The code of this Bash script is flawed."
                echo "GUID=='dee06231-868a-4d1a-a31e-83d1514127e7'"
                echo ""
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1 # Just to be sure.
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="c1962502-a4f5-454f-8c1e-83d1514127e7"
#==========================================================================
