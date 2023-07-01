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
    echo "GUID=='741660f3-dae6-437e-9c69-41e1c01077e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------
SB_MAVEN_EXISTS_ON_PATH="f"
if [ "`which mvn 2> /dev/null`" != "" ]; then
    SB_MAVEN_EXISTS_ON_PATH="t"
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
        echo ""
        echo "The Java build system called Maven is missing from the PATH."
        echo "GUID=='ca954117-e8b3-4cfc-b369-41e1c01077e7'"
        echo ""
    fi
fi

if [ "$SB_MAVEN_EXISTS_ON_PATH" == "t" ]; then
    #----------------------------------------------------------------------
    S_FP_MMMV_DOT_M2="/home/mmmv/.m2"
    S_FP_HOME_DOT_M2="$HOME/.m2"
    #----------------------------------------------------------------------
    if [ "$M2" != "" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$M2" "37c8ec3d-73fb-4959-9369-41e1c01077e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ -e "$S_FP_HOME_DOT_M2" ]; then
            # Just to check that it is a folder and not a file.
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_HOME_DOT_M2" "edfcca26-c6ba-4b21-a169-41e1c01077e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        else # we try to copy it to create a seed version of it
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_MMMV_DOT_M2" "f073b319-c969-4e75-9169-41e1c01077e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                    echo ""
                    echo ""
                    echo -e "Attempting to initialize the\e[33m Maven build system\e[39m related "
                    echo -e "\e[33m    $S_FP_HOME_DOT_M2 \e[39m"
                    echo "by copying files there .."
                fi
                    nice -n 2 cp -f -R "$S_FP_MMMV_DOT_M2" "$S_FP_HOME_DOT_M2"
                    S_TMP_0="$?"
                    func_mmmv_wait_and_sync_t1
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                    echo ".. done copying files."
                    if [ "$S_TMP_0" != 0 ]; then
                        echo -e \e[31m"The cp exited with an error code of $S_TMP_0 \e[39m"
                    fi
                    echo "GUID=='2286f392-eed1-4c6a-b469-41e1c01077e7'"
                    echo ""
                fi
                func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                    "$S_FP_HOME_DOT_M2" "4fea034e-e766-4ff3-b369-41e1c01077e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$MAVEN_OPTS" == "" ]; then
        #export MAVEN_OPTS="-Xmx1G" # The 1GiB is required for
                                    # building some applications.
        export MAVEN_OPTS="-Xmx400M"
    fi
    #----------------------------------------------------------------------
else # Maven not on PATH
    if [ "$M2" != "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
            echo ""
            echo "The Maven related environment variable, "
            echo ""
            echo "    M2 != \"\" ==$M2"
            echo ""
            echo "is defined, but the Maven itself is not available on the PATH."
            echo "GUID=='38f84684-2754-4495-a569-41e1c01077e7'"
            echo ""
        fi
    fi
fi

#--------------------------------------------------------------------------
# It seems that the Apache Maven lacks proper console parameters
# for using the Apache Maven with proxy servers. According to the 
#
#     https://maven.apache.org/settings.html#Proxies 
#
# the 
#
#     ~/.m2/settings.xml 
#
# is supposed to contain information about the use of proxy servers.
# 
#     -----untested--citation--start---------------------------------------
#     <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
#       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
#       xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
#                           https://maven.apache.org/xsd/settings-1.0.0.xsd">
#       <proxies>
#         <proxy>
#           <id>myproxy</id>
#           <active>true</active>
#           <protocol>http</protocol>
#           <host>proxy.somewhere.com</host>
#           <port>8080</port>
#           <username>proxyuser</username>
#           <password>somepassword</password>
#           <nonProxyHosts>*.google.com|ibiblio.org</nonProxyHosts>
#         </proxy>
#       </proxies>
#     </settings>
#     -----untested--citation--end-----------------------------------------
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="03415348-8ad3-4c7e-8569-41e1c01077e7"
#==========================================================================
