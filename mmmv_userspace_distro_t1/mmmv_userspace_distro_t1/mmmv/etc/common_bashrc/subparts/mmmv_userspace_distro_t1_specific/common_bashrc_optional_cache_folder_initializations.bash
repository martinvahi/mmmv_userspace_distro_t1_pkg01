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
    echo "GUID=='06d6d02d-5604-48e1-a4f5-0353808096e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------
SB_MAVEN_EXISTS_ON_PATH="f"
if [ "`which mvn 2> /dev/null`" != "" ]; then
    SB_MAVEN_EXISTS_ON_PATH="t"
else
    echo ""
    echo "The Java build system called Maven is missing from the PATH."
    echo "GUID=='42f017d4-0965-41f8-84f5-0353808096e7'"
    echo ""
fi

if [ "$SB_MAVEN_EXISTS_ON_PATH" == "t" ]; then
    #----------------------------------------------------------------------
    S_FP_MMMV_DOT_M2="/home/mmmv/.m2"
    S_FP_HOME_DOT_M2="$HOME/.m2"
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_MMMV_DOT_M2" "af839145-2d56-44ca-a6f5-0353808096e7"
    fi
    if [ "$M2" != "" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$M2" "da11fb44-23c6-4341-85f5-0353808096e7"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ -e "$S_FP_HOME_DOT_M2" ]; then
            # Just to check that it is a folder and not a file.
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_HOME_DOT_M2" "b323de7a-3260-4ea5-a2f5-0353808096e7"
        else # we try to copy it to create a seed version of it
            if [ -h "$S_FP_HOME_DOT_M2" ]; then
                # The existence check , the "if [ -e .....", fails  with broken symlinks.
                # The existence check , the "if [ -h .....", fails  with nonexisting symlinks.
                # The existence check , the "if [ -h .....", passes with broken symlinks.
                #
                # A test-script MIGHT be abailable at
                #     https://sourceforge.net/p/mmmv-notes/code/ci/master/tree/mmmv_notes/programming_language_tests/Bash_language_tests/lang_test_Bash_symlinks_and_hardlinks_t1.bash
                #
                #     archival copy: https://archive.is/wip/snoZQ
                #
                #     archive.org copy:
                #     https://web.archive.org/web/20200302185848/https://sourceforge.net/p/mmmv-notes/code/ci/master/tree/mmmv_notes/programming_language_tests/Bash_language_tests/lang_test_Bash_symlinks_and_hardlinks_t1.bash
                #
                echo ""
                echo "The $S_FP_HOME_DOT_M2 is a broken symlink." 
                echo "GUID=='3e2eee73-1aca-4930-b4f5-0353808096e7'"
                echo ""
            else 
                if [ -e "$S_FP_MMMV_DOT_M2" ]; then
                    if [ -d "$S_FP_MMMV_DOT_M2" ]; then
                        echo ""
                        echo "Attempting to initialize the Maven build system related ~/.m2 .. "
                        echo "GUID=='f081473f-2d5d-4781-82f5-0353808096e7'"
                            cp -f -R "$S_FP_MMMV_DOT_M2" "$S_FP_HOME_DOT_M2"
                            func_mmmv_wait_and_sync_t1
                        echo ".. done attempting to initialize the ~/.m2 ."
                        echo ""
                        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                            "$S_FP_HOME_DOT_M2" "1c9b342e-4a3a-41a1-b2f5-0353808096e7"
                    fi
                fi
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
        echo ""
        echo "The Maven related environment variable, "
        echo ""
        echo "    M2 != \"\" ==$M2"
        echo ""
        echo "is defined, but the Maven itself is not available on the PATH."
        echo "GUID=='9123318e-5f53-4810-b5f5-0353808096e7'"
        echo ""
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
# S_VERSION_OF_THIS_FILE="3f337cca-5b1a-449e-93f5-0353808096e7"
#==========================================================================
