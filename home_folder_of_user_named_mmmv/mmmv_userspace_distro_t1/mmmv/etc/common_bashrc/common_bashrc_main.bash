#!/usr/bin/env bash 
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
#
# Users that use the mmmv_userspace_distro_t1 are expected to 
# have the following line in an uncommented form at their ~/.bashrc
#
#     source /home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/common_bashrc_main.bash
#
# Supposedly 
#
#     https://www.shell-tips.com/bash/comments/
#     https://web.archive.org/web/20210823063955/https://www.shell-tips.com/bash/comments/
#     2. archival copy: https://archive.is/xelDR
#
# the Bash command line 
#
#     shopt -s interactive_comments
#
# might help to cope with some "#" related Bash errors.
#
#--------------------------------------------------------------------------
# The 
export MMMV_USERSPACE_DISTRO_T1_VERSION="d4930ef2-8226-4ab8-a8e4-e241d041a7e7"
# does NOT duplicate the 
# S_VERSION_OF_THIS_FILE="5ff12215-9ce5-4744-a214-e241d041a7e7" 
# because S_VERSION_OF_THIS_FILE is a "mmmv-standard" way to 
# indicate source file versions and the S_VERSION_OF_THIS_FILE 
# is meant to be available for string processing scripts.
#--------------------------------------------------------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FN_SCRIPTFILE="`basename ${BASH_SOURCE[0]}`"
MMMV_FP_COMMON_BASHRC_MAIN="$S_FP_DIR/$S_FN_SCRIPTFILE"
S_FP_ORIG="`pwd`"
S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------
# Code for copy-pasting:
#--------------------
#--------------------------------------------------------------------------
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "" ]; then
    # The  
    export SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT="t" # must be set to "f"
    #export SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT="f"
    # if the machine is accessible only over SSH, because 
    # SSH clients may interpret any stdout output during ~/.bashrc
    # execution as an error condition and automatically disconnect, id est
    # any stdout output during ~/.bashrc execution may cause a failure to
    # start a session. A workaround is to use some non-bash shell during
    # SSH login and then execute bash manually.
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo ""
            echo "    SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT==\"$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT\""
            echo ""
            echo "but the valid values are: \"\", \"t\", \"f\"."
            echo "default: \"\" -> \"t\""
            echo "GUID=='4ba98f62-2180-4126-9d34-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    printf "Running the ~/.bashrc sub-part common_bashrc_main.bash .. " # might take about 30s.
fi
#--------------------------------------------------------------------------
if [ "$MMMV_SB_DEBUG" == "" ]; then
    MMMV_SB_DEBUG="t" # the default
fi
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    if [ "$MMMV_SB_DEBUG" != "t" ]; then
        if [ "$MMMV_SB_DEBUG" != "f" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo ""
            echo "    MMMV_SB_DEBUG==\"$MMMV_SB_DEBUG\""
            echo ""
            echo "but the valid values are: \"\", \"t\", \"f\"."
            echo "default: \"\" -> \"t\""
            echo "GUID=='361aa871-186b-4d70-bf64-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "" ]; then
    MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS="t" # the default
fi
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" != "t" ]; then
        if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" != "f" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo ""
            echo "    MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS==\"$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS\""
            echo ""
            echo "but the valid values are: \"\", \"t\", \"f\"."
            echo "default: \"\" -> \"t\""
            echo "GUID=='c4105aff-f589-4400-a274-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
SB_OPERATINGSYSTEM_BSD="f"                    # domain: {"f","t"}
SB_OPERATINGSYSTEM_BSD_FREEBSD="f"            # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX="f"                  # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_WSL="f"              # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_ANDROID="f"          # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX="f"   # domain: {"f","t"}
#------------------------------------------
S_UNAME_A="`uname -a `"
S_TMP_0="`echo \"$S_UNAME_A\" | grep -i Linux`"
if [ "$S_TMP_0" != "" ]; then
    SB_OPERATINGSYSTEM_LINUX="t"
    S_TMP_1="`echo \"$S_UNAME_A\" | grep -i -E '(Microsoft|Windows)' `"
    if [ "$S_TMP_1" != "" ]; then
        SB_OPERATINGSYSTEM_LINUX_WSL="t"
    else
        S_TMP_0="`echo \"$S_UNAME_A\" | grep -i Android `"
        if [ "$S_TMP_0" != "" ]; then
            #--------------------
            SB_OPERATINGSYSTEM_LINUX_ANDROID="t"
            #--------------------
            # https://www.reddit.com/r/termux/comments/voultk/safe_way_to_detect_if_inside_termux/
            # archival copy: https://archive.ph/Twy3q
            if [ "$TERMUX_VERSION" != "" ]; then
                SB_PKG_EXISTS_ON_PATH="f"
                if [ "`which pkg 2> /dev/null`" != "" ]; then
                    SB_PKG_EXISTS_ON_PATH="t"
                    S_TMP_1="`echo \"$PREFIX\" | grep -i 'termux' `"
                    if [ "$S_TMP_1" != "" ]; then
                        SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX="t" # one hopes
                    fi
                fi
            fi
            #--------------------
        fi
    fi
else
    #----------------------------------------------------------------------
    S_TMP_0="`echo \"$S_UNAME_A\" | grep -i BSD `"
    if [ "$S_TMP_0" != "" ]; then
        SB_OPERATINGSYSTEM_BSD="t"
        S_TMP_1="`echo \"$S_UNAME_A\" | grep -i 'FreeBSD' `"
        if [ "$S_TMP_1" != "" ]; then
            SB_OPERATINGSYSTEM_BSD_FREEBSD="t"
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe operating system is neither Linux, nor BSD. \e[39m"
            echo "The mmmv aliases are probably not tested "
            echo "with the current operating system."
            echo "GUID=='65849da6-b386-42fe-8744-e241d041a7e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------

func_mmmv_include_bashfile_if_possible_t2(){ 
    local S_FP_BASHFILE="$1" # Full path to the file   
    local S_GUID_CANDIDATE="$2" 
    local SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="$3" # domain: {"","t","f"} 
                                                          # default: "" -> "f"
    #----------------------------------------------------------------------
    # ~/.bashrc must not call the "exit" command.
    #----------------------------------------------------------------------
    if [ "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL" == "" ]; then
        SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # the default value
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            if [ "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL" != "t" ]; then
                if [ "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL" != "f" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL==$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
                    echo ""
                    echo "but the valid values are: \"\", \"t\", \"f\"."
                    echo "Using the default value of \"f\"."
                    if [ "$S_GUID_CANDIDATE" != "" ]; then
                        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    fi 
                    echo "GUID=='9525fedd-4b5e-4356-a044-e241d041a7e7'"
                    echo ""
                    SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # the default value
                fi
            fi
        fi
    fi
    #----------------------------------------------------------------------
    local SB_INCLUSION_POSSIBLE="t"
    if [ "$S_FP_BASHFILE" == "" ]; then
        SB_INCLUSION_POSSIBLE="f"
        #-----------------------------
        # The SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL if-block
        # is not used here, because the current situation
        # indicates a flaw at the code that calls this function, 
        # not a situation, where the file is allowed to be absent.
        #-----------------------------
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe S_FP_BASHFILE had a value of an empty string.\e[39m"
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='c460b685-bb75-4411-9343-e241d041a7e7'"
            echo ""
        fi 
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ ! -e "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                if [ "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL" == "f" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_BASHFILE"
                    echo ""
                    echo "does not exist or it is a broken symlink."
                    if [ "$S_GUID_CANDIDATE" != "" ]; then
                        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    fi 
                    echo "GUID=='338a544a-3c99-4eb3-8133-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ -d "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            #-----------------------------
            # The SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL if-block
            # is not used here, because the current situation
            # differs from the situation, where the file is allowed to be absent.
            #-----------------------------
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_BASHFILE"
                echo ""
                echo "references a folder, but it must reference a file."
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi 
                echo "GUID=='7db3c0c1-ea10-42d4-a823-e241d041a7e7'"
                echo ""
            fi 
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        source "$S_FP_BASHFILE"
        #---------dependency--elimination--inlining--start----
        # func_mmmv_wait_and_sync_t1(){
              wait # for background processes started by this Bash script to exit/finish
              sync # network drives, USB-sticks, etc.
              wait # for sync
        # } # func_mmmv_wait_and_sync_t1
        #---------dependency--elimination--inlining--end------
        S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # to restore its value
    else
        if [ "$SB_INCLUSION_POSSIBLE" != "f" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe implementation of this function is flawed.\e[39m"
                echo "SB_INCLUSION_POSSIBLE==$SB_INCLUSION_POSSIBLE"
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi 
                echo "GUID=='5bddf561-42fe-4769-a023-e241d041a7e7'"
                echo ""
            fi 
        fi
    fi
} # func_mmmv_include_bashfile_if_possible_t2

func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1(){
    local S_FP_DECLARATION_BASH="$1"
    #--------
    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1="mode_ok_to_load"
        func_mmmv_include_bashfile_if_possible_t2 "$S_FP_DECLARATION_BASH" \
            "21f67345-66a0-49e2-9924-e241d041a7e7"
    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1="mode_loading_complete"
} # func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1
#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1(){
    local S_CONSOLE_PROGRAM_NAME="$1" 
    local S_GUID_CANDIDATE="$2" 
    #--------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe value of the S_GUID_CANDIDATE is an empty string\e[39m,"
            echo "but it is expected to be a GUID."
            echo "GUID=='22980d32-83ed-4f00-aa23-e241d041a7e7'"
            echo ""
        fi 
    fi 
    #--------------------
    echo ""
    if [ "$S_CONSOLE_PROGRAM_NAME" != "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo -e "The console program \"\e[31m$S_CONSOLE_PROGRAM_NAME\e[39m\" is missing form PATH."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo "GUID=='64a28f1e-d1d8-4382-9d43-e241d041a7e7'"
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo -e "\e[31mThe value of the S_CONSOLE_PROGRAM_NAME is an empty string\e[39m,"
            echo "but it is expected to be a console program name, which "
            echo "can not be an empty string."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo "GUID=='54eac7d2-399a-4a2d-8023-e241d041a7e7'"
        fi
    fi 
    echo "" ; wait 
    #--------------------
} # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1
#--------------------------------------------------------------------------

# Declares an alias like 
# 
#     my_awesome_alias="cd /some/useful/folder "
#
# on a condition that the  /some/useful/folder 
# exists and is a folder or a symlink to a folder.
# If the folder does not exist, then it 
# does NOT create the folder.
func_mmmv_userspace_distro_t1_declare_alias_cd_t1(){
    local S_ALIAS_NAME="$1" 
    local S_FP_FOLDER_PATH_CANDIDATE="$2" # Full path to the folder.
    local S_GUID_CANDIDATE="$3" 
    local SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="$4" # domain: {"","t","f"}
                                                   # default: "" -> "t"
                                                   # The default is "t" 
                                                   # for backwards
                                                   # compatibility.
    #----------------------------------------------------------------------
    # ~/.bashrc must not call the "exit" command.
    #----------------------------------------------------------------------
    local SB_OK2ATTEMPT="t" # domain: {"t","f"}
    local S_TMP_0=""
    local SB_ERROR="f" # tends to duplicate the SB_OK2ATTEMPT, but more specific
    local SB_VERIFICATION_FAILED_LOCAL="f"
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" == "" ]; then
            #--------------------------------------------------------------
            SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="t"
            # That's not an error condition, because
            # the SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING is, 
            # as its name suggets, an optional parameter.
            #--------------------------------------------------------------
        else
            #--------------------------------------------------------------
            # The 
            #
            #     func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
            #         "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" \
            #         "SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" \
            #         "435d6c80-415a-4868-9f34-e241d041a7e7"
            # 
            # can not be used here, because its error message 
            # claims that the domain is only {"t","f"}, but
            # in this case the "" is also part of the domain. 
            # 
            if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" != "t" ]; then
                if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" != "f" ]; then
                    if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
                        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                            echo ""
                            echo -e "\e[31mSB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING==\"$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING\"\e[39m"
                            echo "but its domain is: {\"\",\"t\",\"f\"}"
                            echo "GUID=='a1ff9ccc-ab78-43f8-8733-e241d041a7e7'"
                            echo ""
                        fi
                        SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="t"
                        SB_VERIFICATION_FAILED_LOCAL="t"
                        SB_OK2ATTEMPT="f"
                    fi
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$S_GUID_CANDIDATE" == "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe value of the S_GUID_CANDIDATE is an empty string\e[39m,"
                echo "but it is expected to be a GUID."
                echo "Leaving at least one alias undefined."
                echo "GUID=='e296e57e-61da-4f46-8442-e241d041a7e7'"
                echo ""
            fi
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$S_ALIAS_NAME" == "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe value of the S_ALIAS_NAME is an empty string\e[39m,"
                echo "but it is expected to be an alias name."
                echo "Leaving at least one alias undefined."
                echo "GUID=='415b0f0a-0232-4143-b542-e241d041a7e7'"
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                echo ""
            fi
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$S_FP_FOLDER_PATH_CANDIDATE" == "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe value of the S_FP_FOLDER_PATH_CANDIDATE is an empty string\e[39m,"
                echo "but it is expected to be a full path to a folder."
                echo "Leaving at least one alias undefined."
                echo "GUID=='11536395-927d-4441-9492-e241d041a7e7'"
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                echo ""
            fi
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi 
    fi #-------------------------------------------------------------------
    #::::::::start:::of:::the:::core:::code:::of:::this:::function:::::::::
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" == "t" ]; then
            #--------------------------------------------------------------
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_FOLDER_PATH_CANDIDATE" \
                "33b96502-66ca-45b4-9c33-e241d041a7e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo "Leaving at least one alias undefined."
                    echo "GUID=='fdd03091-47a4-4e8d-a032-e241d041a7e7'"
                    if [ "$S_GUID_CANDIDATE" != "" ]; then
                        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    fi
                    echo ""
                fi
                SB_VERIFICATION_FAILED_LOCAL="t"
                SB_OK2ATTEMPT="f"
            fi
            #--------------------------------------------------------------
        else
            #--------------------------------------------------------------
            if [ ! -e "$S_FP_FOLDER_PATH_CANDIDATE" ]; then
                SB_VERIFICATION_FAILED_LOCAL="t"
                SB_OK2ATTEMPT="f"
            else
                if [ ! -d "$S_FP_FOLDER_PATH_CANDIDATE" ]; then
                    SB_VERIFICATION_FAILED_LOCAL="t"
                    SB_OK2ATTEMPT="f"
                # else
                #     # It might be a folder or a symlink to a folder.
                #     # Both, a folder and a symlink to a folder, are OK here.
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        SB_ERROR="f"
        if [ "`cd $S_FP_FOLDER_PATH_CANDIDATE; pwd`" != "$S_FP_FOLDER_PATH_CANDIDATE" ]; then
            SB_ERROR="t"
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi
        if [ "$SB_ERROR" == "t" ]; then
            if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" == "t" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The folder "
                    echo ""
                    echo "    $S_FP_FOLDER_PATH_CANDIDATE"
                    echo ""
                    echo "exists, but either it is not accessible to the current user"
                    echo "or the pwd-value in it differs from the path given to "
                    echo "this Bash function."
                    echo "Leaving at least one alias undefined."
                    echo "GUID=='52f93a83-1303-453c-9c82-e241d041a7e7'"
                    if [ "$S_GUID_CANDIDATE" != "" ]; then
                        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    fi
                    echo ""
                fi
            fi 
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        S_TMP_0="alias $S_ALIAS_NAME=\"cd $S_FP_FOLDER_PATH_CANDIDATE \""
        eval ${S_TMP_0}
    fi #-------------------------------------------------------------------
    func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
        "$SB_OK2ATTEMPT" "SB_OK2ATTEMPT" \
        "414357a4-4849-4125-8d13-e241d041a7e7"
    #----------------------------------------------------------------------
    func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
        "$SB_VERIFICATION_FAILED_LOCAL" "SB_VERIFICATION_FAILED_LOCAL" \
        "558c7d82-46f5-40c3-b113-e241d041a7e7"
    if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
        SB_VERIFICATION_FAILED_LOCAL="t"
    fi
    SB_VERIFICATION_FAILED="$SB_VERIFICATION_FAILED_LOCAL"
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_declare_alias_cd_t1
#
# The tests:
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_01" \
#    "/root" \
#    "4dfea9d3-9c2f-4ce4-9033-e241d041a7e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_02" \
#    "/tmp/olematu" \
#    "c3e42a51-58f1-41e5-9e43-e241d041a7e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_03" \
#    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash" \
#    "3f138061-c984-4fe1-ac13-e241d041a7e7"
#
#--------------------------------------------------------------------------
S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_func_core_t3"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "b96f5ea0-4a2a-4357-a513-e241d041a7e7"
func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "grep"
#--------------------------------------------------------------------------
S_WHOAMI="`whoami`"
#--------------------------------------------------------------------------
# Please choose the editor of Your choice: 
    #S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME="mcedit" # for novice
    #S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME="joe" # legacy
    S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME="vim" # for more experienced text editor users

S_TMP_0="`which $S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME 2> /dev/null`"
if [ "$S_TMP_0" == "" ]; then
    func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 \
        "$S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME"
    if [ "$EDITOR" == "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe environment variable EDITOR has not been set\e[39m"
            echo "and its initialization to \"$S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME\" "
            echo "failed because the \"$S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME\""
            echo "is missing from PATH."
            echo "GUID=='f9c31bd2-bfbb-4c33-b552-e241d041a7e7'"
            echo ""
        fi
    fi
else
    export EDITOR="$S_TMP_0"
fi


if [ "$VISUAL" == "" ]; then
    # According to the
    #
    #     https://unix.stackexchange.com/questions/4859/visual-vs-editor-what-s-the-difference
    #     archival copies:
    #         https://archive.vn/gxCus
    #         https://web.archive.org/web/20200829113827/https://unix.stackexchange.com/questions/4859/visual-vs-editor-what-s-the-difference
    #
    # the idea behind the environment variable 
    export VISUAL="$EDITOR"
    # is that back in the teletype era text editors that
    # could move the cursor were difficult to use and 
    # supposedly scripts had a convention that if the
    # text editor that was determined by the value of the VISUAL
    # could not be used, then the scripts used the text editor that was
    # determined by the environment variable EDITOR.
    # In 2020 the difference might be that the VISUAL
    # references a graphical text editor and the EDITOR 
    # references a console text editor. It's OK to 
    # make them both to reference a console text editor.
fi
#--------------------------------------------------------------------------
# https://stackoverflow.com/questions/55673886/what-is-the-difference-between-c-utf-8-and-en-us-utf-8-locales/
# archival copy: https://archive.vn/ivNHa
# Summary: 
#     The "C" in the "C.UTF-8" stands for "computer" and supposedly the 
#     "C.UTF-8" switches in a more computer-readable text output mode than 
#     the "en_US.UTF-8".
export LC_TIME="C.UTF-8"
export LC_ALL="C.UTF-8" # useful on FreeBSD for making the tar work
export LANG="C.UTF-8"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        SB_UNICODE_START_EXISTS_ON_PATH="f"
        if [ "`which unicode_start 2> /dev/null`" != "" ]; then
            SB_UNICODE_START_EXISTS_ON_PATH="t"
            if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                # https://linux.com/news/using-unicode-linux/
                # The opposite of the
                unicode_start 2>/dev/null
                # is the 
                # unicode_stop 2>/dev/null
            fi
        else
            func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "unicode_start"
        fi
    fi
fi
#--------------------------------------------------------------------------
# For some reason the "-mtune=native" fails on 
# Raspberry Pi 3, Raspbian. 
#     https://bugs.ruby-lang.org/issues/13509
#     (archival copy: https://archive.is/llUWb ) 

export MMMV_CFLAGS_COMMON=" -ftree-vectorize -O3 "

# Includes binary code for both, the current and for the older CPUs:
    #MMMV_CFLAGS_TEMPLATE=" -mtune=native $MMMV_CFLAGS_COMMON "  

# No backwards compatibility support, smaller binaries, current CPU only:
    MMMV_CFLAGS_TEMPLATE=" -march=native -mtune=native $MMMV_CFLAGS_COMMON "  

if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    # For some reason the " -march=native " triggers an error 
    # on Termux, if the classical configure script is run.
    # The error message is something along the lines that 
    # a compiler does not work.
    MMMV_CFLAGS_TEMPLATE=" -mtune=native $MMMV_CFLAGS_COMMON "  
fi
export CFLAGS="$MMMV_CFLAGS_TEMPLATE"
export CXXFLAGS="$MMMV_CFLAGS_TEMPLATE"
#--------------------------------------------------------------------------
# https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Modules.html
# archival copy: https://archive.vn/JFNH3
export MMMV_CXXFLAGS_EXTRA_GCC=" -std=c++20 -fmodules-ts "

# https://clang.llvm.org/docs/Modules.html#problems-modules-do-not-solve
# archival copy: https://archive.vn/QYqMU
export MMMV_CXXFLAGS_EXTRA_LLVM=" -fmodules -fbuiltin-module-map -fmodules-decluse -fmodules-search-all "

#--------------------------------------------------------------------------
# The clang and clang++ seem to introduce 
# linking problems on Raspberry Pi 3, Raspbian.
# A general rule is that binaries produced by
# different C/C++ compilers can not be linked together.
if [ "$CC" == "" ]; then
    export CC="gcc"
    # export CC="clang"
fi
if [ "$CXX" == "" ]; then
    export CXX="g++"
    # export CXX="clang++"
fi


#--------------------------------------------------------------------------
export MMMV_PATH_00="$PATH"
Z_PATH="$PATH"
if [ -e "/usr/sbin" ]; then
    # The 
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "/usr/sbin" "488d6b43-c9e6-4524-8423-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    # is for displaying an error message, if the "/usr/sbin" is not a folder.
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="/usr/sbin:$Z_PATH"
    else
        if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31m The function \e[39m"
                echo -e "\e[31m func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1(...) \e[39m"
                echo -e "\e[31m is flawed. \e[39m"
                echo "GUID=='e45b79bc-7dca-4ff2-b142-e241d041a7e7'"
                echo ""
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED="$MMMV_USERSPACE_DISTRO_T1_HOME"
# Usually the
#export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
# would do, but there are use cases, where user "mmmv" is not used 
# and for that reason the path is derived:
S_TMP_0="`cd $S_FP_DIR/../../../ ; pwd`"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$S_TMP_0" "5a48a674-b276-451e-a313-e241d041a7e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo -e "\e[31mFailed to derive a value for the MMMV_USERSPACE_DISTRO_T1_HOME .\e[39m"
        echo "Assigning "
        export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_HOME:=$MMMV_USERSPACE_DISTRO_T1_HOME"
        echo ""
        echo "GUID=='339e891f-d152-45bb-9b32-e241d041a7e7'"
        echo ""
    fi
else
    if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo ""
            echo "     SB_VERIFICATION_FAILED==\"$SB_VERIFICATION_FAILED\" "
            echo ""
            echo "GUID=='bb18851f-e960-4133-b222-e241d041a7e7'"
            echo ""
        fi
    fi
    export MMMV_USERSPACE_DISTRO_T1_HOME="$S_TMP_0"
    S_TMP_1="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin"
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_TMP_1" "462e5543-20a9-4b96-8552-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="$S_TMP_1:$Z_PATH"
    fi
fi
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED" != "" ]; then
    if [ "$MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED" != "$MMMV_USERSPACE_DISTRO_T1_HOME" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo ""
            echo -e "\e[31mUserdeclared version\e[39m of the MMMV_USERSPACE_DISTRO_T1_HOME "
            echo ""
            echo "    $MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED"
            echo ""
            echo -e "and the\e[31m derived version\e[39m of the MMMV_USERSPACE_DISTRO_T1_HOME"
            echo ""
            echo "    $MMMV_USERSPACE_DISTRO_T1_HOME"
            echo ""
            echo -e "\e[31mdiffer\e[39m. Using the derived version."
            echo "GUID=='73358797-ea7f-485c-a431-e241d041a7e7'"
            echo ""
        fi
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED" \
            "162279a1-b737-4d1d-8112-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_USER_TMP="/tmp"
S_TMP_1="$HOME/tmp_"
if [ -e "$S_TMP_1" ]; then
    if [ -d "$S_TMP_1" ]; then
        MMMV_USERSPACE_DISTRO_T1_USER_TMP="$S_TMP_1"
    fi
fi
if [ "$MMMV_USERSPACE_DISTRO_T1_USER_TMP" == "/tmp" ]; then
    S_TMP_1="$HOME/tmp"
    if [ -e "$S_TMP_1" ]; then
        if [ -d "$S_TMP_1" ]; then
            MMMV_USERSPACE_DISTRO_T1_USER_TMP="$S_TMP_1"
        fi
    fi
fi
if [ "$MMMV_USERSPACE_DISTRO_T1_USER_TMP" == "/tmp" ]; then
    if [ "$SB_CONSOLE_OUTPUT_IS_ALLOWED" == "t" ]; then
        # Probably the SB_CONSOLE_OUTPUT_IS_ALLOWED=="", but
        # it might have been set to "t" at the ~/.bashrc , if
        # the code at the ~/.bashrc has determined that 
        # the session is a local session, not an SSH session.
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo ""
            echo "You may want to use the alias "
            echo -e "\e[33m    mmmv_admin_create_home_tmp_t1 \e[39m"
            echo "for creating a symlink "
            S_TMP_0="_tmp_"
            echo "    /home/$S_WHOAMI/tmp_  -->  /tmp/$S_WHOAMI$S_TMP_0 "
            echo "GUID=='35cd8641-ae0f-45c5-9241-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
MANPATH="$MANPATH"
MMMV_C_INCLUDE_PATH=""
MMMV_CPLUS_INCLUDE_PATH=""
#--------------------------------------------------------------------------
# The newline trick 
S_NEWLINE=$'\n'
# originates from the answer of Gordon Davisson:
# https://stackoverflow.com/questions/17821277/how-to-separate-multiple-commands-passed-to-eval-in-bash
# archival copy: https://archive.fo/7XI3a 
#--------------------------------------------------------------------------
SB_FIND_EXISTS_ON_PATH="f"
if [ "`which find 2> /dev/null`" != "" ]; then
    SB_FIND_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "find" "22afc193-c104-4c32-8b52-e241d041a7e7"
fi

SB_CAT_EXISTS_ON_PATH="f"
if [ "`which cat 2> /dev/null`" != "" ]; then
    SB_CAT_EXISTS_ON_PATH="t"
fi

SB_WC_EXISTS_ON_PATH="f"
if [ "`which wc 2> /dev/null`" != "" ]; then
    SB_WC_EXISTS_ON_PATH="t"
fi

SB_GREP_EXISTS_ON_PATH="f"
if [ "`which grep 2> /dev/null`" != "" ]; then
    SB_GREP_EXISTS_ON_PATH="t"
    alias grep='grep --color=auto '
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "grep" "821039b8-62c9-410d-a0a2-e241d041a7e7"
fi

SB_HTOP_EXISTS_ON_PATH="f"
if [ "`which htop 2> /dev/null`" != "" ]; then
    SB_HTOP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "htop" "71f32d35-b72c-4877-8a42-e241d041a7e7"
fi
#----------------------------------------
SB_NCDU_EXISTS_ON_PATH="f"
if [ "`which ncdu 2> /dev/null`" != "" ]; then
    SB_NCDU_EXISTS_ON_PATH="t"
    #----------------------------------------
    # I(Martin.Vahi@softf1.com) first learned about the 
    # ncdu (NCurses Disk Usage),
    #     https://dev.yorhel.nl/ncdu
    # on 2023_10_14 from
    #     https://askubuntu.com/questions/1224/how-do-i-determine-the-total-size-of-a-directory-folder-from-the-command-line
    #     archival copy: https://archive.ph/TBQVm
    #----------------------------------------
    # The "nice -n 2 " at the following 2 lines is to mitigate filesystem scanning related hangup.
    #alias ncdu="nice -n 2 ncdu --disable-delete --disable-shell " # for safety
    alias ncdu="nice -n 2 ncdu --disable-delete " # for safety, while 
                                                  # keeping the original default 
                                                  # settings as much as possible.
                                                  # The "--disable-delete" option
                                                  # does not exist at some older
                                                  # versions of ncdu.

    # The "--slow-ui-updates" at the 
    S_TMP_0="nice -n 2 ncdu --disable-delete --disable-shell --no-si --apparent-size --show-hidden --show-itemcount --sort=apparent-size-desc --color=dark --slow-ui-updates "
    # is to avoid slowing down the scanning during
    # scans, where there are a lot of files and/or folders to scan.
    alias mmmv_run_ncdu="$S_TMP_0 "
    alias mmmv_ncdu="$S_TMP_0 "
    #----------------------------------------
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "ncdu" "489028a1-ce4e-43b8-a732-e241d041a7e7"
fi
#----------------------------------------
if [ "$SB_PKG_EXISTS_ON_PATH" == "" ]; then
    SB_PKG_EXISTS_ON_PATH="f"
    if [ "`which pkg 2> /dev/null`" != "" ]; then
        SB_PKG_EXISTS_ON_PATH="t"
    fi
# else
#     # The SB_PKG_EXISTS_ON_PATH has been 
#     # assigned earlier in this Bash file.
fi

SB_TEST_EXISTS_ON_PATH="f"
if [ "`which test 2> /dev/null`" != "" ]; then
    SB_TEST_EXISTS_ON_PATH="t"
    # The next if-clause has been copy-pasted from some
    # Linux distribution standard /etc/bash.bashrc and then slightly edited.
    if [ -x /usr/bin/dircolors ]; then
        # color support of ls and also add handy aliases
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'
    fi
fi

SB_WGET_EXISTS_ON_PATH="f"
if [ "`which wget 2> /dev/null`" != "" ]; then
    SB_WGET_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "wget" "575b7774-f4fb-4d21-b122-e241d041a7e7"
fi

SB_CURL_EXISTS_ON_PATH="f"
if [ "`which curl 2> /dev/null`" != "" ]; then
    SB_CURL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "curl" "85c55d1f-435b-416d-9b72-e241d041a7e7"
fi

# aria2 is often times available from distribution package collection.
# https://github.com/aria2
SB_ARIA2C_EXISTS_ON_PATH="f"
if [ "`which aria2c 2> /dev/null`" != "" ]; then
    SB_ARIA2C_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "aria2c" "2ceb4a23-10dc-434a-b112-e241d041a7e7"
fi

SB_READLINK_EXISTS_ON_PATH="f"
if [ "`which readlink 2> /dev/null`" != "" ]; then
    SB_READLINK_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "readlink" "47bf9f21-c7fc-47e6-9d21-e241d041a7e7"
fi

SB_XARGS_EXISTS_ON_PATH="f"
if [ "`which xargs 2> /dev/null`" != "" ]; then
    SB_XARGS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "xargs" "c116eccf-ac34-4b00-9351-e241d041a7e7"
fi

if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_XPROP_EXISTS_ON_PATH="f"
    if [ "`which xprop 2> /dev/null`" != "" ]; then
        SB_XPROP_EXISTS_ON_PATH="t"
    fi
    
    SB_XAUTH_EXISTS_ON_PATH="f"
    if [ "`which xauth 2> /dev/null`" != "" ]; then
        SB_XAUTH_EXISTS_ON_PATH="t"
    fi
    
    SB_HDDTEMP_EXISTS_ON_PATH="f"
    if [ "`which hddtemp 2> /dev/null`" != "" ]; then
        SB_HDDTEMP_EXISTS_ON_PATH="t"
    fi
fi

SB_DF_EXISTS_ON_PATH="f"
if [ "`which df 2> /dev/null`" != "" ]; then
    SB_DF_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "df" "3428afe2-319f-42f3-a5cd-e241d041a7e7"
fi

SB_SYSCTL_EXISTS_ON_PATH="f"
if [ "`which sysctl 2> /dev/null`" != "" ]; then
    SB_SYSCTL_EXISTS_ON_PATH="t"
fi

if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    SB_XMLLINT_EXISTS_ON_PATH="f"
    if [ "`which xmllint 2> /dev/null`" != "" ]; then
        SB_XMLLINT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
fi

SB_GPG_EXISTS_ON_PATH="f"
if [ "`which gpg 2> /dev/null`" != "" ]; then
    SB_GPG_EXISTS_ON_PATH="t"
fi

SB_NETSTAT_EXISTS_ON_PATH="f"
if [ "`which netstat 2> /dev/null`" != "" ]; then
    SB_NETSTAT_EXISTS_ON_PATH="t"
fi

SB_FFMPEG_EXISTS_ON_PATH="f"
if [ "`which ffmpeg 2> /dev/null`" != "" ]; then
    SB_FFMPEG_EXISTS_ON_PATH="t"
fi

SB_TORSOCKS_EXISTS_ON_PATH="f"
if [ "`which torsocks 2> /dev/null`" != "" ]; then
    SB_TORSOCKS_EXISTS_ON_PATH="t"
fi

#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::image::viewers::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_XLOADIMAGE_EXISTS_ON_PATH="f"
    if [ "`which xloadimage 2> /dev/null`" != "" ]; then
        SB_XLOADIMAGE_EXISTS_ON_PATH="t"
    fi
    
    SB_XVIEW_EXISTS_ON_PATH="f"
    if [ "`which xview 2> /dev/null`" != "" ]; then
        SB_XVIEW_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xview" "93c9fdc6-661e-4cbb-8a2d-e241d041a7e7"
    fi
    
    SB_XVIEWER_EXISTS_ON_PATH="f"
    if [ "`which xviewer 2> /dev/null`" != "" ]; then
        SB_XVIEWER_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xviewer" "552b1c52-eb41-49ae-a64c-e241d041a7e7"
    fi
    
    SB_FEH_EXISTS_ON_PATH="f"
    if [ "`which feh 2> /dev/null`" != "" ]; then
        SB_FEH_EXISTS_ON_PATH="t"
    fi
    
    SB_MIRAGE_EXISTS_ON_PATH="f"
    if [ "`which mirage 2> /dev/null`" != "" ]; then
        SB_MIRAGE_EXISTS_ON_PATH="t"
    fi
    
    SB_VIEWNIOR_EXISTS_ON_PATH="f"
    if [ "`which viewnior 2> /dev/null`" != "" ]; then
        SB_VIEWNIOR_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "viewnior" "33e477d1-73a4-416a-8b5c-e241d041a7e7"
        fi
    fi
    
    SB_GEEQIE_EXISTS_ON_PATH="f"
    if [ "`which geeqie 2> /dev/null`" != "" ]; then
        SB_GEEQIE_EXISTS_ON_PATH="t"
    fi
    
    SB_EOG_EXISTS_ON_PATH="f"
    if [ "`which eog 2> /dev/null`" != "" ]; then
        SB_EOG_EXISTS_ON_PATH="t"
    fi
    
    SB_GWENVIEW_EXISTS_ON_PATH="f"
    if [ "`which gwenview 2> /dev/null`" != "" ]; then
        SB_GWENVIEW_EXISTS_ON_PATH="t"
    fi
    
    SB_NOMACS_EXISTS_ON_PATH="f"
    if [ "`which nomacs 2> /dev/null`" != "" ]; then
        SB_NOMACS_EXISTS_ON_PATH="t"
    fi
    
    SB_SXIV_EXISTS_ON_PATH="f"
    if [ "`which sxiv 2> /dev/null`" != "" ]; then
        SB_SXIV_EXISTS_ON_PATH="t"
    fi
    
    SB_RISTRETTO_EXISTS_ON_PATH="f"
    if [ "`which ristretto 2> /dev/null`" != "" ]; then
        SB_RISTRETTO_EXISTS_ON_PATH="t"
    fi
    
    SB_EOM_EXISTS_ON_PATH="f"
    if [ "`which eom 2> /dev/null`" != "" ]; then
        SB_EOM_EXISTS_ON_PATH="t"
    fi
    
    SB_GPICVIEW_EXISTS_ON_PATH="f"
    if [ "`which gpicview 2> /dev/null`" != "" ]; then
        SB_GPICVIEW_EXISTS_ON_PATH="t"
    fi
    
    SB_MCOMIX_EXISTS_ON_PATH="f"
    if [ "`which mcomix 2> /dev/null`" != "" ]; then
        SB_MCOMIX_EXISTS_ON_PATH="t"
    fi
fi

SB_CHAFA_EXISTS_ON_PATH="f"
if [ "`which chafa 2> /dev/null`" != "" ]; then
    SB_CHAFA_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_chafa_80x80="nice -n 3 chafa -O 9 --size 80x80 -c full "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "chafa" "38fc5504-b1d2-417c-945c-e241d041a7e7"
fi

SB_CATIMG_EXISTS_ON_PATH="f"
if [ "`which catimg 2> /dev/null`" != "" ]; then
    SB_CATIMG_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_catimg="nice -n 3 catimg "
    alias mmmv_image_viewer_for_terminal_catimg_w150="nice -n 3 catimg -w 150 "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "catimg" "46fd4462-e76a-48ab-a22c-e241d041a7e7"
fi

SB_IMG2SIXEL_EXISTS_ON_PATH="f"
if [ "`which img2sixel 2> /dev/null`" != "" ]; then
    # https://github.com/saitoha/libsixel.git
    # img2sixel works with xterm, provided that the xterm has been
    # compiled to support sixels.
    SB_IMG2SIXEL_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_img2sixel="nice -n 3 img2sixel"
# else
#     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
#         "img2sixel" "6388d48f-da94-466a-b34c-e241d041a7e7"
fi

SB_MPV_EXISTS_ON_PATH="f"
if [ "`which mpv 2> /dev/null`" != "" ]; then
    SB_MPV_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_mpv_t1="nice -n 3 mpv --quiet --vo=tct "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "mpv" "5c01c3d5-6c75-4d56-8e5c-e241d041a7e7"
fi

SB_IMG2TXT_EXISTS_ON_PATH="f"
if [ "`which img2txt 2> /dev/null`" != "" ]; then
    SB_IMG2TXT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "img2txt" "72e43f36-24f0-4c93-895c-e241d041a7e7"
fi

SB_IMG2PDF_EXISTS_ON_PATH="f"
if [ "`which img2pdf 2> /dev/null`" != "" ]; then
    SB_IMG2PDF_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "img2pdf" "1a5c7aa2-9ebb-48dc-913c-e241d041a7e7"
fi

SB_CONVERT_EXISTS_ON_PATH="f"
if [ "`which convert 2> /dev/null`" != "" ]; then
    SB_CONVERT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "convert" "c83bd1af-983c-435d-a04b-e241d041a7e7"
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::clock::applications:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------


#--------------------------------------------------------------------------
#::::::::::::::::::::::::::system::tools:::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
# Filesystem permissions might make some system tools unavailable 
# to non-root users.

SB_ATACONTROL_EXISTS_ON_PATH="f"
if [ "`which atacontrol 2> /dev/null`" != "" ]; then
    SB_ATACONTROL_EXISTS_ON_PATH="t"
fi

SB_COL_EXISTS_ON_PATH="f"
if [ "`which col 2> /dev/null`" != "" ]; then
    SB_COL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "col" "51b2e203-984a-4653-b95b-e241d041a7e7"
fi

SB_DMESG_EXISTS_ON_PATH="f"
if [ "`which dmesg 2> /dev/null`" != "" ]; then
    SB_DMESG_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "dmesg" "3c66f234-a0b3-42e4-a35b-e241d041a7e7"
fi

SB_FSTYP_EXISTS_ON_PATH="f"
if [ "`which fstyp 2> /dev/null`" != "" ]; then
    SB_FSTYP_EXISTS_ON_PATH="t"
fi

SB_GLABEL_EXISTS_ON_PATH="f"
if [ "`which glabel 2> /dev/null`" != "" ]; then
    SB_GLABEL_EXISTS_ON_PATH="t"
fi

if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_GPART_EXISTS_ON_PATH="f"
    if [ "`which gpart 2> /dev/null`" != "" ]; then
        SB_GPART_EXISTS_ON_PATH="t"
    fi
fi

SB_MOUNT_EXISTS_ON_PATH="f"
if [ "`which mount 2> /dev/null`" != "" ]; then
    SB_MOUNT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "mount" "e13eb886-473d-4139-9b2b-e241d041a7e7"
fi

SB_PSTAT_EXISTS_ON_PATH="f"
if [ "`which pstat 2> /dev/null`" != "" ]; then
    SB_PSTAT_EXISTS_ON_PATH="t"
fi

SB_SH_EXISTS_ON_PATH="f"
if [ "`which sh 2> /dev/null`" != "" ]; then
    SB_SH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sh" "9a87b892-866a-467f-981b-e241d041a7e7"
fi

SB_TCSH_EXISTS_ON_PATH="f"
if [ "`which tcsh 2> /dev/null`" != "" ]; then
    SB_TCSH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tcsh" "44157792-8c16-499a-bb2b-e241d041a7e7"
fi

SB_SERVICE_EXISTS_ON_PATH="f"
if [ "`which service 2> /dev/null`" != "" ]; then
    # TODO: for some reason the control flow never reaches this line.
    #       Try to fix that some day.
    SB_SERVICE_EXISTS_ON_PATH="t"
fi

SB_SWAPINFO_EXISTS_ON_PATH="f"
if [ "`which swapinfo 2> /dev/null`" != "" ]; then
    SB_SWAPINFO_EXISTS_ON_PATH="t"
fi

SB_SYSCTL_EXISTS_ON_PATH="f"
if [ "`which sysctl 2> /dev/null`" != "" ]; then
    SB_SYSCTL_EXISTS_ON_PATH="t"
fi

#--------------------------------------------------------------------------
#:::::::::compilers::and::other::translators::and::interpreters::::::::::::
#--------------------------------------------------------------------------
SB_RUBY_EXISTS_ON_PATH="f"
if [ "`which ruby 2> /dev/null`" != "" ]; then
    # The Ruby version might be wrong, but at least 
    # something called "ruby" is on PATH.
    SB_RUBY_EXISTS_ON_PATH="t" 
fi
#--------------------
SB_JAVA_EXISTS_ON_PATH="f"
SB_JAVAC_EXISTS_ON_PATH="f"
#--------------------
# SB_PYTHON_EXISTS_ON_PATH="f"
# if [ "`which python 2> /dev/null`" != "" ]; then
#     SB_PYTHON_EXISTS_ON_PATH="t"
# fi
# #--------------------
# SB_PYTHON3_EXISTS_ON_PATH="f"
# if [ "`which python3 2> /dev/null`" != "" ]; then
#     SB_PYTHON3_EXISTS_ON_PATH="t"
# fi
# #--------------------
# SB_PERL_EXISTS_ON_PATH="f"
# if [ "`which perl 2> /dev/null`" != "" ]; then
#     SB_PERL_EXISTS_ON_PATH="t"
# fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    S_TMP_0="`which gcc 2> /dev/null`"
    SB_GCC_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GCC_EXISTS_ON_PATH="t"
        if [ "$CC" == "" ]; then
            export CC="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gcc" "4a3defd2-410f-466b-9d3b-e241d041a7e7"
    fi
    #--------------------
    S_TMP_0="`which g++ 2> /dev/null`"
    SB_GCCpp_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GCCpp_EXISTS_ON_PATH="t"
        if [ "$CXX" == "" ]; then
            export CXX="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "g++" "4f2a0731-ee56-405c-b33b-e241d041a7e7"
    fi
    #--------------------
    S_TMP_0="`which clang 2> /dev/null`"
    SB_CLANG_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_CLANG_EXISTS_ON_PATH="t"
        if [ "$CC" == "" ]; then
            export CC="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "clang" "1be709bf-cb71-4b7a-921b-e241d041a7e7"
    fi
    #--------------------
    S_TMP_0="`which clang++ 2> /dev/null`"
    SB_CLANGpp_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_CLANGpp_EXISTS_ON_PATH="t"
        if [ "$CXX" == "" ]; then
            export CXX="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "clang++" "40e62a35-3ba9-4e86-b95a-e241d041a7e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::text::editors::and::other::text::editing::tools::::::::::::
#--------------------------------------------------------------------------
SB_AWK_EXISTS_ON_PATH="f"
if [ "`which awk 2> /dev/null`" != "" ]; then
    SB_AWK_EXISTS_ON_PATH="t"
    # awk is NOT compatible with gawk, but
    # it tends to be the case that the awk 
    # is available on various BSDs and the gawk
    # is available on Linux. Sed seems to be
    # available on both, Linux and the varous BSDs.
fi
#--------------------
SB_EMACS_EXISTS_ON_PATH="f"
if [ "`which emacs 2> /dev/null`" != "" ]; then
    SB_EMACS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "emacs" "1e1566e4-81f2-4ded-9d5a-e241d041a7e7"
fi
#--------------------
SB_GAWK_EXISTS_ON_PATH="f"
if [ "`which gawk 2> /dev/null`" != "" ]; then
    SB_GAWK_EXISTS_ON_PATH="t"
    # awk is NOT compatible with gawk, but
    # it tends to be the case that the awk 
    # is available on various BSDs and the gawk
    # is available on Linux. Sed seems to be
    # available on both, Linux and the varous BSDs.
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gawk" "5659b600-a863-43b6-b2ea-e241d041a7e7"
fi
#--------------------
SB_HEAD_EXISTS_ON_PATH="f"
if [ "`which head 2> /dev/null`" != "" ]; then
    SB_HEAD_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "head" "4bfdab32-3861-415d-a25a-e241d041a7e7"
fi
#--------------------
SB_JOE_EXISTS_ON_PATH="f"
if [ "`which joe 2> /dev/null`" != "" ]; then
    SB_JOE_EXISTS_ON_PATH="t"
fi
#--------------------
SB_JQ_EXISTS_ON_PATH="f"
if [ "`which jq 2> /dev/null`" != "" ]; then
    SB_JQ_EXISTS_ON_PATH="t"
    # jq is a JSON text processor. A sample line 
    #     curl "https://koodivaramu.eesti.ee/api/v4/projects?per_page=100" | jq '.[].ssh_url_to_repo'
    # by Raivo Laanemets (infdot.com, "inf" like "infinity")
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "jq" "859a68ed-4de0-4c45-b83a-e241d041a7e7"
fi
#--------------------
SB_MCEDIT_EXISTS_ON_PATH="f"
if [ "`which mcedit 2> /dev/null`" != "" ]; then
    # mcedit is part of the 
    # Midnight Commander File manager, the mc .
    SB_MCEDIT_EXISTS_ON_PATH="t"
fi
#--------------------
SB_PRINTF_EXISTS_ON_PATH="f"
if [ "`which printf 2> /dev/null`" != "" ]; then
    SB_PRINTF_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "printf" "4d7fa644-9595-468b-811a-e241d041a7e7"
fi
#--------------------
SB_RLWRAP_EXISTS_ON_PATH="f"
if [ "`which rlwrap 2> /dev/null`" != "" ]; then
    #----------------------------------------------------------------------
    SB_RLWRAP_EXISTS_ON_PATH="t"
    # https://github.com/hanslub42/rlwrap
    # https://linux.die.net/man/1/rlwrap
    # lrwrap wraps a console application and allows GNU Readline (libreadline)
    # based command line input editing with arrow keys.
    # Another wording might be that it adds text cursor functionality to 
    # some console programs that do not have it on their own.
    #
    # ------sample--Bash--program--citation--start--------
    # #!/usr/bin/env bash
    # echo ""
    # #  B      I   M    --> IBM Watson   year 2011
    # # abcdefghijklmno
    # # A      H   L     --> HAL 9000     year 1968;1992
    # read -p "How may I greet You?" S_NAME
    # echo "Hello $S_NAME!"
    # echo ""
    # ------sample--Bash--program--citation--end----------
    #
    # A demovideo MIGHT be avalable at 
    # $MMMV_USERSPACE_DISTRO_T1_HOME/attic/demovideos/2023_03_22_rlwrap_demo_t1
    #
    #----------------------------------------------------------------------
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rlwrap" "17de2ad4-359c-430c-885a-e241d041a7e7"
fi
#--------------------
SB_SED_EXISTS_ON_PATH="f"
if [ "`which sed 2> /dev/null`" != "" ]; then
    SB_SED_EXISTS_ON_PATH="t"
    # Example Bash line for removing 
    # Bash singleliner comments and empty lines:
    # cat textfile.bash | sed -e 's/[\#].*//g' | sed -e 's/ //g' | sed -e "s/$(printf '\t')//g" | sed -e '/^$/d'
    #
    # The following sed demo code adds a space after each character and
    # it works with both, the GNU sed (on BSD: gsed) and the BSD sed:
    #
    #     printf 'ABC123\n45' |  sed -e 's/\([[:alnum:]]\)/\1 /g'
    #
    alias mmmv_ls_doc_sed_space_after_each_char_t1=" echo \"\" ; echo \"The following works with the GNU sed and with the BSD sed:\" ;  printf \"printf 'ABC123\\\\\\\\n45' | \" ; echo -e \"\\e[33m sed -e 's/\\([[:alnum:]]\\)/\\1 /g' \\e[39m\" ; echo \"\" ; wait ; printf 'ABC123\\n45' | sed -e 's/\\([[:alnum:]]\\)/\\1 /g' "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sed" "580e2c4c-f2f6-42c5-883a-e241d041a7e7"
fi
#--------------------
SB_GSED_EXISTS_ON_PATH="f"
if [ "`which gsed 2> /dev/null`" != "" ]; then
    SB_GSED_EXISTS_ON_PATH="t"
    # On FreeBSD the BSD sed has the name "sed" and 
    # the GNU sed has the name "gsed". 
    # On Linux the GNU sed has the name "sed".
else
    if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gsed" "7d5d2021-b325-4658-ac49-e241d041a7e7"
    fi
fi
#--------------------
SB_SED_OR_GSED_EXISTS_ON_PATH="f"
if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
    SB_SED_OR_GSED_EXISTS_ON_PATH="t"
else
    if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
        SB_SED_OR_GSED_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
        S_CMD_GNU_SED="`which gsed`" # on BSD
    else
        S_CMD_GNU_SED="`which sed`"  # on Linux, including the WSL
    fi
fi
#--------------------
SB_SORT_EXISTS_ON_PATH="f"
if [ "`which sort 2> /dev/null`" != "" ]; then
    SB_SORT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sort" "58095585-d404-448b-8639-e241d041a7e7"
fi
#--------------------
SB_STRINGS_EXISTS_ON_PATH="f"
if [ "`which strings 2> /dev/null`" != "" ]; then
    SB_STRINGS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "strings" "18c856d5-43cb-4878-b559-e241d041a7e7"
fi
#--------------------
SB_TR_EXISTS_ON_PATH="f"
if [ "`which tr 2> /dev/null`" != "" ]; then
    SB_TR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tr" "51bd78c5-9ff0-4b73-a059-e241d041a7e7"
fi
#--------------------
SB_REV_EXISTS_ON_PATH="f"
if [ "`which rev 2> /dev/null`" != "" ]; then
    SB_REV_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rev" "913618d4-996c-4950-a839-e241d041a7e7"
fi
#--------------------
SB_VIM_EXISTS_ON_PATH="f"
MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/vimwiki/2022_11_21_installation_package_by_3rd_party/try_to_install.bash"
if [ "`which vim 2> /dev/null`" != "" ]; then
    #--------------------
    SB_VIM_EXISTS_ON_PATH="t"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT" \
        "2e506223-78e0-4406-9939-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_install_vimwiki="$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "Vim exists, but the file "
            echo "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
            echo -e "\e[31mis missing\e[39m. Leaving at least one alias undefined."
            echo "GUID=='5ca236e3-9e6b-4e0c-984d-e241d041a7e7'"
            echo ""
        fi
    fi
    #--------------------
    S_TMP_0=".txt"
    # The username is part of the textfile name at
    S_TMP_1="$MMMV_USERSPACE_DISTRO_T1_USER_TMP/overwriteable_by_$S_WHOAMI$S_TMP_0"
    # to cope with the situation, where 
    # MMMV_USERSPACE_DISTRO_T1_USER_TMP=="/tmp" 
    # and the S_TMP_1 of different users end up being
    # all in the same folder like 
    # /tmp/overwriteable_by_`whoami`.txt
    #--------------------
    if [ ! -e "$S_TMP_1" ]; then
        if [ ! -h "$S_TMP_1" ]; then # check that it's not a broken symlink
            echo "This textfile is useful with alias mmmv_vim_open_overwriteable_txt ." > $S_TMP_1
            func_mmmv_wait_and_sync_t1
            if [ -e "$S_TMP_1" ]; then
                chmod -f -R 0700 "$S_TMP_1"
                func_mmmv_wait_and_sync_t1
            fi
        fi
    fi
    SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_TMP_1" "50b035a3-dd31-4908-bf19-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_vim_open_overwriteable_txt="nice -n 2 vim $S_TMP_1"
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::::web::browsers:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #--------------------
    S_CMD_NICE_WEBBROWSER="nice -n 5 "
    #--------------------
    S_TMP_0="`which uzbl 2> /dev/null`"
    SB_UZBL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_UZBL_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_uzbl="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # https://www.uzbl.org/
        # https://github.com/uzbl/
    fi
    #--------------------
    S_TMP_0="`which dillo 2> /dev/null`"
    SB_DILLO_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DILLO_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_dillo="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        #--------------------
        S_FP_DILLORC_TEMPLATE="/home/mmmv/mmmv_userspace_distro_t1/mmmv/lib/templates/2023_06_02_archive_org_copy_of_dillo_org_dillorc.txt"
        # The alias singleliner has been divided between the 
        S_TMP_1="S_FP_TEMPLATE=\"$S_FP_DILLORC_TEMPLATE\" ; if [ -e \"\$S_FP_TEMPLATE\" ]; then if [ -d \"\$S_FP_TEMPLATE\" ]; then echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; if [ -h \"\$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder\\e[39m.\" ; else echo -e \"\\e[31mis a folder\\e[39m.\" ; fi ; echo \"but a file is expected.\" ; echo \"GUID=='59b388d3-5be5-4f8f-ab5d-e241d041a7e7'\" ; echo \"\" ; else S_FP_DILLO_HOME=\"\$HOME/.dillo\" ; S_FP_DILLORC=\"\$S_FP_DILLO_HOME/dillorc\" ; if [ ! -e \"\$S_FP_DILLO_HOME\" ]; then if [ -h \"\$S_FP_DILLO_HOME\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Failed to create Dillo configuration file.\" ; echo \"GUID=='55fc3143-702c-4ad0-b22c-e241d041a7e7'\" ; echo \"\" ; else mkdir \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; fi ; fi ; "
        S_TMP_2="if [ -e \"\$S_FP_DILLO_HOME\" ]; then if [ -d \"\$S_FP_DILLO_HOME\" ]; then if [ -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; if [ -d \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31malready exists\\e[39m and\" ; if [ -h \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31mit is a symlink to a folder\\e[39m despite \" ; else echo -e \"\\e[31mit is a folder\\e[39m despite \" ; fi ; echo \"the fact that a file is expected.\" ; else echo -e \"\\e[31malready exists\\e[39m.\" ; fi ; echo \"Not overwriting it.\" ; echo \"GUID=='7c3abb4f-7dc3-4474-b64c-e241d041a7e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Not overwriting it.\" ; echo \"GUID=='43e09832-4dd1-4cb7-a72c-e241d041a7e7'\" ; echo \"\" ; else cp \"\$S_FP_TEMPLATE\" \"\$S_FP_DILLORC\" ; wait ; sync ; wait ; if [ ! -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo -e \"\\e[31mFailed to create\\e[39m the \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo \"GUID=='3bf6b311-fdb7-4bf8-ba2c-e241d041a7e7'\" ; echo \"\" ; else chmod -f -R 0700 \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; echo \"\" ; echo -e \"\\e[32mCreated\\e[39m \$S_FP_DILLORC\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"exists, but it is neither a folder \" ; echo \"nor a symlink to a folder.\" ; echo \"GUID=='49134803-56ca-4e30-bd4c-e241d041a7e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\\e[31mFailed to create folder \\e[39m\" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"GUID=='50cb4ae2-609b-423a-815c-e241d041a7e7'\" ; echo \"\" ; fi ; fi ; else echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; echo -e \"\\e[31mdoes not exist\\e[39m.\" ; echo \"GUID=='47ed7645-90a5-4a6e-b95c-e241d041a7e7'\" ; echo \"\" ; fi ; "
        # cope with a Vim flaw/bug that crashes the Vim. The 
        #
        #     $HOME/.dillo/dillorc 
        #
        # template has been downloaded on 2023_09_02 from
        #
        #     https://web.archive.org/web/20220515221251/https://dillo.org/dillorc
        #
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_DILLORC_TEMPLATE" "6143f955-75c5-41d9-8ca9-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            alias mmmv_admin_create_dillorc_t1="$S_TMP_1$S_TMP_2"
        fi
        # The following is the testing code for the alias mmmv_cre_dillorc:
        #--------------------
        # 
        # #!/usr/bin/env bash
        # 
        # S_FP_TEMPLATE="/home/mmmv/mmmv_userspace_distro_t1/mmmv/lib/templates/2023_06_02_archive_org_copy_of_dillo_org_dillorc.txt" ;
        # if [ -e "$S_FP_TEMPLATE" ]; then
        #     if [ -d "$S_FP_TEMPLATE" ]; then
        #         echo "" ; 
        #         echo "The template " ; 
        #         echo "" ; 
        #         echo "    $S_FP_TEMPLATE" ; 
        #         echo "" ; 
        #         if [ -h "$S_FP_TEMPLATE" ]; then
        #             echo -e "\e[31mis a symlink to a folder\e[39m." ; 
        #         else
        #             echo -e "\e[31mis a folder\e[39m." ; 
        #         fi ;
        #         echo "but a file is expected." ; 
        #         echo "GUID=='f4640f38-24e4-48b2-af3c-e241d041a7e7'" ;
        #         echo "" ; 
        #     else
        #         S_FP_DILLO_HOME="$HOME/.dillo" ;
        #         S_FP_DILLORC="$S_FP_DILLO_HOME/dillorc" ;
        #         if [ ! -e "$S_FP_DILLO_HOME" ]; then
        #             if [ -h "$S_FP_DILLO_HOME" ]; then
        #                 echo "" ; 
        #                 echo "The " ; 
        #                 echo "" ; 
        #                 echo "    $S_FP_DILLO_HOME " ; 
        #                 echo "" ; 
        #                 echo -e "\e[31mis a broken symlink\e[39m." ;
        #                 echo "Failed to create Dillo configuration file." ; 
        #                 echo "GUID=='37fc7f72-3a54-4819-a95c-e241d041a7e7'" ;
        #                 echo "" ; 
        #             else
        #                 mkdir "$S_FP_DILLO_HOME" ; wait ; sync ; wait ;
        #             fi ;
        #         fi ;
        #         if [ -e "$S_FP_DILLO_HOME" ]; then
        #             if [ -d "$S_FP_DILLO_HOME" ]; then
        #                 if [ -e "$S_FP_DILLORC" ]; then
        #                     echo "" ; 
        #                     echo "The " ; 
        #                     echo "" ; 
        #                     echo "    $S_FP_DILLORC" ; 
        #                     echo "" ; 
        #                     if [ -d "$S_FP_DILLORC" ]; then
        #                         echo -e "\e[31malready exists\e[39m and" ; 
        #                         if [ -h "$S_FP_DILLORC" ]; then
        #                             echo -e "\e[31mit is a symlink to a folder\e[39m despite " ; 
        #                         else
        #                             echo -e "\e[31mit is a folder\e[39m despite " ; 
        #                         fi ;
        #                         echo "the fact that a file is expected." ; 
        #                     else
        #                         echo -e "\e[31malready exists\e[39m." ; 
        #                     fi ;
        #                     echo "Not overwriting it." ; 
        #                     echo "GUID=='27eef2b1-b459-4c6c-985b-e241d041a7e7'" ;
        #                     echo "" ; 
        #                 else
        #                     if [ -h "$S_FP_DILLORC" ]; then
        #                         echo "" ; 
        #                         echo "The " ; 
        #                         echo "" ; 
        #                         echo "    $S_FP_DILLORC" ; 
        #                         echo "" ; 
        #                         echo -e "\e[31mis a broken symlink\e[39m." ; 
        #                         echo "Not overwriting it." ; 
        #                         echo "GUID=='1f4650c5-3ed7-40e0-ad5b-e241d041a7e7'" ;
        #                         echo "" ; 
        #                     else
        #                         cp "$S_FP_TEMPLATE"  "$S_FP_DILLORC" ; wait ; sync ; wait ;
        #                         if [ ! -e "$S_FP_DILLORC" ]; then
        #                             echo "" ; 
        #                             echo -e "\e[31mFailed to create\e[39m the " ; 
        #                             echo "" ; 
        #                             echo "    $S_FP_DILLORC" ; 
        #                             echo "" ; 
        #                             echo "GUID=='55d800d3-4446-45d3-931b-e241d041a7e7'" ;
        #                             echo "" ; 
        #                         else 
        #                             chmod -f -R 0700 "$S_FP_DILLO_HOME" ; wait ; sync ; wait ;
        #                             echo "" ; 
        #                             echo -e "\e[32mCreated\e[39m $S_FP_DILLORC" ; 
        #                             echo "" ; 
        #                         fi ;
        #                     fi ;
        #                 fi ;
        #             else
        #                 echo "" ; 
        #                 echo "The " ; 
        #                 echo "" ; 
        #                 echo "    $S_FP_DILLO_HOME " ; 
        #                 echo "" ; 
        #                 echo "exists, but it is neither a folder " ;
        #                 echo "nor a symlink to a folder." ; 
        #                 echo "GUID=='a46eab27-8663-4133-a05b-e241d041a7e7'" ;
        #                 echo "" ; 
        #             fi ;
        #         else
        #             echo "" ; 
        #             echo -e "\e[31mFailed to create folder \e[39m" ; 
        #             echo "" ; 
        #             echo "    $S_FP_DILLO_HOME " ; 
        #             echo "" ; 
        #             echo "GUID=='8a71b691-89c2-47f3-b61b-e241d041a7e7'" ;
        #             echo "" ; 
        #         fi ;
        #     fi ;
        # else
        #     echo "" ; 
        #     echo "The template " ; 
        #     echo "" ; 
        #     echo "    $S_FP_TEMPLATE" ; 
        #     echo "" ; 
        #     echo -e "\e[31mdoes not exist\e[39m." ; 
        #     echo "GUID=='b22ac4b3-aae1-4128-941b-e241d041a7e7'" ;
        #     echo "" ; 
        # fi ;
        # 
        #--------------------
    fi
    #--------------------
    S_TMP_0="`which links 2> /dev/null`"
    SB_LINKS_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LINKS_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_links="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # links is a terminal based web browser.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "links" "730046ef-7f7a-455c-8b38-e241d041a7e7"
    fi
    #--------------------
    S_TMP_0="`which elinks 2> /dev/null`"
    SB_ELINKS_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_ELINKS_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_elinks="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # ELinks is a terminal based web browser.
        # http://elinks.cz/
    fi
    #--------------------
    S_TMP_0="`which lynx 2> /dev/null`"
    SB_LYNX_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LYNX_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_lynx="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # lynx is a terminal based web browser.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "lynx" "1823f313-d089-436c-9948-e241d041a7e7"
    fi
    #--------------------
    S_TMP_0="`which netrik 2> /dev/null`"
    SB_NETRIK_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NETRIK_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_netrik="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # Netrik is a terminal based web browser.
        # https://netrik.sourceforge.net/
    fi
    #--------------------
    S_TMP_0="`which netsurf 2> /dev/null`"
    SB_NETSURF_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NETSURF_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_netsurf="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which rekonq 2> /dev/null`"
    SB_REKONQ_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_REKONQ_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_rekonq="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which midori 2> /dev/null`"
    SB_MIDORI_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_MIDORI_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_midori="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which iceweasel 2> /dev/null`"
    SB_ICEWEASEL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_ICEWEASEL_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_iceweasel="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which firefox 2> /dev/null`"
    SB_FIREFOX_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FIREFOX_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_firefox="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which qutebrowser 2> /dev/null`"
    SB_QUTEBROWSER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_QUTEBROWSER_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_qutebrowser="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which epiphany 2> /dev/null`"
    SB_EPIPHANY_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_EPIPHANY_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_epiphany="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which konqueror 2> /dev/null`"
    SB_KONQUEROR_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_KONQUEROR_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_konqueror="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        alias mmmv_filemanager_konqueror="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which falkon 2> /dev/null`"
    SB_FALKON_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FALKON_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_falkon="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which falcon 2> /dev/null`"
    SB_FALCON_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FALCON_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_falcon="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which w3m 2> /dev/null`"
    SB_W3M_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_W3M_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_w3m="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # w3m is a terminal based web browser.
        # https://w3m.sourceforge.net/
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::::file::managers:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which nautilus 2> /dev/null`"
    SB_NAUTILUS_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NAUTILUS_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_nautilus="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
S_TMP_0="`which mc 2> /dev/null`"
SB_MC_EXISTS_ON_PATH="f"
if [ "$S_TMP_0" != "" ]; then
    SB_MC_EXISTS_ON_PATH="t"
    alias mmmv_filemanager_mc="nice -n 5 $S_TMP_0 "
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which dolphin 2> /dev/null`"
    SB_DOLPHIN_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DOLPHIN_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_dolphin="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # The muCommander is a Java program with a horribly 
    # slow start-up, but it has very nice features.
    #     https://www.mucommander.com/
    #     https://github.com/mucommander
    S_TMP_0="`which mucommander 2> /dev/null`" 
    SB_MUCOMMANDER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_MUCOMMANDER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_mucommander="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # The lightweight, but occasionally unstable, Pascal based filemanager.
    S_TMP_0="`which pcmanfm 2> /dev/null`"
    SB_PCMANFM_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_PCMANFM_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_pcmanfm="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # Wii Backup File System Manager (QWBFS)
    S_TMP_0="`which qwbfsmanager 2> /dev/null`"
    SB_QWBFSMANAGER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_QWBFSMANAGER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_qwbfsmanager="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which nemo 2> /dev/null`"
    SB_NEMO_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NEMO_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_nemo="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which thunar 2> /dev/null`"
    SB_THUNAR_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_THUNAR_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_thunar="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # https://krusader.org/
    S_TMP_0="`which krusader 2> /dev/null`"
    SB_KRUSADER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_KRUSADER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_krusader="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which xfe 2> /dev/null`"
    SB_XFE_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_XFE_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_xfe="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which 4pane 2> /dev/null`"
    SB_4PANE_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_4PANE_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_4pane="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which spacefm 2> /dev/null`"
    SB_SPACEFM_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_SPACEFM_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_spacefm="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which caja 2> /dev/null`"
    SB_CAJA_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_CAJA_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_caja="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which ranger 2> /dev/null`"
    SB_RANGER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_RANGER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_ranger="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which doublecmd 2> /dev/null`"
    SB_DOUBLECMD_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DOUBLECMD_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_doublecmd="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which vifm 2> /dev/null`"
    SB_VIFM_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_VIFM_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_vifm="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # http://www.boomerangsworld.de/cms/worker/
    S_TMP_0="`which worker 2> /dev/null`"
    SB_WORKER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_WORKER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_worker="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # https://github.com/jarun/nnn
    S_TMP_0="`which nnn 2> /dev/null`"
    SB_NNN_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NNN_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_nnn="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which gentoo 2> /dev/null`"
    SB_GENTOO_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GENTOO_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_gentoo="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
# File managers to be tested/added_here in the future:
#     fman, sunflower, polo, deepin<something>
#--------------------------------------------------------------------------
#::::::::::::::::copying::tools::other::than::file::managers:::::::::::::::
#--------------------------------------------------------------------------
SB_LFTP_EXISTS_ON_PATH="f"
if [ "`which lftp 2> /dev/null`" != "" ]; then
    SB_LFTP_EXISTS_ON_PATH="t"
    #--------------------
    # https://stackoverflow.com/questions/6327800/lftp-timeout-not-working
    # arcival copy: https://archive.vn/qi0z0
    alias mmmv_lftp_t1="nice -n 5 lftp -e \"set net:timeout 5; set net:reconnect-interval-base 5; set net:max-retries 3;\" "
    # Supposedly by default the net:max-retries==1000 .
    #--------------------
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "lftp" "51789504-8b6d-4946-bc58-e241d041a7e7"
fi
#--------------------
SB_PUTTY_EXISTS_ON_PATH="f"
if [ "`which putty 2> /dev/null`" != "" ]; then
    SB_PUTTY_EXISTS_ON_PATH="t"
fi
#--------------------
SB_RCLONE_EXISTS_ON_PATH="f"
if [ "`which rclone 2> /dev/null`" != "" ]; then
    # rclone is a command line client for WebDAV.
    # It somewhat resembles a command line FTP client.
    #
    #     https://rclone.org/
    #     http://www.webdav.org/
    #
    SB_RCLONE_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rclone" "5fb78db2-a853-4b3f-a638-e241d041a7e7"
fi
#--------------------
SB_RSYNC_EXISTS_ON_PATH="f"
if [ "`which rsync 2> /dev/null`" != "" ]; then
    SB_RSYNC_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rsync" "59b6cdb5-dde5-4e95-aa38-e241d041a7e7"
fi
#--------------------
SB_SSH_EXISTS_ON_PATH="f"
if [ "`which ssh 2> /dev/null`" != "" ]; then
    SB_SSH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "ssh" "26d7e3f2-ae51-4e80-bc48-e241d041a7e7"
fi
#--------------------
SB_SCP_EXISTS_ON_PATH="f"
if [ "`which scp 2> /dev/null`" != "" ]; then
    SB_SCP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "scp" "5a5632b2-6d56-4c5b-9138-e241d041a7e7"
fi
#--------------------
SB_UNISON_EXISTS_ON_PATH="f"
if [ "`which unison 2> /dev/null`" != "" ]; then
    SB_UNISON_EXISTS_ON_PATH="t"
fi
#--------------------------------------------------------------------------
#::::::::::::::repository::systems::id::est::revision::control:::::::::::::
#--------------------------------------------------------------------------
# https://en.wikipedia.org/wiki/List_of_version_control_software
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    S_TMP_0="`which cvs 2> /dev/null`"
    SB_CVS_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_CVS_EXISTS_ON_PATH="t"
    fi
    #--------------------
    S_TMP_0="`which svn 2> /dev/null`"
    SB_SUBVERSION_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_SUBVERSION_EXISTS_ON_PATH="t"
    fi
    #--------------------
    # https://www.mercurial-scm.org/
    S_TMP_0="`which hg 2> /dev/null`"
    SB_MERCURIAL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_MERCURIAL_EXISTS_ON_PATH="t"
    fi
    #--------------------
    S_TMP_0="`which git 2> /dev/null`"
    SB_GIT_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GIT_EXISTS_ON_PATH="t"
        alias mmmv_git_gc_t1="nice -n 23 $S_TMP_0 gc --aggressive --prune=all "
        alias mmmv_git_ls_unstored="nice -n 19 $S_TMP_0 status -uall --ignored "
        alias mmmv_git_clone_recursive="nice -n 19 $S_TMP_0 clone --recursive "
        alias mmmv_git_ignore_https_certificate="GIT_SSL_NO_VERIFY=true nice -n 19 $S_TMP_0 "
        alias mmmv_git_init_config_global_FooBar_t1="git config --global init.defaultBranch main ; git config --global user.email \"Foo@Bar.com\" ; git config --global user.name \"Foo Bar\" ; wait ; sync ; wait ; "
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        S_TMP_0="`which gitg 2> /dev/null`"
        SB_GITG_EXISTS_ON_PATH="f"
        if [ "$S_TMP_0" != "" ]; then
            SB_GITG_EXISTS_ON_PATH="t"
            if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_gitg="nice -n 19 $S_TMP_0 "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitg exists on PATH while the git is missing.\e[39m"
                    echo "GUID=='44222cd3-5000-4ede-872b-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
        S_TMP_0="`which gitk 2> /dev/null`"
        SB_GITK_EXISTS_ON_PATH="f"
        if [ "$S_TMP_0" != "" ]; then
            SB_GITK_EXISTS_ON_PATH="t"
            if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_gitk="nice -n 19 $S_TMP_0 "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the git is missing.\e[39m"
                    echo "GUID=='029fe703-2261-4261-8d1b-e241d041a7e7'"
                    echo ""
                fi
            fi
            if [ "$SB_GITG_EXISTS_ON_PATH" == "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the gitg is missing.\e[39m"
                    # As of 2021 the gitk has an optionally available 
                    # menu option that depends on the gitg.
                    echo "GUID=='3eff6355-a0a6-4816-b74a-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #--------------------
    S_TMP_0="`which bzr 2> /dev/null`"
    SB_BAZAAR_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_BAZAAR_EXISTS_ON_PATH="t"
    fi
    #--------------------
    # https://www.gnu.org/software/gnu-arch/
    S_TMP_0="`which tla 2> /dev/null`"
    SB_GNU_ARCH_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GNU_ARCH_EXISTS_ON_PATH="t"
    fi
    #--------------------
    # http://darcs.net/
    #
    # Installation as of 2021_08:
    #
    #     cabal install darcs
    #     # or
    #     stack install darcs
    #
    S_TMP_0="`which darcs 2> /dev/null`"
    SB_DARCH_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DARCH_EXISTS_ON_PATH="t"
    fi
    #--------------------
    # TODO: add Vesta here
    #     http://vesta.sourceforge.net/
    #     https://risicato.org/
    #
    #     # As of 2021_08_31 the
    #     http://www.vestasys.org/
    #     # is offline.
    #
    #--------------------
    # TODO: Add the following systems:
    #     ArX  http://www.nongnu.org/arx/
    #     monotone https://www.monotone.ca/
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::::::printing:::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which lpstat 2> /dev/null`"
    SB_LPSTAT_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LPSTAT_EXISTS_ON_PATH="t"
        alias mmmv_ls_printers="$S_TMP_0 -p -d " # shows printers from CUPS setup
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which lp 2> /dev/null`"
    SB_LP_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LP_EXISTS_ON_PATH="t"
    fi
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::code::formatters:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    S_TMP_0="`which astyle 2> /dev/null`"
    SB_ASTYLE_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_ASTYLE_EXISTS_ON_PATH="t"
        alias mmmv_astyle_t1="nice -n 4 $S_TMP_0 --style=java --indent=spaces=4 "
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::code::generators:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    S_TMP_0="`which bison 2> /dev/null`"
    SB_BISON_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_BISON_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "bison" "10e9c645-aa19-4ab4-8148-e241d041a7e7"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="`which re2c 2> /dev/null`"
    SB_RE2C_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        #-----------------------------------------
        # http://re2c.org/
        # -------citation--start------------------ 
        # re2c is a free and open-source 
        # lexer generator for C/C++, Go and Rust 
        # with a focus on generating fast code. 
        # It compiles regular expression 
        # specifications to deterministic 
        # finite automata and encodes them 
        # in the form of conditional jumps 
        # in the target language. 
        # -------citation--end--------------------
        SB_RE2C_EXISTS_ON_PATH="t"
        #-----------------------------------------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "re2c" "e2777d4c-c236-434f-bbb7-e241d041a7e7"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="`which yacc 2> /dev/null`"
    SB_YACC_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_YACC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "yacc" "3e5d7765-d420-4353-b617-e241d041a7e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::compression::software::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
SB_ATOOL_EXISTS_ON_PATH="f"
if [ "`which atool 2> /dev/null`" != "" ]; then
    SB_ATOOL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "atool" "7236f681-fd7a-4112-9157-e241d041a7e7"
fi
#--------------------
SB_ARCHIVEMOUNT_EXISTS_ON_PATH="f"
if [ "`which archivemount 2> /dev/null`" != "" ]; then
    SB_ARCHIVEMOUNT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "archivemount" "bef22ea3-8924-4f65-9c37-e241d041a7e7"
fi
#--------------------
SB_TAR_EXISTS_ON_PATH="f"
if [ "`which tar 2> /dev/null`" != "" ]; then
    SB_TAR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tar" "579f4243-1d8a-4e63-b357-e241d041a7e7"
fi
#--------------------
SB_GZIP_EXISTS_ON_PATH="f"
if [ "`which gzip 2> /dev/null`" != "" ]; then
    SB_GZIP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gzip" "e59f2a66-6fdb-4b0d-b637-e241d041a7e7"
fi
#--------------------
SB_GUNZIP_EXISTS_ON_PATH="f"
if [ "`which gunzip 2> /dev/null`" != "" ]; then
    SB_GUNZIP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gunzip" "530e4189-984a-45fb-8017-e241d041a7e7"
fi
#--------------------
SB_PIGZ_EXISTS_ON_PATH="f"
if [ "`which pigz 2> /dev/null`" != "" ]; then
    # The pigz allows to crate gz-files by using multiple hardware threads.
    SB_PIGZ_EXISTS_ON_PATH="t"
    # A command example:
    #
    #     tar cf - /pat/to/compressable/folder | pigz -9 -p 4 > archive.tar.gz
    #
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pigz" "48f79105-4796-426e-8d27-e241d041a7e7"
fi
#--------------------
SB_XZ_EXISTS_ON_PATH="f"
if [ "`which xz 2> /dev/null`" != "" ]; then
    SB_XZ_EXISTS_ON_PATH="t"
    S_TMP_0="64MiB"
    if [ "`echo '$S_UNAME_A' | grep -i 'Raspberry'`" == "" ]; then
        S_TMP_0="400MiB"
    fi
    export XZ_DEFAULTS="--memlimit=$S_TMP_0"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "xz" "f1e374f3-be76-4395-af46-e241d041a7e7"
fi
#--------------------
SB_UNXZ_EXISTS_ON_PATH="f"
if [ "`which unxz 2> /dev/null`" != "" ]; then
    SB_UNXZ_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "unxz" "a35ac6f0-26d3-4135-af36-e241d041a7e7"
fi
#--------------------
SB_RAR_EXISTS_ON_PATH="f"
if [ "`which rar 2> /dev/null`" != "" ]; then
    SB_RAR_EXISTS_ON_PATH="t"
else
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rar" "e5bf5e8c-3a27-430c-b026-e241d041a7e7"
    fi
fi
#--------------------
SB_UNRAR_EXISTS_ON_PATH="f"
if [ "`which unrar 2> /dev/null`" != "" ]; then
    SB_UNRAR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "unrar" "052e709f-3e37-43ee-8ca6-e241d041a7e7"
fi
#--------------------
SB_ARJ_EXISTS_ON_PATH="f"
if [ "`which arj 2> /dev/null`" != "" ]; then
    SB_ARJ_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "arj" "4c5b49f3-6d4d-474d-aa56-e241d041a7e7"
fi
#--------------------
SB_XAR_EXISTS_ON_PATH="f"
if [ "`which xar 2> /dev/null`" != "" ]; then
    SB_XAR_EXISTS_ON_PATH="t"
#else
#    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
#        "xar" "1771d531-de18-4fb6-8646-e241d041a7e7"
fi
if [ "$SB_XZ_EXISTS_ON_PATH" != "" ]; then
    #----------------------------------------
    if [ "$SB_XZ_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_XAR_EXISTS_ON_PATH" == "t" ]; then
            if [ "$XZ_DEFAULTS" != "" ]; then
                alias mmmv_xar="XZ_DEFAULTS=\"$XZ_DEFAULTS\" nice -n 17 xar --toc-cksum=sha256 --compression=xz  --compression-args=9 --coalesce-heap --keep-existing "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
                    echo ""
                    echo "     XZ_DEFAULTS==\"$XZ_DEFAULTS\" "
                    echo ""
                    echo "GUID=='a24abaf5-874f-45a4-b14a-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    else
        if [ "$SB_XZ_EXISTS_ON_PATH" != "f" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
                echo ""
                echo "     SB_XZ_EXISTS_ON_PATH==\"$SB_XZ_EXISTS_ON_PATH\" "
                echo ""
                echo "GUID=='e74750cd-1ab2-4cc0-881a-e241d041a7e7'"
                echo ""
            fi
        fi
    fi
    #----------------------------------------
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo ""
        echo "     SB_XZ_EXISTS_ON_PATH==\"$SB_XZ_EXISTS_ON_PATH\" "
        echo ""
        echo "GUID=='614addae-4107-41e4-97ba-e241d041a7e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::HTML::to::PDF::converters:::::::::::::::::::::::::
#--------------------------------------------------------------------------
S_TMP_0="`which wkhtmltopdf 2> /dev/null`"
SB_WKHTMLTOPDF_EXISTS_ON_PATH="f"
if [ "$S_TMP_0" != "" ]; then
    SB_WKHTMLTOPDF_EXISTS_ON_PATH="t"
    alias mmmv_HTML2PDF_wkhtmltopdf="nice -n 19 wkhtmltopdf "
fi
# TODO: A technology that should be wrapped to be used
# as a console application like the wkhtmltopdf is the 
# https://developers.google.com/web/tools/puppeteer/
# Thank You, Raivo Laanemets @ https://infdot.com/, for 
# the Puppeteer reference.
#
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::PDF::to::X::converters:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
# Sometimes it is difficult to remmber, that 
# Foo2Bar is spelled as FootoBar. Hence the aliases.
#--------------------
SB_PDFTOCAIRO_EXISTS_ON_PATH="f"
if [ "`which pdftocairo 2> /dev/null`" != "" ]; then
    SB_PDFTOCAIRO_EXISTS_ON_PATH="t"
    alias pdf2cairo="nice -n 2 pdftocairo "
#else
    #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #    "pdftocairo" "2c4e66d2-9745-4e98-9d35-e241d041a7e7"
fi
#--------------------
SB_PDFTOHTMl_EXISTS_ON_PATH="f"
if [ "`which pdftohtml 2> /dev/null`" != "" ]; then
    SB_PDFTOHTMl_EXISTS_ON_PATH="t"
    alias pdf2html="nice -n 2 pdftohtml "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftohtml" "439a98a2-d77b-44be-bf15-e241d041a7e7"
fi
#--------------------
SB_PDFTOPPM_EXISTS_ON_PATH="f"
if [ "`which pdftoppm 2> /dev/null`" != "" ]; then
    SB_PDFTOPPM_EXISTS_ON_PATH="t"
    alias pdf2ppm="nice -n 2 pdftoppm "
#else
    #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #    "pdftoppm" "221eca84-783b-42c2-b535-e241d041a7e7"
fi
#--------------------
SB_PDFTOPS_EXISTS_ON_PATH="f"
if [ "`which pdftops 2> /dev/null`" != "" ]; then
    SB_PDFTOPS_EXISTS_ON_PATH="t"
    alias pdf2ps="nice -n 2 pdftops "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftops" "b2cf8cd6-780a-4574-9085-e241d041a7e7"
fi
#--------------------
SB_PDFTOSRC_EXISTS_ON_PATH="f"
if [ "`which pdftosrc 2> /dev/null`" != "" ]; then
    SB_PDFTOSRC_EXISTS_ON_PATH="t"
    alias pdf2src="nice -n 2 pdftosrc "
#else
    #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #    "pdftosrc" "46e22bf2-4ef9-441d-a425-e241d041a7e7"
fi
#--------------------
SB_PDFTOTEXT_EXISTS_ON_PATH="f"
if [ "`which pdftotext 2> /dev/null`" != "" ]; then
    SB_PDFTOTEXT_EXISTS_ON_PATH="t"
    alias pdf2text="nice -n 2 pdftotext "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftotext" "4887d831-8828-4138-af25-e241d041a7e7"
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::desktopo::environment:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH="t"
if [ "`which gnome-typing-monitor 2> /dev/null`" != "" ]; then
    SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH="t"
    alias mmmv_ui_kill_gnometypingmonitor_t1="nice -n 2 killall gnome-typing-monitor "
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        if [ "`ps -A | grep gnome-typing-monitor 2> /dev/null`" != "" ]; then
            echo ""
            echo -e "You may want to\e[33m run the alias mmmv_ui_kill_gnometypingmonitor_t1\e[39m"
            echo "or switch the gnome-typing-monitor off some other way,"
            echo "because that bully-ware is running right now."
            echo "GUID=='4115a889-b7e9-42bd-89aa-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #--------------------
    SB_XDOTOOL_EXISTS_ON_PATH="f"
    if [ "`which xdotool 2> /dev/null`" != "" ]; then
        SB_XDOTOOL_EXISTS_ON_PATH="t"
        #--------
        # https://askubuntu.com/questions/4876/can-i-minimize-a-window-from-the-command-line
        # archival copy: https://archive.vn/sNxpI
        alias mmmv_ui_minimize_active_window_t1="nice -n 3 xdotool windowminimize \$(xdotool getactivewindow) "
        #--------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xdotool" "3160aa26-c660-4003-ba55-e241d041a7e7"
    fi
    #--------------------
    SB_WMCTRL_EXISTS_ON_PATH="f"
    if [ "`which wmctrl 2> /dev/null`" != "" ]; then
        SB_WMCTRL_EXISTS_ON_PATH="t"
        alias mmmv_ui_switch_to_desktop_t1="nice -n 2 wmctrl -s " # desktop number is the argument
        #--------
        if [ "$SB_XDOTOOL_EXISTS_ON_PATH" == "t" ]; then
            # https://gist.github.com/platan/e63b465c2fcfe3d0cccd
            # archival copy:https://archive.ph/PZhM8 
            alias mmmv_ui_maximize_active_window_t1="nice -n 3 wmctrl -i -r \"\`xdotool getactivewindow\`\" -b add,maximized_vert,maximized_horz "
        fi
        #--------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "wmctrl" "35e614a1-d291-4b44-ac35-e241d041a7e7"
    fi
    #--------------------
    if [ "$SB_GSETTINGS_WORKS_T1" != "" ]; then
        func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
            "$SB_GSETTINGS_WORKS_T1" "SB_GSETTINGS_WORKS_T1" \
            "3440def4-12d4-41d7-b134-e241d041a7e7"
        if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
            SB_GSETTINGS_WORKS_T1="f" # to allow code at future locations 
                                      # of the control flow to work
        fi
    else
        SB_GSETTINGS_WORKS_T1="f" # exists to avoid some tests at sub-sessions
    fi
    #--------
    SB_GSETTINGS_EXISTS_ON_PATH="f"
    if [ "`which gsettings 2> /dev/null`" != "" ]; then
        SB_GSETTINGS_EXISTS_ON_PATH="t"
        #--------
        # https://askubuntu.com/questions/209597/how-do-i-change-keyboards-from-the-command-line
        # archival copy: https://archive.ph/Lh4L7
        #
        #     gsettings set org.gnome.desktop.input-sources sources "[('xkb','us'),('xkb','ee'),('xkb','ru')]"
        #     gsettings list-recursively org.gnome.desktop.input-sources
        #
        #--------
        if [ "$SB_GSETTINGS_WORKS_T1" != "t" ]; then
            S_TMP_0="`gsettings list-recursively org.gnome.desktop.input-sources 1> /dev/null; printf \"\$?\"`"
            if [ "$S_TMP_0" == "0" ]; then
                if [ "`gsettings list-recursively org.gnome.desktop.input-sources 2> /dev/null`" != "" ]; then
                    SB_GSETTINGS_WORKS_T1="t"
                fi
            fi
        fi
        if [ "$SB_GSETTINGS_WORKS_T1" == "t" ]; then
            alias mmmv_admin_gnome_declare_keyboard_layouts_us_ee_ru_t1="gsettings set org.gnome.desktop.input-sources sources \"[('xkb','us'),('xkb','ee'),('xkb','ru')]\" ; "
            alias mmmv_admin_gnome_declare_keyboard_layouts_us_ee_t1="gsettings set org.gnome.desktop.input-sources sources \"[('xkb','us'),('xkb','ee')]\" ; "
            alias mmmv_admin_gnome_declare_keyboard_layouts_us_t1="gsettings set org.gnome.desktop.input-sources sources \"[('xkb','us')]\" ; "
            alias mmmv_admin_gnome_declare_keyboard_layouts_ee_t1="gsettings set org.gnome.desktop.input-sources sources \"[('xkb','ee')]\" ; "
        fi
        #--------
     else
        if [ "$SB_GSETTINGS_WORKS_T1" == "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "A mmmv_userspace_distro_t1 related "
                echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                echo "The values of the "
                echo "    SB_GSETTINGS_WORKS_T1==\"$SB_GSETTINGS_WORKS_T1\""
                echo "    SB_GSETTINGS_EXISTS_ON_PATH==\"$SB_GSETTINGS_EXISTS_ON_PATH\""
                echo "are in conflict with each other."
                echo "GUID=='552255c5-8e8f-43ec-b82a-e241d041a7e7'"
                echo ""
            fi
        fi
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "gsettings" "65d2cf0b-baf5-44cf-abd4-e241d041a7e7"
    fi
    #--------------------
    SB_IMPORT_EXISTS_ON_PATH="f"
    if [ "`which import 2> /dev/null`" != "" ]; then
        SB_IMPORT_EXISTS_ON_PATH="t"
        # https://www.linuxquestions.org/questions/showthread.php?postid=671450
        # archival copy: https://archive.ph/MITPW
        #
        # Testing command:
        #
        #     bash -c "S_FP_PREFIX=\"`pwd`\" ; sleep 3; import -window root \$S_FP_PREFIX/\`date +%Y\`_\`date +%m\`_\`date +%d\`_X.jpeg "
        #
        #
        alias mmmv_cre_screenshot_3s_delay_t1="bash -c \"S_FP_PREFIX=\\\"\`pwd\`\\\" ; sleep 3; import -window root \\\$S_FP_PREFIX/\\\`date +%Y\\\`_\\\`date +%m\\\`_\\\`date +%d\\\`_X.jpeg \" "
        alias mmmv_cre_screenshot_6s_delay_t1="bash -c \"S_FP_PREFIX=\\\"\`pwd\`\\\" ; sleep 6; import -window root \\\$S_FP_PREFIX/\\\`date +%Y\\\`_\\\`date +%m\\\`_\\\`date +%d\\\`_X.jpeg \" "
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "import" "f3f807a4-5f35-42e8-bfb4-e241d041a7e7"
    fi
    #--------------------
    SB_GNOMECHARACTERS_EXISTS_ON_PATH="f"
    if [ "`which gnome-characters 2> /dev/null`" != "" ]; then
        SB_GNOMECHARACTERS_EXISTS_ON_PATH="t"
        alias mmmv_charmap_t1="nice -n 4 gnome-characters "
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "gnome-characters" "73e93497-be6d-4244-87b4-e241d041a7e7"
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::::various:::::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    SB_AUTOCONF_EXISTS_ON_PATH="f"
    if [ "`which autoconf 2> /dev/null`" != "" ]; then
        SB_AUTOCONF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "autoconf" "e2c1095d-1033-445d-a334-e241d041a7e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------
SB_BASE64_EXISTS_ON_PATH="f"
if [ "`which base64 2> /dev/null`" != "" ]; then
    SB_BASE64_EXISTS_ON_PATH="t"
fi
#--------------------
SB_STAT_EXISTS_ON_PATH="f"
if [ "`which stat 2> /dev/null`" != "" ]; then
    SB_STAT_EXISTS_ON_PATH="t"
    # Supposedly on Linux the "stat" is part of the GNU coreutils.
    # "stat" on FreeBSD is a separate program with a 
    # different interface.
fi
#--------------------
SB_BC_EXISTS_ON_PATH="f"
if [ "`which bc 2> /dev/null`" != "" ]; then
    SB_BC_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "bc" "3be48da2-13b5-44a4-9b14-e241d041a7e7"
fi
#--------------------
SB_PMAP_EXISTS_ON_PATH="f"
if [ "`which pmap 2> /dev/null`" != "" ]; then
    SB_PMAP_EXISTS_ON_PATH="t"
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
    #----------------------------------------------------------------------
    # https://stackoverflow.com/questions/749544/pipe-to-from-the-clipboard-in-a-bash-script
    # The Linux clipboard use:
    #     Clipboard to file:
    #         xclip -out > ./x.txt
    #     File to clipboard: 
    #         xclip -selection c -in < ./x.txt
    #         # or another option
    #         cat ./x.txt | xclip -selection c -in 
    SB_XCLIP_EXISTS_ON_PATH="f"
    if [ "`which xclip 2> /dev/null`" != "" ]; then
        SB_XCLIP_EXISTS_ON_PATH="t"
        # Supposedly some binary with the name of "xclip"
        # is also available on FreeBSD
        # https://man.freebsd.org/cgi/man.cgi?query=xclip&sektion=1&manpath=FreeBSD+13.2-RELEASE+and+Ports
        # archival copy: https://archive.ph/pA9Gw
        # 
        # TODO: test, whether the BSD xclip matches with the
        #       Linux xclip or it is just named the same like
        #       the BSD sed has the same name as the sed on Linux
        #       despite the fact that the BSD sed is a 
        #       totally different program with different features.
        #
        # Supposedly Termux supports xclip:
        # https://sachachua.com/blog/2019/07/tweaking-emacs-on-android-via-termux-xclip-xdg-open-syncthing-conflicts/
        # archival copy: 
    else
       func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
           "xclip" "92dbfea1-6644-4ef1-8034-e241d041a7e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    SB_CHECKBASHISMS_EXISTS_ON_PATH="f"
    if [ "`which checkbashisms 2> /dev/null`" != "" ]; then
        SB_CHECKBASHISMS_EXISTS_ON_PATH="t"
    fi
    #--------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        SB_DEBTREE_EXISTS_ON_PATH="f"
        if [ "`which debtree 2> /dev/null`" != "" ]; then
            SB_DEBTREE_EXISTS_ON_PATH="t"
            # A command example:
            #
            #     debtree vim | dot -Tjpeg  > ./image.jpeg ; wait; sync; wait; viewnior ./image.jpeg
            #
        else
            # Please comment out the next 2 lines on distributions that are not based on Debian.
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "debtree" "44e81415-6800-4313-bc33-e241d041a7e7"
            # Thank You.
        fi
    fi
    #--------------------
    SB_LIBTOOL_EXISTS_ON_PATH="f"
    if [ "`which libtool 2> /dev/null`" != "" ]; then
        # The GNU libtool is required for 
        # building at least some versions of the GCC.
        SB_LIBTOOL_EXISTS_ON_PATH="t"
    # The 
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "libtool" "2ff9af41-33ab-41de-ae53-e241d041a7e7"
    # can not be here, because the libtool might be 
    # added to PATH from applications folder later at this Bash script.
    fi
    #--------------------
    S_TMP_0="`which m4 2> /dev/null`"
    SB_M4_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_M4_EXISTS_ON_PATH="t"
        if [ "$M4" == "" ]; then
            # Some build scripts require that the environment variable 
            # M4 is set even, if the m4 is available on PATH.
            export M4="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "m4" "5c0d1df4-6491-4cfa-a123-e241d041a7e7"
    fi
    #--------------------
    S_TMP_0="`which make 2> /dev/null`"
    SB_MAKE_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_MAKE_EXISTS_ON_PATH="t"
    fi
    #--------
    S_TMP_1="`which gmake 2> /dev/null`"
    SB_GMAKE_EXISTS_ON_PATH="f"
    SB_MAKE_IS_GMAKE="f"
    if [ "$S_TMP_1" != "" ]; then
        SB_GMAKE_EXISTS_ON_PATH="t"
        if [ "$MAKE" == "" ]; then
            # Some build scripts work properly only with 
            # the GNU make, not the BSD make, and some of such 
            # build scripts read the environment variable MAKE.
            export MAKE="$S_TMP_1"
        fi
    else
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_MAKE_EXISTS_ON_PATH" == "t" ]; then
                #--------
                # On Linux the "make" is the same as the "gmake". The 
                S_TMP_2="`make --version | grep 'GNU ' `" 
                # has been tested to work with BSD make and GNU make 
                # on ("uname -a") 
                #
                #     Linux terminal01 4.4.126-48-default #1 SMP Sat Apr 7 05:22:50 UTC 2018 (f24992c) x86_64 x86_64 x86_64 GNU/Linux
                #
                # and 
                #
                #     FreeBSD capella.elkdata.ee 12.2-RELEASE-p7 FreeBSD 12.2-RELEASE-p7 GENERIC  amd64
                #
                #--------
                if [ "$S_TMP_2" != "" ]; then
                    SB_MAKE_IS_GMAKE="t"
                    if [ "$MAKE" == "" ]; then
                        export MAKE="$S_TMP_0"
                    fi
                fi
                #--------
            fi
        fi
    fi
    #--------
    if [ "$SB_MAKE_EXISTS_ON_PATH" == "f" ]; then
        if [ "$SB_GMAKE_EXISTS_ON_PATH" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "make" "12686cb2-effc-4ffd-8c23-e241d041a7e7"
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which pactl 2> /dev/null`"
    SB_PACTL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LPSTAT_EXISTS_ON_PATH="t"
        # Idea origin:
        # https://scarygliders.net/2012/04/06/get-audio-with-your-xrdpx11rdp-connections-lan-or-remote/
        # $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/
        #     third_party_documentation/Linux_and_BSD_administration/PulseAudio/
        #     2012_04_06_PulseAudio_TCP_module_setup_for_RDP_sound_t1.pdf
        alias mmmv_admin_pulseaudio_loadmodule_tcp_127_0_0_1="pactl load-module module-native-protocol-tcp auth-ip-acl=\"127.0.0.1\"; wait; sync; pactl list-modules | grep \"module-native-protocol-tcp\" "
        #--------------------
        if [ "$SB_AWK_EXISTS_ON_PATH" == "t" ]; then
            # TODO: Find out, how this awk/gawk part here works out on BSD.
            #       On linux the command "awk" is actually the GNU awk, which
            #       differs from the "awk" implementation on BSD.
            if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                # Currently tested only on Linux.
                alias mmmv_ui_mic2speakers_on="pactl load-module module-loopback latency_msec=1 ;"
                alias mmmv_ui_mic2speakers_off="pactl unload-module \$(pactl list short modules | awk '\$2 ==\"module-loopback\" { print \$1 }' - )"
            fi
        fi
    fi
fi
#--------------------
SB_LOCALECTL_EXISTS_ON_PATH="f"
if [ "`which localectl 2> /dev/null`" != "" ]; then
    SB_LOCALECTL_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    # According to 
    #     https://man.freebsd.org/cgi/man.cgi?query=localectl&sektion=1&manpath=Debian+8.1.0
    #     archival copy: https://archive.ph/p7aCa
    # Some program with the name of "localectl" does seem to 
    # exist on FreeBSD and it does seem to have
    # command-line options "list-x11-keymap-models", "list-x11-keymap-layouts",
    # "list-x11-keymap-variants", "list-x11-keymap-options".
    #
    # A related reference:
    #     https://web.archive.org/web/20230614124516/https://unix.stackexchange.com/questions/43976/list-all-valid-kbd-layouts-variants-and-toggle-options-to-use-with-setxkbmap
    #     another archival copy: https://archive.ph/QnvYZ
    #     ---------slightly--modified---semicitation----start--------------
    #         localectl list-x11-keymap-layouts
    #             gives layouts (~100 on modern systems)
    # 
    #         localectl list-x11-keymap-variants de 
    #             gives variants for this layout (or all 
    #             variants if no layout specified, 
    #             ~300 on modern systems)
    # 
    #         localectl list-x11-keymap-options | grep grp
    #             gives all layout switching options
    #     ---------slightly--modified---semicitation----end----------------
    #----------------------------------------------------------------------
    if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
            #--------------------
            alias mmmv_ui_display_keyboard_layouts_t1="printf \"\\n \`localectl list-x11-keymap-layouts | tr '\\n\\r' ' ' \` \n\n\""
            #--------------------
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------
SB_SETXKBMAP_EXISTS_ON_PATH="f"
if [ "`which setxkbmap 2> /dev/null`" != "" ]; then
    SB_SETXKBMAP_EXISTS_ON_PATH="t"
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_RESIZE_EXISTS_ON_PATH="f"
    if [ "`which resize 2> /dev/null`" != "" ]; then
        SB_RESIZE_EXISTS_ON_PATH="t"
        alias mmmv_ui_display_active_terminal_dimensions_in_characters_t1="nice -n 5 resize "
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "resize" "2226ee35-5abd-4965-98f3-e241d041a7e7"
    fi
fi
#--------------------
SB_SHRED_EXISTS_ON_PATH="f"
if [ "`which shred 2> /dev/null`" != "" ]; then
    SB_SHRED_EXISTS_ON_PATH="t"
    alias mmmv_fs_secure_erase_shred_1="nice -n 5 shred --iterations=1 --remove=wipe "
    alias mmmv_fs_secure_erase_shred_3="nice -n 5 shred --iterations=3 --remove=wipe "
    alias mmmv_fs_secure_erase_shred_5="nice -n 5 shred --iterations=5 --remove=wipe "
    alias mmmv_shred_t1="mmmv_polish_ABC_2_A_C_B_exec_t1 \"nice -n 2 shred --iterations=1 --remove=wipe \" \" ; wait ; sync \" " 
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "shred" "1c04adc5-7fcc-4d32-b813-e241d041a7e7"
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_SNAP_EXISTS_ON_PATH="f"
    if [ "`which snap 2> /dev/null`" != "" ]; then
        SB_SNAP_EXISTS_ON_PATH="t"
    # else
    #     # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #     #     "snap" "e3b6bba9-3377-4d2b-af33-e241d041a7e7"
    #     if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    #         echo "As of 2023 the snap is a Ubuntu parent company censored package collection tool."
    #         echo -e "\e[33mOn Debian the snap might be installed by \e[39m"
    #         echo -e "\e[33m    apt-get install snapd \e[39m# yes, not the "snap", but "snapd"."
    #         echo ""
    #     fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_SYSTEMCTL_EXISTS_ON_PATH="f"
    if [ "`which systemctl 2> /dev/null`" != "" ]; then
        SB_SYSTEMCTL_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
SB_UUENCODE_EXISTS_ON_PATH="f"
if [ "`which uuencode 2> /dev/null`" != "" ]; then
    SB_UUENCODE_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "uuencode" "154cbe62-c7bf-49db-9722-e241d041a7e7"
    S_TMP_0="`uname -a | grep -i -E '(Microsoft|Debian)' `" # might be Linux, but 
                                                            # might also be 
                                                            # GNU Mach Debian distribution.
    SB_DISPLAY_HINT="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DISPLAY_HINT="t"
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        SB_DISPLAY_HINT="t"
    fi
    if [ "$SB_DISPLAY_HINT" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo -e "In the case of Debian and Termux the \"\e[33muuencode\e[39m\""
            echo -e "\e[33mMIGHT be part of the package \"sharutils\". \e[39m"
            echo "GUID=='492550d1-e8f7-4f94-b43a-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------
SB_UUDECODE_EXISTS_ON_PATH="f"
if [ "`which uudecode 2> /dev/null`" != "" ]; then
    SB_UUDECODE_EXISTS_ON_PATH="t"
else
    if [ "$SB_UUENCODE_EXISTS_ON_PATH" == "t" ]; then
       func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
           "uudecode" "289a16a5-cf0f-4f46-a952-e241d041a7e7"
    fi
fi
#--------------------
SB_UUID_EXISTS_ON_PATH="f"
if [ "`which uuid 2> /dev/null`" != "" ]; then
    SB_UUID_EXISTS_ON_PATH="t"
else
   func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
       "uuid" "511f3ba5-dbe4-4824-9c52-e241d041a7e7"
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            # https://superuser.com/questions/621297/how-do-i-install-uuidgen
            # archival copy: https://archive.ph/S56pQ
            echo "On Debian based systems the \"uuid\" MIGHT be installed "
            echo -e "by installing a package named \"\e[33muuid-runtime\e[39m\"."
            echo "GUID=='1724e7b1-8615-428d-863a-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GAWK_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_PMAP_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ui_ls_RAM_consumption_of_a_process_by_PID_t1="func_alias_f1(){ local S_0=\"\$1\" ; ps -A | grep \"\$S_0\" ; pmap \`ps -A  | grep --max-count=1 \"\$S_0\" | gawk '{printf \"%s\", \$1}'\` | grep writable ; } ; func_alias_f1 "
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_FCCACHE_EXISTS_ON_PATH="f"
    if [ "`which fc-cache 2> /dev/null`" != "" ]; then
        SB_FCCACHE_EXISTS_ON_PATH="t"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            #--------
            # https://www.techrepublic.com/blog/linux-and-open-source/how-do-i-install-and-use-fonts-in-linux/
            # archival copy: https://archive.vn/UgphK
            alias mmmv_admin_refresh_fonts_cache_t1="nice -n 18 fc-cache -f -v "
            # should probably also make the 
            #
            #     ~/.fonts
            #
            # contents available to various applications.
            #--------
            # TODO: test it out on BSD so that 
            #       the alias could be defined on BSD.
            #       There's another reference to this alias in this 
            #       Bash file and the code region, where it resides,
            #       should also be updated after this alias has been
            #       made available on BSD.
            #--------
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "fc-cache" "30817975-e243-452b-9b12-e241d041a7e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_IPTABLES_EXISTS_ON_PATH="f"
    if [ "`which iptables 2> /dev/null`" != "" ]; then
        SB_IPTABLES_EXISTS_ON_PATH="t"
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "iptables" "4f4d6a51-6528-4e92-ac52-e241d041a7e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_UFW_EXISTS_ON_PATH="f"
    if [ "$SB_IPTABLES_EXISTS_ON_PATH" == "t" ]; then
        # https://launchpad.net/ufw
        # ufw is an iptables wrapper.
        # There MIGHT be some further documentation aobut the UFW at
        #     $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/
        #     third_party_documentation/Linux_and_BSD_administration/Linux_firewalls/UFW
        if [ "`which ufw 2> /dev/null`" != "" ]; then
            SB_UFW_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "ufw" "5a28d7b2-b666-467a-a332-e241d041a7e7"
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_GUFW_EXISTS_ON_PATH="f"
    if [ "$SB_UFW_EXISTS_ON_PATH" == "t" ]; then
        # gufw is an ufw wrapping GUI.
        if [ "`which gufw 2> /dev/null`" != "" ]; then
            SB_GUFW_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gufw" "31f06693-cd2e-4317-b552-e241d041a7e7"
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_AUTHBIND_EXISTS_ON_PATH="f"
    if [ "`which authbind 2> /dev/null`" != "" ]; then
        # As root:
        #     echo "WhatEver" >> /etc/authbind/byport/80
        #     chown FooUser      /etc/authbind/byport/80
        #     chmod 0700         /etc/authbind/byport/80
        #
        # As FooUser:
        #     authbind --deep /pat/to/web_server_startu_scirpt 
        #     # and the web server's own configuration the binding port is 80.
        #     # The web server will run at FooUser privileges.
        #
        # The authbind MIGHT be available from Linux/BSD 
        # distribution standard package collection.
        SB_AUTHBIND_EXISTS_ON_PATH="t"
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "iptables" "1b3ccd83-572f-44e9-9131-e241d041a7e7"
    fi
fi
#--------------------------------------------------------------------------
#alias mmmv_visudo="visudo -f /etc/sudoers.d/mmmv_sudoers_seadistus "
#--------------------------------------------------------------------------
SB_USERNAME_IS_root="f"  # domain: {"t","f"}
SB_USERNAME_IS_mmmv="f"  # domain: {"t","f"}

if [ "$S_WHOAMI" == "root" ]; then
    SB_USERNAME_IS_root="t"
else
    #----------------------------------------------------------------------
    if [ "$S_WHOAMI" == "mmmv" ]; then
        #------------------------------------------------------------------
        SB_USERNAME_IS_mmmv="t"
        #------------------------------------------------------------------
        if [ "$SB_CHECKBASHISMS_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_devel_checkbashisms_common_bashrc_main_bash="checkbashisms --posix $S_FP_DIR/common_bashrc_main.bash "
        fi
        #------------------------------------------------------------------
        Z_PATH="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_user_specific/mmmv:$Z_PATH"
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
if [ "$SQLITE_LIMIT_LENGTH" == "" ]; then
    # According to the 
    #     https://www.sqlite.org/c3ref/c_limit_attached.html#sqlitelimitlength
    # the 
    export SQLITE_LIMIT_LENGTH="4294967295" # number of bytes
    #export SQLITE_LIMIT_LENGTH="104294967295" # number of bytes
    # is, a citation: "The maximum size of any string or 
    # BLOB or table row, in bytes."
fi

#--------------------------------------------------------------------------
export MMMV_DEVEL_TOOLS_HOME="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_devel_tools/2015_01_22_mmmv_devel_tools_without_JumpGUID_and_IDE_integration_v_02_with_UpGUID_bugfix"
S_FP_0="$MMMV_DEVEL_TOOLS_HOME/src/api/mmmv_devel_tools_bashrc_extension.bash"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "734952cd-9f35-423c-9e51-e241d041a7e7"
Z_PATH="$Z_PATH:$PATH" # TODO: get rid of this hacky line after the 
                       # mmmv_devel_tools has been upgraded.
                       # The idea behind the hakcy line is that 
                       # the old mmmv_devel_tools modifies PATH, not Z_PATH,
                       # but at the end of this script the PATH="$Z_PATH".

#--------------------------------------------------------------------------
func_add_rust_applications_2_PATH(){
    # The tool for installing Rust:
    #
    #     https://rustup.rs/  
    #     https://github.com/rust-lang/rustup
    #
    # As of 2022_08_10 the rustup can be installed by executing:
    #
    #     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    #
    S_FP_0="$HOME/.cargo" # the folder for the Rust package system
    if [ -e "$S_FP_0" ]; then
        if [ -d "$S_FP_0" ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_FP_0" \
                "21772e34-28a8-488f-b151-e241d041a7e7" 
        fi
    else
        if [ -h "$S_FP_0" ]; then # broken symlink
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_0" "14391d91-c2bf-49d3-a741-e241d041a7e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
} # func_add_rust_applications_2_PATH
# The 
func_add_rust_applications_2_PATH
# must be called before the /mmmv/applications/declare_applications.bash
# is executed, because otherwise it is not possible to override
# some of the rust/cargo programs like the exa.
#
#     https://github.com/ogham/exa/archive/refs/tags/v0.10.1.tar.gz
#
# The Rust/cargo upstream solution was to add 
#
#     ". $HOME/.cargo/env"
#
# without the quotation marks, to the ~/.bashrc.
# That would be equivalent to 
#
#     source "$HOME/.cargo/env"
#
#--------------------------------------------------------------------------
# To save operating system userspace distribution creators
# from studying this huge ./common_bashrc_main.bash , 
# the userspace distribution specific parts 
# are placed to a separate, dedicated, file:
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/appliance_instance_specific_Bash_code/appliance_instance_specific_main.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# which optionally includes the 
#
#     /home/mmmv/applications/declare_applications.bash
#
S_FP_APPLIANCE_INSTANCE_SPECIFIC_MAIN_BASH="$S_FP_0" # optionally used later at an error message.

# The 
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_ruby_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# has to be included only after the application delcaration 
# Bash scripts have been included.

S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_python_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"


S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_alias_mmmv_image_viewer.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"

#--------------------------------------------------------------------------
S_FP_0="$HOME/mmff_$S_WHOAMI"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        alias mmmv_go_mmff="cd $S_FP_0"
    fi
fi
S_FP_1="$S_FP_0/m_local"
if [ -e $S_FP_1/bin ]; then
    if [ -d $S_FP_1/bin ]; then
        Z_PATH="$S_FP_1/bin:$Z_PATH"
    fi
fi
#--------
S_FP_0="$HOME/mmff/m_local"
if [ -e $S_FP_0/bin ]; then
    if [ -d $S_FP_0/bin ]; then
        Z_PATH="$S_FP_0/bin:$Z_PATH"
    fi
fi
S_FP_0="$HOME/m_local"
if [ -e $S_FP_0/bin ]; then
    if [ -d $S_FP_0/bin ]; then
        Z_PATH="$S_FP_0/bin:$Z_PATH"
    fi
fi
#--------------------------------------------------------------------------
FP_MMMV="$HOME/.mmmv"
FP_MMMV_BASHRC="$FP_MMMV/mmmv_bashrc"
FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC="$FP_MMMV/_vimrc_userspecific_subpart_that_will_be_overwritten_automatically.vim"
FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/_vimrc_userspecific_subpart_that_will_be_overwritten_automatically_template.vim"
FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH="$FP_MMMV_BASHRC/dynamic_symlinks_on_PATH"
SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="f"
#--------------------------------------------------------------------------
if [ ! -e "$FP_MMMV" ]; then
    mkdir -p $FP_MMMV
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV" "65d5a6b7-bddb-434d-8911-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi
#--------------------------------------------------------------------------
if [ ! -e "$FP_MMMV_BASHRC" ]; then
    mkdir -p $FP_MMMV_BASHRC 
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV_BASHRC" "6d2b8479-33d3-4798-b411-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi
#--------------------------------------------------------------------------
if [ -e "$FP_MMMV" ]; then
    if [ -d "$FP_MMMV" ]; then
        #------------------------------------------------------------------
        if [ ! -e "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC" ]; then
            cp "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC_TEMPLATE" \
                "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC"
            func_mmmv_wait_and_sync_t1
            chmod 0700 "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC"
            func_mmmv_wait_and_sync_t1
        fi
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC" \
            "375dc032-49ef-454f-aa11-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        #------------------------------------------------------------------
        if [ -e "$FP_MMMV_BASHRC" ]; then
            if [ -d "$FP_MMMV_BASHRC" ]; then
                #----------------------------------------------------------
                if [ ! -e "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                    mkdir -p $FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH 
                    func_mmmv_wait_and_sync_t1
                fi
                func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                    "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" \
                    "7a21ce84-8132-4154-8021-e241d041a7e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
                if [ -e "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                    if [ -d "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                        SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="t"
                    fi
                fi
                #----------------------------------------------------------
            fi
        fi
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS" == "t" ]; then
    Z_PATH="$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH:$Z_PATH"
fi
#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1(){
    local S_FP_LOCAL="$1"
    local S_FP_CENTRAL="$2"
    #-------------------
    local SB_OK_TO_CREATE_LINK="t"
    #-------------------
    # S_FP_CENTRAL file system checks
    if [ -h "$S_FP_CENTRAL" ]; then
        #echo "symbolic link, regardless of whether it is broken or not"
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a broken symlink."
                echo "GUID=='32393f34-754e-4565-8849-e241d041a7e7'"
                echo ""
            fi
        else
            if [ -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a symlink to a folder, but "
                    echo "it must be a file or a symlink to a file."
                    echo "GUID=='224932f2-cf17-4748-a659-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    else
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is missing."
                echo "GUID=='46d883a4-7fd0-4ab2-8a39-e241d041a7e7'"
                echo ""
            fi
        else
            if [ -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a folder, but it must be a file or a symlink to a file."
                    echo "GUID=='a91f3595-4aa0-4583-a5e9-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #-------------------
    # S_FP_LOCAL file system checks
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        if [ -h "$S_FP_LOCAL" ]; then
            if [ ! -e "$S_FP_LOCAL" ]; then
                rm -f $S_FP_LOCAL # deletes a broken symlink
            else
                # The symlink is not broken.
                SB_OK_TO_CREATE_LINK="f"
                if [ -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a symlink to a folder, but "
                        echo "it must be a file or a symlink to a file."
                        echo "GUID=='1c5bc530-5c77-419e-a0a9-e241d041a7e7'"
                        echo ""
                    fi
                fi
            fi # symlink_is_not_broken(S_FP_LOCAL)
        else # file or folder, not a symlink
            if [ -e "$S_FP_LOCAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a folder, but it must be "
                        echo "a file or a symlink to a file."
                        echo "GUID=='3144e781-3f22-456d-9e59-e241d041a7e7'"
                        echo ""
                    fi
                fi
            fi # exists(S_FP_LOCAL)
        fi # is_symlink(S_FP_LOCAL)
    fi # SB_OK_TO_CREATE_LINK === "t"
    #-------------------
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        ln -s $S_FP_CENTRAL $S_FP_LOCAL 
        func_mmmv_wait_and_sync_t1 
        if [ -h $S_FP_LOCAL ]; then
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a broken symlink to the "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "GUID=='e023f776-87ac-4e64-a419-e241d041a7e7'"
                    echo ""
                fi
            fi
        else
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is missing."
                    echo "GUID=='6313d948-6ce3-4178-b969-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    fi # SB_OK_TO_CREATE_LINK === "t"
} # func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1

#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1(){
    local S_FP_LOCAL="$1"
    local S_FP_CENTRAL="$2"
    #-------------------
    local SB_OK_TO_CREATE_LINK="t"
    #-------------------
    # S_FP_CENTRAL file system checks
    if [ -h "$S_FP_CENTRAL" ]; then
        #echo "symbolic link, regardless of whether it is broken or not"
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a broken symlink."
                echo "GUID=='b2fd14af-a017-4018-8949-e241d041a7e7'"
                echo ""
            fi
        else
            if [ ! -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a symlink to a file, but "
                    echo "it must be a folder or a symlink to a folder."
                    echo "GUID=='a5ad776e-67ca-4347-8518-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    else
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is missing."
                echo "GUID=='28b2b4c5-0dfb-4189-bf58-e241d041a7e7'"
                echo ""
            fi
        else
            if [ ! -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a file, but it must be a folder or a symlink to a folder."
                    echo "GUID=='169518f1-6b10-42f4-9d58-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #-------------------
    # S_FP_LOCAL file system checks
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        if [ -h "$S_FP_LOCAL" ]; then
            if [ ! -e "$S_FP_LOCAL" ]; then
                rm -f $S_FP_LOCAL # deletes a broken symlink
            else
                # The symlink is not broken.
                SB_OK_TO_CREATE_LINK="f"
                if [ ! -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a symlink to a file, but "
                        echo "it must be a folder or a symlink to a folder."
                        echo "GUID=='52d3ef71-d392-4bb2-a518-e241d041a7e7'"
                        echo ""
                    fi
                fi
            fi # symlink_is_not_broken(S_FP_LOCAL)
        else # file or folder, not a symlink
            if [ -e "$S_FP_LOCAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ ! -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a file, but it must be "
                        echo "a folder or a symlink to a folder."
                        echo "GUID=='7d2b9aec-800b-4490-9c38-e241d041a7e7'"
                        echo ""
                    fi
                fi
            fi # exists(S_FP_LOCAL)
        fi # is_symlink(S_FP_LOCAL)
    fi # SB_OK_TO_CREATE_LINK === "t"
    #-------------------
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        ln -s $S_FP_CENTRAL $S_FP_LOCAL 
        func_mmmv_wait_and_sync_t1 
        if [ -h $S_FP_LOCAL ]; then
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a broken symlink to the "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "GUID=='c921dff7-1a34-475f-ac58-e241d041a7e7'"
                    echo ""
                fi
            fi
        else
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is missing."
                    echo "GUID=='4ed0a074-be4a-4d63-9658-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    fi # SB_OK_TO_CREATE_LINK === "t"
} # func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1

#--------------------------------------------------------------------------
S_FP_RCFILE_USERSPECIFIC="$HOME/.vimrc"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_vimrc"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 

S_FP_RCFILE_USERSPECIFIC="$HOME/.octaverc"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_octaverc"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 

S_FP_RCFILE_USERSPECIFIC="$HOME/.Xdefaults"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_Xdefaults"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 
#--------------------------------------------------------------------------
S_FP_FONTS_HOME="$HOME/.fonts"
S_FP_FONTS_CENTRAL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_fonts"
#--------
SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT="f"
if [ -e "$S_FP_FONTS_HOME" ]; then
    if [ -d "$S_FP_FONTS_HOME" ]; then
        SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT="t"
    else
        # Outputs an error message.
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_FONTS_HOME" "5a9af3f5-39e5-4857-8a50-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#--------
func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1 \
  "$S_FP_FONTS_HOME" \
  "$S_FP_FONTS_CENTRAL" 
#--------
if [ "$SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT" == "f" ]; then
    if [ -e "$S_FP_FONTS_HOME" ]; then
        if [ -d "$S_FP_FONTS_HOME" ]; then
            if [ "$SB_FCCACHE_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                    # https://www.techrepublic.com/blog/linux-and-open-source/how-do-i-install-and-use-fonts-in-linux/
                    # archival copy: https://archive.vn/UgphK
                    nice -n 15 fc-cache -f -v 
                    # Related Bash alias: mmmv_admin_refresh_fonts_cache_t1
                fi
            fi
        else
            # Outputs an error message.
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_FONTS_HOME" "45aa9303-9f58-452e-af50-e241d041a7e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
fi
#--------------------------------------------------------------------------
FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS="$HOME/.vim/manually_installed_plugins"
if [ ! -e "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" ]; then
    if [ -h "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "The"
            echo "    $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS"
            echo ""
            echo "is a broken symlink."
            echo "GUID=='2cf06185-22c6-427c-9f18-e241d041a7e7'"
            echo ""
        fi
    else
        mkdir -p $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS
        func_mmmv_wait_and_sync_t1
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
            "f47f4ac6-beda-4b2e-b320-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
else
    # The next line gives an error message, if it is a file.
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
        "a5c4e2b5-0ce7-4299-8030-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi

#--------------------------------------------------------------------------
# For security reasons each operating system user installs 
# its own set of Ruby gems, python packages, etc. To avoid
# re-downloading everything and to mitigate the effect of network outages,
# the Ruby gems, python packages, NodeJS packages, etc.
# should be installed through a local proxy server that caches
# the downloaded files.
#
#--------------------------------------------------------------------------
S_TMP_LIST_OF_GEMS_00=" rake rdoc sqlite3 rspec \
    net dbf json hdf5 net-ssh rdf mail \
    graphviz gnuplot bundler test-unit "

S_TMP_LIST_OF_GEMS_01=" rethinkdb couchdb "

S_TMP_LIST_OF_GEMS_02=" micro_kanren "
    # miniKanren is a form of logic programming.
    # http://minikanren.org/

S_TMP_LIST_OF_GEMS_03=" bitmessage "

S_TMP_LIST_OF_GEMS_04=" solargraph "
    # The solagraph.org is about a Ruby "lanuage server".
    # The idea is that some basic support for a programming
    # language can be added to multiple IDEs at once by
    # having those IDEs communicate with a "language server"
    # by using a standardized "language server protocol". 
    #
    #     https://microsoft.github.io/language-server-protocol/
    #
    # The "language servers" handle the project specific source indexing 
    # and delegate as much as possible to the original compiler/interpreter 
    # of the programming language. List of "language server" implementations:
    #
    #     https://langserver.org/
    #     https://microsoft.github.io/language-server-protocol/implementors/servers/
    #
    # The phrase "language server" is in quotation marks here because
    # a more appropriate name for those software components is project_analysis_server.
    # As of 2020 a Vim plugin that can use the various project analysis servers is
    #
    #     https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
    #     https://github.com/autozimu/LanguageClient-neovim/
    #
    # As of 2020 the use of that Vim plugin assumes that the ~/.vimrc 
    # contains code that is similar to the following code:
    #::::::::citation:::start:::::::::::::::::::::::::
    # :"------------------------------------------------------------------------ 
    # :set runtimepath+=~/.vim/k2sitsi_paigaldatud_pluginad/LanguageClient-neovim
    # :
    # :" https://medium.com/usevim/vim-101-set-hidden-f78800142855
    # :set hidden
    # :let g:LanguageClient_serverCommands = {
    #     \ 'ruby': ['/home/ts2/m_local/bin_p/Ruby/paigaldatult/v_x_x_x_kasutuses/gem_home/bin/solargraph', 'stdio'],
    #     \ }
    # :nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    # :nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    # :nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    # 
    # :" Language servers to study later:
    # :"    \ 'python': ['/usr/local/bin/pyls'],
    # :"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    # :"   \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    # :"------------------------------------------------------------------------ 
    #::::::::citation:::end:::::::::::::::::::::::::::
    #
   
S_TMP_0="nice -n 5 gem install "
alias mmmv_admin_install_Ruby_gem_set_00_basic_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_00"
alias mmmv_admin_install_Ruby_gem_set_01_additional_database_engines="$S_TMP_0 $S_TMP_LIST_OF_GEMS_01"
alias mmmv_admin_install_Ruby_gem_set_02_scientific_computing="$S_TMP_0 $S_TMP_LIST_OF_GEMS_02"
alias mmmv_admin_install_Ruby_gem_set_03_communication_applications="$S_TMP_0 $S_TMP_LIST_OF_GEMS_03"
alias mmmv_admin_install_Ruby_gem_set_04_development_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_04"
alias mmmv_admin_install_Ruby_gem_all_mmmv_gem_sets=" \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_00 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_01 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_02 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_03 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_04 "

#--------------------------------------------------------------------------
# The Squid web cache server 
#
#     http://www.squid-cache.org/
#
# is usually installed from the standard package collection, because
# it is a legacy software that requires root privileges to run.
# The historic excuse for the root privilege requirement had 
# something to do with attaching to network interfaces, etc., but
# in practice the custom compiled version that is run by an ordinary
# user also works. By default the cached files might be stored at 
#
#     /var/spool/squid3
#
# A sample line from   /etc/squid3/squid.conf
# or <Squid installation home>/etc/squid.conf
#
#     #--------sample--config--excerpt--start--------------------
#     # Squid proxy home page: http://www.squid-cache.org/
#     # The command
#     #  
#     #     squid -k parse  
#     #  
#     # checks the syntax of this configuration file.  
#     # A custom-compiled squid process can be started by
#     #
#     #     cd <squid installation home>/sbin
#     #     # squid -z # mandatory at first run
#     #                # creates cache folder structure.
#     #     nice -n 13 squid
#     #
#     # The Linux system package collection version 
#     # of the Squid proxy server can be started/restarted by
#     #  
#     #     service squid3 restart  
#     #
#     # Just a useful Linux command: service --status-all
#     #
#     # The file path must not be a symlink. Format:
#     # http://www.squid-cache.org/Doc/config/cache_dir/
#     #
#     #     cache_dir diskd <folder path> <storage size in MB>  
#     #                     <# of subfolders at level 1> 
#     #                     <# of subfolders at level 2>
#     #
#     #cache_dir ufs /root/large_files/squid_salvestuspiirkond 100 16 256
#     cache_dir diskd /opt/hdd_01_for_large_files/large_files/some_username/squid_salvestuspiirkond  3000 32 256
#     #
#     # http://www.squid-cache.org/Doc/config/dns_v4_first/
#     # dns_v4_first off
#     dns_v4_first on
#     
#     maximum_object_size 200 MB
#     
#     #--------sample--config--excerpt--end---------------------
#
#--------------------------------------------------------------------------

export MMMV_PROXY_HOST="127.0.0.1" # localhost
# Squid defalt port: 3128
#export MMMV_PROXY_PORT="8500" # local tinyproxy
export MMMV_PROXY_PORT="8502" # local squid

S_TMP_0="http://$MMMV_PROXY_HOST" # space not allowed at the end
S_TMP_1=":$MMMV_PROXY_PORT"       # space not allowed at the end
S_TMP_2="/"
export MMMV_PROXY_URL="$S_TMP_0$S_TMP_1$S_TMP_2"

MMMV_SB_PROXY_SERVER_RUNS="f" # "t" for "true", "f" for "false"
#if [ "`ps -A | grep squid3 `" != "" ]; then
#if [ "`ps -A | grep tinyproxy `" != "" ]; then
if [ "`ps -A | grep squid `" != "" ]; then
    MMMV_SB_PROXY_SERVER_RUNS="t"
fi

#--------------------------------------------------------------------------

if [ "$MMMV_SB_PROXY_SERVER_RUNS" == "t" ]; then
    #--------
    S_TMP_0="wget -e use_proxy=yes "
    S_TMP_1=" -e http_proxy=$MMMV_PROXY_HOST" # space not allowed at the end
    S_TMP_2=":$MMMV_PROXY_PORT -e https_proxy=$MMMV_PROXY_HOST" # space not allowed at the end
    S_TMP_3=":$MMMV_PROXY_PORT -e ftp_proxy=$MMMV_PROXY_HOST" # space not allowed at the end
    S_TMP_4=":$MMMV_PROXY_PORT "
    MMMV_WGET_THROUGH_PROXY="$S_TMP_0$S_TMP_1$S_TMP_2$S_TMP_3$S_TMP_4 "
    alias mmmv_wget_proxy="nice -n 12 $MMMV_WGET_THROUGH_PROXY "
    #--------
    S_TMP_0="nice -n 5 gem install --http-proxy $MMMV_PROXY_URL "
    alias mmmv_admin_install_Ruby_gem_proxy="$S_TMP_0"
    alias mmmv_admin_install_Ruby_gem_set_00_basic_tools_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_00"
    alias mmmv_admin_install_Ruby_gem_set_01_additional_database_engines_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_01"
    alias mmmv_admin_install_Ruby_gem_set_02_scientific_computing_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_02"
    alias mmmv_admin_install_Ruby_gem_set_03_communication_applications_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_03"
    alias mmmv_admin_install_Ruby_gem_set_04_development_tools_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_04"
    alias mmmv_admin_install_Ruby_gem_all_mmmv_gem_sets_proxy="$S_TMP_0 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_00 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_01 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_02 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_03 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_04 "
    #--------
    # The Python pip and pip3 installation commands 
    # are implemented as bash scripts at 
    # $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin
    #--------
fi

#--------------------------------------------------------------------------
if [ "$SB_WGET_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_wget_t1"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "1e8120f2-bc08-474b-9710-e241d041a7e7"
fi

S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_create_redirection_HTML_t1"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "9d536124-dc01-4eb6-9e20-e241d041a7e7"

if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_find_t1"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "5bf03785-093f-4425-bd40-e241d041a7e7"
fi
#--------------------------------------------------------------------------
S_TMP_0="`echo $LANG | grep UTF-8 `"
if [ "$S_TMP_0" == "" ]; then
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo "The environment variable "
        echo ""
        echo "    LANG==\"$LANG\""
        echo ""
        echo "does not have a value with the required suffix of \"UTF-8\"."
        echo "Some of the possible accepted values are:"
        echo "\"en_GB.UTF-8\", \"en_US.UTF-8\", \"C.UTF-8\"."
        echo "GUID=='4ee2c424-14f9-4ae9-b617-e241d041a7e7'"
        echo ""
        # The UTF-8 locale is required by the Mosh .
        # https://mosh.org/
    fi
fi

#--------------------------------------------------------------------------
if [ "`which sshfs 2> /dev/null`" != "" ]; then
    export S_MMMV_HINT_SSHFS_T1="SSH connection failure does guarantee auto-unmounting. 
For reliability the unmount command must be always run before the mount command 

Unmount command for non-root users:
    fusermount -u <full path to the mounting point at the ssh client side>

Mount command for non-root users:
    nice -n 2 sshfs -oport=<ssh server port> username@domain.com:<full path to the mounting point folder at the ssh server side> <full path to the mounting point folder at the local machine>"
    #----
else
    S_TMP_0="The sshfs was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='458587bd-9c75-4d3b-ad57-e241d041a7e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
if [ "`which fusermount 2> /dev/null`" == "" ]; then
    # The fusermount is for unmounting data carriers 
    # that are mounted with the sshfs.
    S_TMP_0="The fusermount was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='41c069f1-e868-4a50-ac37-e241d041a7e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
alias mmmv_hint_sshfs_t1="echo \"\"; \\
    echo \"\$S_MMMV_HINT_SSHFS_T1\"; \\
    echo \"\" ;"

if [ -e "$HOME/.ssh" ]; then
    # The idea is that sometimes it is comfortable to just do 
    # "chmod 0755 /home/mmmv", but that may introduce a security flaw 
    # in terms of the readability of the ~/.ssh . The 
    nice -n 19 chmod       0700 "$HOME/.ssh"
    nice -n 19 chmod -f -R 0600 "$HOME/.ssh/*"
    func_mmmv_wait_and_sync_t1 
    # tries to mitigate that.
fi

#--------------------------------------------------------------------------

#if [ "$MMMV_SB_PROXY_SERVER_RUNS" == "t" ]; then

#fi

#--------------------------------------------------------------------------

func_general_Linux_userspace_specific_declarations(){
    alias mmmv_ls_K="nice -n 2 ls -l --block-size=K "
    alias mmmv_ls_M="nice -n 2 ls -l --block-size=M "
    alias mmmv_ls_G="nice -n 2 ls -l --block-size=G "
    alias mmmv_lssize_recursive_t1_Linux="nice -n 5 du  --human-readable --summarize ./ "
    alias mmmv_pid2username_t1="nice -n 5 ps -o user= -p " # PID id est operating system process ID, comes here
    alias mmmv_cp_cow_t1="nice -n 7 cp --reflink=auto "
    #----------------------------------------------------------------------
    if [ "$SB_NETSTAT_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ls_ports_Linux_t1="nice -n 17 netstat -ltnp "
    fi
    #----------------------------------------------------------------------
    if [ "$SB_SERVICE_EXISTS_ON_PATH" == "t" ]; then
        # According to 
        #
        #     https://linuxhint.com/disable_unnecessary_services_debian_linux/
        #     archival copy: 
        #
        # the way to disable a service on Debian Linux is:
        #
        #     systemctl disable daemonname
        #
        # TODO: for some reason the control flow never reaches this line.
        #       Try to fix that some day.
        alias mmmv_ls_daemons_Linux_service_t1="nice -n 4 service --status-all  "
    fi
    #--------------------
    if [ "$SB_SYSTEMCTL_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ls_daemons_Linux_systemctl_t2="nice -n 4 systemctl list-units --type=service "
    fi
    #----------------------------------------------------------------------
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_WC_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_filecount_t1="find . -type f | wc -l "
                alias mmmv_ls_dircount_t1="find . -type d | grep -E ^\.\/ | wc -l "
            fi
            if [ "$SB_XARGS_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_K_recursive="nice -n 17 find . -name '*' -print0 |\
                    xargs -0 ls -l --block-size=K -d | grep -E ^[-] "
                alias mmmv_ls_M_recursive="nice -n 17 find . -name '*' -print0 |\
                    xargs -0 ls -l --block-size=M -d | grep -E ^[-] "
                alias mmmv_ls_G_recursive="nice -n 17 find . -name '*' -print0 |\
                    xargs -0 ls -l --block-size=G -d | grep -E ^[-] "
            fi
        fi
        if [ "$SB_USERNAME_IS_root" == "t" ]; then
            if [ "$SB_HDDTEMP_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_DF_EXISTS_ON_PATH" == "t" ]; then
                    if [ "`df | grep mmcblk0p1`" != "" ]; then
                        alias mmmv_hddtemp_mmcblk0p1="hddtemp /dev/mmcblk0p1"
                    fi
                    #--------
                    if [ "`df | grep sda1`" != "" ]; then
                        alias mmmv_hddtemp_sda1="hddtemp /dev/sda1"
                    fi
                    if [ "`df | grep sda2`" != "" ]; then
                        alias mmmv_hddtemp_sda2="hddtemp /dev/sda2"
                    fi
                    if [ "`df | grep sda3`" != "" ]; then
                        alias mmmv_hddtemp_sda3="hddtemp /dev/sda3"
                    fi
                    #--------
                    if [ "`df | grep sdb1`" != "" ]; then
                        alias mmmv_hddtemp_sdb1="hddtemp /dev/sdb1"
                    fi
                    if [ "`df | grep sdb2`" != "" ]; then
                        alias mmmv_hddtemp_sdb2="hddtemp /dev/sdb2"
                    fi
                    if [ "`df | grep sdb3`" != "" ]; then
                        alias mmmv_hddtemp_sdb3="hddtemp /dev/sdb3"
                    fi
                    #--------
                    if [ "`df | grep sdc1`" != "" ]; then
                        alias mmmv_hddtemp_sdc1="hddtemp /dev/sdc1"
                    fi
                    if [ "`df | grep sdc2`" != "" ]; then
                        alias mmmv_hddtemp_sdc2="hddtemp /dev/sdc2"
                    fi
                    if [ "`df | grep sdc3`" != "" ]; then
                        alias mmmv_hddtemp_sdc3="hddtemp /dev/sdc3"
                    fi
                    #--------
                    if [ "`df | grep sdd1`" != "" ]; then
                        alias mmmv_hddtemp_sdd1="hddtemp /dev/sdd1"
                    fi
                    if [ "`df | grep sdd2`" != "" ]; then
                        alias mmmv_hddtemp_sdd2="hddtemp /dev/sdd2"
                    fi
                    if [ "`df | grep sdd3`" != "" ]; then
                        alias mmmv_hddtemp_sdd3="hddtemp /dev/sdd3"
                    fi
                    #--------
                    if [ "`df | grep sde1`" != "" ]; then
                        alias mmmv_hddtemp_sde1="hddtemp /dev/sde1"
                    fi
                    if [ "`df | grep sde2`" != "" ]; then
                        alias mmmv_hddtemp_sde2="hddtemp /dev/sde2"
                    fi
                    if [ "`df | grep sde3`" != "" ]; then
                        alias mmmv_hddtemp_sde3="hddtemp /dev/sde3"
                    fi
                    #--------
                fi
            fi
        else
            func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
                "$SB_USERNAME_IS_root" \
                "02e5cfaf-3dee-4ef5-8830-e241d041a7e7"
        fi # whoami === root
    fi
    #----------------------------------------------------------------------
    S_TMP_2="/snap"
    if [ -e $S_TMP_2 ]; then
        if [ -d $S_TMP_2 ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_TMP_2" "69329db5-6e5d-4419-ba2f-e241d041a7e7" 
            # The "snaps" are Ubuntu/Canonical version of 
            # "universal" Linux packages
            #
            #     https:/$S_TMP_2craft.io/
            #
            # that can be installed as root like
            #
            #     snap install --classic anbox-installer ; sync ; wait ; anbox-installer
            #
        else
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_2" "a63ff68d-245a-470b-a86f-e241d041a7e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
    #----------------------------------------------------------------------
} # func_general_Linux_userspace_specific_declarations

#--------------------------------------------------------------------------

func_general_BSD_userspace_specific_declarations(){
    #---------
    alias mmmv_ls_BKMG="nice -n 2 ls -lh "
    alias mmmv_lssize_recursive_t1_BSD="nice -n 5 du -sh ./ "
    #---------
    if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_WC_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_filecount_t1="find . -type f | wc -l "
                alias mmmv_ls_dircount_t1="find . -type d | grep -E ^\.\/ | wc -l "
            fi
            if [ "$SB_XARGS_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_BKMG_recursive="nice -n 17 find . -name '*' \
                    -print0 | xargs -0 ls -lhd | grep -E ^[-] "
            fi
        fi
    fi
    #---------
    if [ "$SB_SYSCTL_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_2="sysctl hw.model hw.machine hw.ncpu"
        alias mmmv_cpuinfo_BSD_t1="$S_TMP_2"
        # The 
        alias mmmv_CPU_info_BSD_t1="$S_TMP_2" 
        # is a duplicate to have something, wehre 
        # the CPU is written with capital letters.
    fi
    #---------
} # func_general_BSD_userspace_specific_declarations

#--------------------------------------------------------------------------

func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations(){
    #----------------------------------------------------------------------
    SB_POWERSHELL_EXE_EXISTS_ON_PATH="f"
    if [ "`which powershell.exe 2> /dev/null`" != "" ]; then
        SB_POWERSHELL_EXE_EXISTS_ON_PATH="t"
    else
       func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
           "powershell.exe" "361dea55-c621-4924-a52f-e241d041a7e7"
    fi
    #--------------------
    SB_CLIP_EXE_EXISTS_ON_PATH="f"
    if [ "`which clip.exe 2> /dev/null`" != "" ]; then
        SB_CLIP_EXE_EXISTS_ON_PATH="t"
    # else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "clip.exe" "a2721ea4-6ec0-474f-8c3f-e241d041a7e7"
    fi
    #----------------------------------------------------------------------
    S_FP_TASKLIST_EXE="/mnt/c/Windows/System32/tasklist.exe"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TASKLIST_EXE" "2d4e6de2-20e4-4bc4-994f-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="vcxsrv.exe"
        S_TMP_1="`$S_FP_TASKLIST_EXE | grep \"$S_TMP_0\" `"
        if [ "$S_TMP_1" == "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                if [ "$USER" != "mmmv" ]; then
                    echo "It might be that currently there are no X11 "
                    echo "implementations running, because the list of "
                    echo "Windows processes does not seem to include the"
                    echo ""
                    echo "    $S_TMP_0"
                    echo ""
                    echo "which is related to VcXsrv, which  "
                    echo "MIGHT be downloadable from "
                    echo ""
                    echo "    https://sourceforge.net/projects/vcxsrv/"
                    echo ""
                    echo "GUID=='14e29ae5-cb14-430b-8337-e241d041a7e7'"
                else
                    echo ""
                    echo "X11 not available." # as probabilistically expected, so 
                    # no long distracting texts needed.
                    echo "GUID=='21e29d23-5f67-4cd3-b647-e241d041a7e7'"
                fi
                echo ""
            fi
        fi
        #------------------------------------------------------------------
        # One way, how it MIGHT be possible to run X11 applications on the 
        # WSL (Windows Subsystem for Linux) Debian distribution is:
        #
        #     # On the Windows side install and start the VcXsrv 
        #     # that MIGHT be downloadable from 
        #     #     https://sourceforge.net/projects/vcxsrv/
        #     # or it MIGHT be found from somewhere at 
        #     # /home/mmmv/mmmv_userspace_distro_t1/attic
        #
        #     # On the Linux side as root user:
        #     apt-get install x11-apps
        #     apt-get install xeyes
        #
        #     # On the Linux side as plain user:
        #     # Restart a Linux Bash session that declares 
        #     #
        #     #     export DISPLAY=:0 
        #     #
        #     # somewhere at the ~/.bashrc or its sub-parts 
        #     # and then execute 
        #     xeyes # for testing, whether X11 applications can be run.
        #
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
    local S_FP_BASHFILE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific/appliance_instance_specific_Bash_code/autogenerated_by_adduser_cmd/Windows_10_WSL_Debian_v_4_4_0_autogenerated_bashrc.bash"
    local SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # domain: {"","t","f"}
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_BASHFILE" \
        "e2be937a-0781-44e6-a3af-e241d041a7e7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    alias dmesg="sudo /bin/dmesg "
    #alias hddtemp="sudo /usr/sbin/hddtemp "
    #----------------------------------------------------------------------
    if [ "$SB_USERNAME_IS_root" == "t" ]; then
        # WSL specific way to mount the DVD/CDRW drive.
        alias mmmv_admin_mount_DVD_t1="mount -t drvfs D: /mnt/d "
    else
        func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
            "$SB_USERNAME_IS_root" \
            "1f0d7a93-d986-4144-943f-e241d041a7e7"
    fi
    #----------------------------------------------------------------------
} # func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations

#--------------------------------------------------------------------------

func_FreeBSD_userspace_specific_declarations(){
    #----------------------------------------------------------------------
    local SB_ABSENCE_DETECTED="f" # domain: {"f","t"}
    #--------------------
    if [ "$SB_ATACONTROL_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_AWK_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_DMESG_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_FSTYP_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_GLABEL_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_GPART_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_GREP_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_HEAD_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_MOUNT_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_PRINTF_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_SH_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_SORT_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_STRINGS_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_SWAPINFO_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_SYSCTL_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_TR_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_ABSENCE_DETECTED" == "f" ]; then
        local S_FP_LSBLK_V2021_07_11_HOME="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/FreeBSD/lsblk_for_FreeBSD/lsblk_for_FreeBSD_by_Slawomir_Wojciech_Wojtczak_and_minor_contributors/2021_07_11_downloaded"
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_FP_LSBLK_V2021_07_11_HOME" \
            "3205e53a-5aa5-49a1-953f-e241d041a7e7" 
    else
        if [ "$SB_ABSENCE_DETECTED" != "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe code in this function is flawed.\e[39m"
                echo "SB_ABSENCE_DETECTED==\"$SB_ABSENCE_DETECTED\"."
                echo "GUID=='444e6abb-4ba4-45b2-8037-e241d041a7e7'"
                echo ""
            fi
        fi
    fi
    #----------------------------------------------------------------------
} # func_FreeBSD_userspace_specific_declarations
#--------------------------------------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX" "SB_OPERATINGSYSTEM_LINUX" \
    "5274f5da-ab42-4abf-af4f-e241d041a7e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_WSL" "SB_OPERATINGSYSTEM_LINUX_WSL" \
    "1e2b9164-ea07-492e-801f-e241d041a7e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID" "SB_OPERATINGSYSTEM_LINUX_ANDROID" \
    "3a5be3e7-4f05-4546-823f-e241d041a7e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" "SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" \
    "bbd98302-3b13-4dbc-941f-e241d041a7e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD" "SB_OPERATINGSYSTEM_BSD" \
    "7398f6ca-16d9-4737-bf3e-e241d041a7e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD_FREEBSD" "SB_OPERATINGSYSTEM_BSD_FREEBSD" \
    "4e323703-eec6-478d-a04e-e241d041a7e7"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='3c992047-08d4-43e9-bd37-e241d041a7e7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='4850cc41-22cd-461c-8326-e241d041a7e7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='8c36fc7d-21b9-4db7-8e46-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='32c699c1-c806-412c-aa16-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_BSD_FREEBSD" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='225747a4-ff56-4655-9916-e241d041a7e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    #----------------------------------------------------------------------
    func_general_Linux_userspace_specific_declarations
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
            # The formatted version of the 
            alias mmmv_admin_create_symlink_to_cupspdf_t1="S_FP_LINK=\"\$HOME/CUPS_PDF\" ; S_FP_CUPSPDF_OUTPUT_DIR_0=\"/var/spool/cups-pdf/ANONYMOUS\" ; S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_0\" ; S_FP_CUPSPDF_OUTPUT_DIR_1=\"/var/spool/cups-pdf/\`whoami\`\" ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ]; then S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ; fi ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -d \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"Something with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='8292254a-aafb-44bb-a636-e241d041a7e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"A broken symlink with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='2d404b71-7aaa-41cb-8256-e241d041a7e7'\" ; echo \"\" ; else ln -s \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" \"\$S_FP_LINK\" ; sync; wait; sync ;  if [ ! -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo -e \"\e[31mFailed to create symlink \e[39m\" ; echo \"    \$S_FP_LINK\" ; echo \"    -->\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"GUID=='2ff56e55-0327-4a27-b916-e241d041a7e7'\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; if [ -h \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then echo \"is a symlink to a file, but a folder is expected.\" ; else echo \"is a file, but a folder is expected.\" ; fi ; echo \"GUID=='134f38fe-7ed4-47d5-bf45-e241d041a7e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\e[31mFolder is missing. \e[39m\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"It MIGHT be that the cups-pdf has not been installed.\" ; echo \"GUID=='468ef564-4390-47e8-8c45-e241d041a7e7'\" ; echo \"\" ; fi ;"
            # except the GUIDs, is:
            #     S_FP_LINK="$HOME/CUPS_PDF" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_0="/var/spool/cups-pdf/ANONYMOUS" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_X="$S_FP_CUPSPDF_OUTPUT_DIR_0" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_1="/var/spool/cups-pdf/`whoami`" ;
            #     if [ -e "$S_FP_CUPSPDF_OUTPUT_DIR_1" ]; then 
            #         S_FP_CUPSPDF_OUTPUT_DIR_X="$S_FP_CUPSPDF_OUTPUT_DIR_1" ;
            #     fi ;
            #     if [ -e "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then 
            #         if [ -d "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then 
            #             if [ -e "$S_FP_LINK" ]; then
            #                 echo "" ;
            #                 echo "Something with the path of " ;
            #                 echo "    $S_FP_LINK" ;
            #                 echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                 echo "GUID=='da92aba6-5a6d-494f-ae35-e241d041a7e7'" ;
            #                 echo "" ;
            #             else
            #                 if [ -h "$S_FP_LINK" ]; then
            #                     echo "" ;
            #                     echo "A broken symlink with the path of " ;
            #                     echo "    $S_FP_LINK" ;
            #                     echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                     echo "GUID=='f46dbaf3-b3a4-4104-bd75-e241d041a7e7'" ;
            #                     echo "" ;
            #                 else
            #                     ln -s "$S_FP_CUPSPDF_OUTPUT_DIR_X" "$S_FP_LINK" ;
            #                     sync; wait; sync ;  
            #                     if [ ! -e "$S_FP_LINK" ]; then 
            #                         echo "" ;
            #                         echo -e "\e[31mFailed to create symlink \e[39m" ;
            #                         echo "    $S_FP_LINK" ;
            #                         echo "    -->" ;
            #                         echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #                         echo "GUID=='0a49f9e6-e384-4d9e-bf25-e241d041a7e7'" ;
            #                         echo "" ;
            #                     fi ;
            #                 fi ;
            #             fi ;
            #         else 
            #             echo "" ;
            #             echo "The " ;
            #             echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #             if [ -h "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then 
            #                 echo "is a symlink to a file, but a folder is expected." ;
            #             else 
            #                 echo "is a file, but a folder is expected." ;
            #             fi ;
            #             echo "GUID=='64bcdf04-9c77-457c-8465-e241d041a7e7'" ;
            #             echo "" ;
            #         fi ;
            #     else 
            #         echo "" ;
            #         echo -e "\e[31mFolder is missing. \e[39m" ;
            #         echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #         echo "It MIGHT be that the cups-pdf has not been installed." ;
            #         echo "GUID=='4143d762-2b0d-4570-a715-e241d041a7e7'" ;
            #         echo "" ;
            #     fi ;
        fi
    fi
    #----------------------------------------------------------------------
else
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
        func_general_BSD_userspace_specific_declarations
        if [ "$SB_OPERATINGSYSTEM_BSD_FREEBSD" == "t" ]; then
            func_FreeBSD_userspace_specific_declarations
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='1dffc001-ab9d-4894-a524-e241d041a7e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_TEMPLATES="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates"
func_mmmv_declare_template_creation_alias_t1(){ 
    local S_ALIAS_NAME="$1" 
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_FN_NEW="$3"                  # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$4" 
    local SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="$5" # domain: {"","t","f"}
                                                     # default: "" -> "t"
    #----------------------------------------------------------------------
    local S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_TEMPLATES/$S_FN_TEMPLATE"
    local S_FP_NEW="\$PWD/$S_FN_NEW"
    #--------------------
    local S_ERR_MSG_SUBPART_01=""
    if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
        S_GUID_CANDIDATE_OPTIONAL="a90fe384-51b7-45f0-9c3e-e241d041a7e7"
    else
        #S_ERR_MSG_SUBPART_01="echo \"S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'\" ; "
        S_ERR_MSG_SUBPART_01="S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'"
    fi
    #--------------------
    if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" == "" ]; then
        SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
    else
        if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" != "t" ]; then
            if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" != "f" ]; then
                SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "A mmmv_userspace_distro_t1 related "
                    echo -e "\e[31msubpart of the ~/.bashrc is flawed\e[39m."
                    echo "    SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL==\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\""
                    echo "GUID=='4d45a58b-4836-4606-8134-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #----------------------------------------------------------------------
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #--------------------
        # The following Bash code segment 
        # #------------------------------
        #local S_ALIAS_BASH_CODE=" \
        #    SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; \
        #    if [ -e \"$S_FP_TEMPLATE\" ]; then \
        #        if [ ! -d \"$S_FP_TEMPLATE\" ]; then \
        #            if [ ! -e \"$S_FP_NEW\" ]; then \
        #                cp $S_FP_TEMPLATE $S_FP_NEW ; \
        #                if [ \"\$?\" == \"0\" ]; then \
        #                    sync; wait; sync; \
        #                    echo \"\"; \
        #                    echo \"Created a new file with the path of \"; \
        #                    echo \"\"; \
        #                    echo \"    $S_FP_NEW \"; \
        #                    echo \"\"; \
        #                    if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then \
        #                        if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then \
        #                            upguid -f  $S_FP_NEW; sync; wait; sync; \
        #                            chmod 0700 $S_FP_NEW; sync; wait; sync; \
        #                        else \
        #                            echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; \
        #                            echo \"\"; \
        #                        fi \
        #                    fi \
        #                else \
        #                    echo -e \"\\e[31mFailed to create file \\e[39m \"; \
        #                    echo \"\"; \
        #                    echo \"    $S_FP_NEW \"; \
        #                    echo \"\"; \
        #                    echo \"GUID=='bfd0e209-2874-42b3-9664-e241d041a7e7'\"; \
        #                    if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                        echo \"$S_ERR_MSG_SUBPART_01\"; \
        #                    fi;\
        #                    echo \"\"; \
        #                fi; \
        #            else \
        #                echo \"\"; \
        #                if [ -d \"$S_FP_NEW\" ]; then \
        #                    echo \"A folder with the path of \"; \
        #                else \
        #                    echo \"A file with the path of \"; \
        #                fi; \
        #                echo \"\"; \
        #                echo \"    $S_FP_NEW\"; \
        #                echo \"\"; \
        #                echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; \
        #                echo \"GUID=='38222d34-27c6-45ba-ba44-e241d041a7e7'\"; \
        #                if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                    echo \"$S_ERR_MSG_SUBPART_01\"; \
        #                fi;\
        #                echo \"\"; \
        #            fi; \
        #        else \
        #            echo \"\"; \
        #            echo \"The template \"; \
        #            echo \"\"; \
        #            echo \"    $S_FP_TEMPLATE\"; \
        #            echo \"\"; \
        #            if [ -h \"$S_FP_TEMPLATE\" ]; then \
        #                echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; \
        #            else \
        #                echo -e \"\\e[31mis a folder,\\e[39m\"; \
        #            fi; \
        #            echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #            echo \"Not copying anything.\"; \
        #            echo \"GUID=='61941bb4-a681-4a11-a344-e241d041a7e7'\"; \
        #            if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                echo \"$S_ERR_MSG_SUBPART_01\"; \
        #            fi;\
        #            echo \"\"; \
        #        fi; \
        #    else \
        #        echo \"\"; \
        #        echo \"The template \"; \
        #        echo \"\"; \
        #        echo \"    $S_FP_TEMPLATE\"; \
        #        echo \"\"; \
        #        if [ -h \"$S_FP_TEMPLATE\" ]; then \
        #            echo -e \"\\e[31mis a broken symlink,\\e[39m\"; \
        #        else \
        #            echo -e \"\\e[31mis missing,\\e[39m\"; \
        #        fi; \
        #        echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #        echo \"Not copying anything.\"; \
        #        echo \"GUID=='24ab09cf-8b40-4a7c-8234-e241d041a7e7'\"; \
        #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #            echo \"$S_ERR_MSG_SUBPART_01\"; \
        #        fi;\
        #        echo \"\"; \
        #    fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the 
        alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='569e6c45-c5b4-4970-9044-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='3f0d1f02-6c0d-4315-8824-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='3d16bf91-cf34-498c-be33-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='ebcfc691-0a27-4830-8d23-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #--------------------
        # The following versions are older versions that have been tested to work.
        #alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='f93460c3-c71e-4847-8123-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='3f1369a5-9009-4458-8523-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='d1bf7122-c8be-484a-9813-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='1fa8acd4-7423-4239-8113-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #     alias $S_ALIAS_NAME="if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; sync; wait; else echo \"\"; echo \"The file $S_FP_NEW already exists. Not overwriting.\"; echo \"GUID=='b2b2ee21-7b5b-42f7-b153-e241d041a7e7'\"; $S_ERR_MSG_SUBPART_01 echo \"\"; fi "
        #     alias $S_ALIAS_NAME="if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='be32ddc1-4031-4d0c-8932-e241d041a7e7'\"; $S_ERR_MSG_SUBPART_01 echo \"\"; fi else echo \"\"; echo \"The file \"; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='4597f3a3-2c9c-4ac0-a342-e241d041a7e7'\"; $S_ERR_MSG_SUBPART_01 echo \"\"; fi "
        #--------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_t1

#--------------------------------------------------------------------------

# For template creation alias declarations, where
# the original template file name matches with the template copy file name.
func_mmmv_declare_template_creation_alias_t2(){
    local S_ALIAS_NAME="$1" 
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$3" 
    #----------------------------------------------------------------------
    func_mmmv_declare_template_creation_alias_t1 \
        "$S_ALIAS_NAME" "$S_FN_TEMPLATE" "$S_FN_TEMPLATE" \
        "$S_GUID_CANDIDATE_OPTIONAL" 
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_t2

#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_tar_gz_t1(){
    local S_ALIAS_NAME="$1" 
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_FN_NEW="$3"                  # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$4" 
    #----------------------------------------------------------------------
    local S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_TEMPLATES/$S_FN_TEMPLATE"
    local S_FP_NEW="\$PWD/$S_FN_NEW"
    #--------------------
    local S_ERR_MSG_SUBPART_01=""
    if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
        S_GUID_CANDIDATE_OPTIONAL="662d4c37-786c-4cd1-822e-e241d041a7e7"
    else
        #S_ERR_MSG_SUBPART_01="echo \"S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'\" ; "
        S_ERR_MSG_SUBPART_01="S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'"
    fi
    #----------------------------------------------------------------------
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #--------------------
        # Sample:
        # alias mmmv_cre_image_length_limiter_t1="nice -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/image_edge_length_limiter_t1.tar.gz ./ "
        # The following Bash code segment 
        # #------------------------------
        #local S_FOO="\
        #    if [ -e \"$S_FP_TEMPLATE\" ]; then \
        #        if [ ! -d \"$S_FP_TEMPLATE\" ]; then \
        #            if [ ! -e \"$S_FP_NEW\" ]; then \
        #                nice -n 10 tar -xzf $S_FP_TEMPLATE ./ ; \
        #                if [ \"\$?\" == \"0\" ]; then \
        #                    sync; wait; \
        #                    echo \"\"; \
        #                    if [ -d \"$S_FP_NEW\" ]; then \
        #                        if [ -h \"$S_FP_NEW\" ]; then \
        #                            echo \"Created a new symlink to a folder with the path of \"; \
        #                        else \
        #                            echo \"Created a new folder with the path of \"; \
        #                        fi; \
        #                    else \
        #                        if [ -h \"$S_FP_NEW\" ]; then \
        #                            echo \"Created a new symlink to a file with the path of \"; \
        #                        else \
        #                            echo \"Created a new file with the path of \"; \
        #                        fi; \
        #                    fi; \
        #                    echo \"\"; \
        #                    echo \"    $S_FP_NEW \"; \
        #                    echo \"\"; \
        #                else \
        #                    echo -e \"\\e[31mFailed to create \\e[39m \"; \
        #                    echo \"\"; \
        #                    echo \"    $S_FP_NEW \"; \
        #                    echo \"\"; \
        #                    echo \"GUID=='16035d83-8499-4990-9e42-e241d041a7e7'\"; \
        #                    if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                        echo \"$S_ERR_MSG_SUBPART_01\"; \
        #                    fi;\
        #                    echo \"\"; \
        #                fi; \
        #            else \
        #                echo \"\"; \
        #                if [ -d \"$S_FP_NEW\" ]; then \
        #                    echo \"A folder with the path of \"; \
        #                else \
        #                    echo \"A file with the path of \"; \
        #                fi; \
        #                echo \"\"; \
        #                echo \"    $S_FP_NEW\"; \
        #                echo \"\"; \
        #                echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; \
        #                echo \"GUID=='f5584f2c-39d5-41c3-8a32-e241d041a7e7'\"; \
        #                if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                    echo \"$S_ERR_MSG_SUBPART_01\"; \
        #                fi;\
        #                echo \"\"; \
        #            fi; \
        #        else \
        #            echo \"\"; \
        #            echo \"The template \"; \
        #            echo \"\"; \
        #            echo \"    $S_FP_TEMPLATE\"; \
        #            echo \"\"; \
        #            if [ -h \"$S_FP_TEMPLATE\" ]; then \
        #                echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; \
        #            else \
        #                echo -e \"\\e[31mis a folder,\\e[39m\"; \
        #            fi; \
        #            echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #            echo \"Not copying anything.\"; \
        #            echo \"GUID=='5273f208-0953-4a74-a732-e241d041a7e7'\"; \
        #            if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                echo \"$S_ERR_MSG_SUBPART_01\"; \
        #            fi;\
        #            echo \"\"; \
        #        fi; \
        #    else \
        #        echo \"\"; \
        #        echo \"The template \"; \
        #        echo \"\"; \
        #        echo \"    $S_FP_TEMPLATE\"; \
        #        echo \"\"; \
        #        if [ -h \"$S_FP_TEMPLATE\" ]; then \
        #            echo -e \"\\e[31mis a broken symlink,\\e[39m\"; \
        #        else \
        #            echo -e \"\\e[31mis missing,\\e[39m\"; \
        #        fi; \
        #        echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #        echo \"Not copying anything.\"; \
        #        echo \"GUID=='59662192-a614-4756-8622-e241d041a7e7'\"; \
        #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #            echo \"$S_ERR_MSG_SUBPART_01\"; \
        #        fi;\
        #        echo \"\"; \
        #    fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the 
        alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then nice -n 10 tar -xzf $S_FP_TEMPLATE ./ ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; if [ -d \"$S_FP_NEW\" ]; then if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a folder with the path of \"; else echo \"Created a new folder with the path of \"; fi; else if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a file with the path of \"; else echo \"Created a new file with the path of \"; fi; fi; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='3856fc02-d28b-4aa2-b952-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='a23f2ecc-5cf2-4471-b141-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='ab5cca22-1139-4ada-a9d1-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='596eb974-c7d8-475b-b941-e241d041a7e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #--------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_tar_gz_t1

#--------------------------------------------------------------------------
S_TMP_CMD_CRE_GIT_CLONE=" if [ ! -e \"./pull_new_version_from_git_repository.bash\" ]; then cp $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/pull_new_version_from_git_repository.bash ./ ; sync; wait; sync; chmod 0700 ./pull_new_version_from_git_repository.bash ; sync; wait; sync; fi ; if [ ! -e \"./the_repository_clones\" ]; then mkdir -p ./the_repository_clones ; sync; wait; sync; chmod -f -R 0700 ./the_repository_clones ; sync; wait; sync; fi ; " 
alias mmmv_cre_git_clone="$S_TMP_CMD_CRE_GIT_CLONE"

# The next line
S_TMP_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_github_repos_2_clonescript_bash_t1.rb"
# uses a full path, because at this line the 
#    $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin
# is only on the Z_PATH, not yet on PATH.

func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_TMP_FP_0" "5892bc02-d2b2-40b5-9e1e-e241d041a7e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="mkdir -p ./src_from_GitHub ; sync ; wait ; cd ./src_from_GitHub ; $S_TMP_CMD_CRE_GIT_CLONE cd ./the_repository_clones ; wait ; echo \"\" ; echo \"The working directory shifted to\" ; echo \"\" ; echo \"    ./src_from_GitHub/the_repository_clones\" ; "
        alias mmmv_cre_git_clone_collection_from_GitHub_t1="$S_TMP_0 ruby -e 's_username=ARGV[0]; s_cmd=\"$S_TMP_FP_0 https://github.com/\"+s_username ; exec(s_cmd) ' "
        alias mmmv_cre_git_clone_collection_from_GitHub_t2="$S_TMP_0 $S_TMP_FP_0 "
    fi
fi
#--------------------------------------------------------------------------

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_bashrc_minimalistic_template_01" "_bashrc_minimalistic_template_01" \
    "3d023843-fb4a-4947-a62e-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_disassembly_and_reassembly_script_t1" "disassembly_and_reassembly_t1.bash" \
    "eb60e5f1-6a13-40c3-bb3e-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_download_files_with_wget_template_01" "download_files_with_wget_template_01.bash" \
    "ed2001a8-1cb8-4db6-abee-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_Fossil_wiki_page_HTML_expimp_template_01" "download_and_upload_Fossil_wiki_HTML.bash" \
    "7ca0087b-ef93-4994-8a4e-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_fossil_clone" "mmmv_Fossil_operator_t1.bash" \
    "28e884d3-d397-4d1a-9a2e-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_ruby_console_application_t2" "ruby_console_application_template_t2.rb" \
    "269a6a13-b793-42c8-9a1e-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SQL_dump_script" "create_backup_from_MySQL_db.bash" \
    "17459aca-4bee-44a9-892d-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_config_template" "_ssh_config_template.txt" \
    "158f0672-f182-4164-afbd-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_tunnel_creation_script_template_t1" "ssh_tunnel_t1.bash" \
    "39efc074-5abb-4bff-b22d-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_WARC_Tools" "2016_12_xx_WARC_tools.tar.xz" \
    "82338190-e5d3-43e4-b52d-e241d041a7e7"

#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="nice -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/rsync_based_backups_creator.tar.gz ./ "
        if [ "$SB_RSYNC_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_cre_rsync_based_backups_creator="$S_TMP_0"
        else
            if [ "$SB_RSYNC_EXISTS_ON_PATH" != "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
                    echo "GUID=='289cfff3-c3ec-4188-8a51-e241d041a7e7'"
                fi
            fi
            alias mmmv_cre_rsync_based_backups_creator="echo \"\" ; echo \"The \\\"rsync\\\" is not on PATH.\" ; echo \"GUID=='5878ab13-bb8d-4964-b921-e241d041a7e7'\" ; echo \"\" ; $S_TMP_0"
        fi
  fi
fi
#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_bash_boilerplate_t4_copy" \
            "2023_06_10_mmmv_bash_boilerplate_t4.tar.gz" \
            "2023_06_10_mmmv_bash_boilerplate_t4" \
            "32820624-9f62-4410-955d-e241d041a7e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_image_length_limiter_t1" \
            "image_edge_length_limiter_t1.tar.gz" \
            "image_edge_length_limiter_t1" \
            "a050896d-180c-4b43-966d-e241d041a7e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_installed_programs_checklist_t1" \
            "2021_02_xx_mmmv_installed_programs_checklist_t1_template.tar.gz" \
            "installed_programs_checklist_t1_template" \
            "023de6e8-f70c-45fa-a96d-e241d041a7e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ruby_boilerplate_t5" \
            "2023_02_26_mmmv_ruby_boilerplate_t5.tar.gz" \
            "2023_02_26_mmmv_ruby_boilerplate_t5" \
            "5f5479c2-b16f-4017-b94d-e241d041a7e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ZeroNet_Rev3703_from_mmmv_repackaging" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2.tar.gz" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2" \
            "82b16101-e1c7-4fd7-be5d-e241d041a7e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_vimwiki_project_wiki_t1" \
            "project_wiki_t1.tar.gz" \
            "project_wiki" \
            "347c3361-8d63-44e0-b11d-e241d041a7e7"
        #----
    fi
fi
#------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_CVS_clonescript_t1" \
    "CVS_clonescript_template_01.bash" "CVS_clonescript.bash" \
    "a358e68b-6504-4050-8c1d-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_x_txt_git_pack_Bash_script_t1" \
    "mmmv_git_pack_template_t1.bash" "x.txt" \
    "566185a3-4318-438e-8e2d-e241d041a7e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Rakefile_template_t1" \
    "2022_10_06_Rakefile_template_t1.rb" "Rakefile" \
    "1784cc23-77f7-4d59-b41c-e241d041a7e7" 

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_try_to_compile_X_template_t1" \
    "try_to_compile_X_template_t1.bash" "try_to_compile_X.bash" \
    "cb527f98-f03f-43ce-b53c-e241d041a7e7" 

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_switch_to_next_keyboard_layout_t1" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1_template.bash" "mmmv_ui_switch_to_next_keyboard_layout_t1.bash" \
    "7137cfd4-b503-4886-9f4c-e241d041a7e7"

#------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_utilities"
FP_MMMV_PROCESS_EDITOR_BASH="$S_TMP_0/mmmv_process_editor/src/mmmv_process_editor.bash "
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_text_processing_lstop_t1="nice -n 6 ruby $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_text_processing_lstop_t1/mmmv_text_processing_lstop_t1.rb "
    alias mmmv_process_editor="nice -n 6 bash $FP_MMMV_PROCESS_EDITOR_BASH "
fi
#--------------------------------------------------------------------------
if [ "$MMMV_BASHRC_CONST_NONFIRST_SESSION_IN_TERMINAL" != "t" ]; then
    if [ -e "$HOME/tmp" ]; then
        if [ -d "$HOME/tmp" ]; then
            cd "$HOME/tmp"
        fi
    else
        if [ -e "$HOME/tmp_" ]; then
            if [ -d "$HOME/tmp_" ]; then
                cd "$HOME/tmp_"
            fi
        fi
    fi
    export MMMV_BASHRC_CONST_NONFIRST_SESSION_IN_TERMINAL="t"
fi    
#--------------------------------------------------------------------------
alias mmmv_vim_common_bashrc_main_bash="nice -n 2 vim $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash "

# https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
alias mmmv_terminal_fix_copypaste_t1="printf \"\e[?2004l\""
#-----------------------------
if [ "$SB_XMLLINT_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_format_xml_t1="nice -n 10 xmllint --format "
fi
if [ "$SB_GPG_EXISTS_ON_PATH" == "t" ]; then
    # The 
    #alias mmmv_gpg_rot13_encrypt="nice -n 17 gpg --symmetric  --force-mdc  --cipher-algo=IDEA --compress-level=0 --pinentry-mode=loopback " # ./letter.txt
    # has been constructed by modifying a command line that was copy-pasted from
    #     https://askubuntu.com/questions/1080204/gpg-problem-with-the-agent-permission-denied
    #     archival copy: https://archive.vn/WnXKX
    # On some Linux systems the "--pinentry-mode=loopback" 
    # gives an error message: "gpg: invalid option "--pinentry-mode=loopback"
    # so the 
    alias mmmv_gpg_rot13_encrypt="nice -n 17 gpg --symmetric  --force-mdc  --cipher-algo=TWOFISH --compress-level=0 " # ./letter.txt
    # is without the "--pinentry-mode=loopback". The same with the 
    #alias mmmv_gpg_rot13_decrypt_2_console="nice -n 17 gpg --decrypt --pinentry-mode=loopback " # ./letter.txt.gpg > ./letter.txt
    # versus 
    alias mmmv_gpg_rot13_decrypt_2_console="nice -n 17 gpg --decrypt " # ./letter.txt.gpg > ./letter.txt
    # Supported algorithm names for the "--cipher-algo=...": IDEA, TWOFISH, ...
    # can be listed on console by executing 
    #
    #     gpg --version | grep -i algorithms -A 6
    #
    # If letter.txt.gpg is viewed with Vim, then in some circumstances 
    # its decrypted version is shown.
    #--------
    mkdir -p ~/.gnupg
    func_mmmv_wait_and_sync_t1
    if [ -e "~/.gnupg" ]; then
        nice -n 18 chmod -f -R 0700 ~/.gnupg &
    fi
fi
#-----------------------------
if [ "$SB_USERNAME_IS_mmmv" == "t" ]; then

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_userspace_distro_specific" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific" \
        "812fde5c-972a-43ed-8f2c-e241d041a7e7"

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_general" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/general" \
        "1e9eb563-9597-4007-945c-e241d041a7e7"
else
    func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
        "$SB_USERNAME_IS_mmmv" \
        "b937e61d-3de3-4677-9d4c-e241d041a7e7"
fi
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
    "mmmv_go_mmmv_userspace_distro_t1_mmmv" \
    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv" \
    "02240ba2-3cc1-4d05-a16c-e241d041a7e7"
#--------------------------------------------------------------------------
if [ "$SB_FFMPEG_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ffmpeg_t1="nice -n 20 ffmpeg -i "
fi
#--------------------------------------------------------------------------
if [ "$SB_XPROP_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_admin_show_window_PID_t1="echo \"\"; echo \"Please click on the window to find out its process ID, PID?\"; echo \"\" ; wait; ps -A | grep \$(xprop | grep _NET_WM_PID | $S_CMD_GNU_SED 's/^.\\+= //g')"
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_XAUTH_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_admin_xauthority_add_32_hexdigits_t1="S_TMP_32_HEXDIGITS=\"\`ruby -e \\\"s=''; 32.times{s<<(rand(16).to_s(16))}; printf(s)\\\"\`\" ; xauth -f \"$HOME/.Xauthority\" add \"\$DISPLAY\" . \"\$S_TMP_32_HEXDIGITS\""
    fi
fi
#--------------------------------------------------------------------------
# The execution of the 
#
#     source "$MMMV_FP_COMMON_BASHRC_MAIN"
#
# can take about 15s, depending on the machine that executes it. 
# Any console output that is necessary for feedback is likely to 
# interfere with the operation of the scp/sftp, because 
# at least some SSH/scp/sftp file copying tools consider
# any ~/.bashrc created stdout output as a server-side error and 
# fail to work, if ~/.bashrc prints to stdout. 
#
#     https://serverfault.com/questions/485487/use-bashrc-without-breaking-sftp
#     archival copy: https://archive.vn/pxmm1
#     https://web.archive.org/web/20201029162511/https://serverfault.com/questions/485487/use-bashrc-without-breaking-sftp
#
# A workaround to both of those problems is 
# to switch on the mmmv environment manually by executing 
alias mmmv_environment="nice -n 2 bash --rcfile \"$MMMV_FP_COMMON_BASHRC_MAIN\" "
#
# Reformatted citation from the ssh man page and the following page:
# https://unix.stackexchange.com/questions/120080/what-are-ssh-tty-and-ssh-connection
# archival copy: https://archive.vn/2y2EF
#
#     SSH_TTY    This is set to the name of the tty (path to the device) 
#                associated with the current shell or command.  
#                If the current session has no tty, this variable is not set.
#
#     SSH_CONNECTION    Identifies the client and server ends of the connection.
#                       The variable contains four space-separated values: 
#                       client IP address, client port number, server IP address, 
#                       and server port number.
#
SB_LOGGED_IN_OVER_SSH="f" # domain: {"t","f"}
if [ "$SSH_CONNECTION" != "" ]; then # SSH session exists
    SB_LOGGED_IN_OVER_SSH="t" 
    #if [ "$SSH_TTY" == "" ]; then # the SSH session is not a terminal session.
    #fi
fi
#--------------------------------------------------------------------------
# That test pattern is useful for testing console fonts.
# As of 2021_06_xx my(Martin Vahi) subjective preference
# for a console font is that the fonti is some monospace font, 
# characters are easy to recognize and easily distinguishable from eachother.
alias mmmv_ls_character_testpatterns_t1="echo \"\" ; echo \"adad bdbd ftft lIlI oaoa ococ oqoq aeae ecec qgqg 3535 3737 1717 4747 4141 8686 rnrn hnhn yvyv uvuv yuyu pgpg jiji IiIi l|l| I|I| QOQO 0Q0Q 0o0o OoOo O0O0 OCOC 0C0C 8080 lJlJ IJIJ jJjJ RKRK GCGC G6G6 !|!| ß8ß8 ß8ß8 1234567890 abcdefghijklmnoprstuvwxyzõäöüžš ABCDEFGHIJKLMNOPRSTUVWXYZÕÄÖÜŽŠ .:,; _- ?! ^~ [](){} $€ |/\\\\ \\\"'\\\`\" ; echo \"\""
#--------------------
# Fonts for terminals:
#     Perfect or nearly perfect:
#         JetBrains Mono
#             https://www.jetbrains.com/lp/mono/
#             https://github.com/JetBrains/JetBrainsMono
#         Monospace
#         Liberation Mono
#     Good:
#         Lucida Console
#     Compromise versions:
#         Fira Mono
#         DEC Terminal
#         PT Mono
#         DejaVu Sans Mono
#         Efont Fixed
#         Courier_New/Cousine
alias mmmv_ls_doc_fonts_for_terminals_t1='echo ""; echo " Fonts for terminals:"; echo "     Perfect or nearly perfect:"; echo "         JetBrains Mono " ; echo "             https://www.jetbrains.com/lp/mono/ " ; echo "             https://github.com/JetBrains/JetBrainsMono " ; echo "         Monospace"; echo "         Liberation Mono"; echo "     Good:"; echo "         Lucida Console"; echo "     Compromise versions:"; echo "         Fira Mono"; echo "         DEC Terminal"; echo "         PT Mono"; echo "         DejaVu Sans Mono"; echo "         Efont Fixed"; echo "         Courier_New/Cousine " ; echo "";'
#--------------------------------------------------------------------------
if [ "$DISPLAY" == "" ]; then
    # If the Windows Linux layer, the Windows Subsystem for Linux (WSL), 
    # is used with the VcXsrv
    #
    #     https://sourceforge.net/p/vcxsrv/
    #
    # then in the case of WSL 1.x the 
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        export DISPLAY=":0"
    else
        export DISPLAY="localhost:0" # for openSUSE Linux
    fi
    # is needed. In the case of WSL 2.x the IP-address is needed, like 
    #
    #     export DISPLAY="<here comes the IP-address>:0"
    #
    # As of 2020 the alternatives for the VcXsrv might be
    #
    #     https://sourceforge.net/projects/xming/
    #     https://x.cygwin.com/
    #
    # As of 2020_11 one of the requirements for using GUI applicatons
    # on the WSL Debian distribution is 
    #
    #     apt-get install x11-apps
    #
    # The testing might be done by executing
    #
    #     xeyes 
    #
    # which, if properly executing, should be listed at the Windows task-bar.
    # On Debian Linux systems 
    #
    #     xauth list
    #
    # might sometimes give some ideas, what to use as a value 
    # for the DISPLAY environment variable.
fi

# According to the
# https://unix.stackexchange.com/questions/203844/how-to-find-out-the-current-active-xserver-display-number
# achival copy: https://archive.vn/0Bpdr
# The way to find out, which display number the current session uses, is 
#
#     loginctl list-sessions
#     # and after obtaining the session IDs from there, run 
#     loginctl show-session -p Display -p Active <session ID>
#
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_HOSTNAME_SPECIFIC_INITIALISATIONS_TIMESTAMP" != "$S_TIMESTAMP" ]; then
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo -e "\e[31mHost \"$HOSTNAME\" specific initializations were skipped.\e[39m"
        echo "Probably the problem is that the "
        echo ""
        echo "    $S_FP_APPLIANCE_INSTANCE_SPECIFIC_MAIN_BASH"
        echo ""
        echo "has not yet been customised for this host."
        echo "GUID=='298fb6a1-080f-4246-9b21-e241d041a7e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_Android_Termux"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX" \
    "44fb1c21-5559-4381-9a3c-e241d041a7e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    #--------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX/bin"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN" \
            "37b62255-642d-4cca-964c-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            Z_PATH="$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN:$Z_PATH"
        fi
    fi
    #--------------------
    # https://wiki.termux.com/wiki/Termux-setup-storage
    # archival copy: https://archive.ph/4wbWF
    # local copy: $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/
    #                 third_party_documentation/Linux_and_BSD_administration/
    #                 Linux_distribution_specific_documentation/
    #                 Termux/PDFs/2022_08_31_Termux-setup-storage_t1.pdf
    SB_TERMUXSETUPSTORAGE_EXISTS_ON_PATH="f"
    if [ "`which termux-setup-storage 2> /dev/null`" != "" ]; then
        SB_TERMUXSETUPSTORAGE_EXISTS_ON_PATH="t"
        # The 
        alias mmmv_admin_Termux_setup_storage="nice -n 2 termux-setup-storage "
        # creates $HOME/storage
    fi
    #--------------------
    S_TMP_0="/sdcard"
    # It might be that the Android device 
    # does not have an sdcard installed in it or
    # for some reason the "/sdcard" 
    # is a file or a symlink to a file.
    SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="f"
    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_sdcard" "$S_TMP_0" \
        "63abfc16-b9ad-4342-843c-e241d041a7e7" \
        "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="/sdcard/Download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_Download" "$S_TMP_0" \
            "466a1f35-2356-4ad7-b13c-e241d041a7e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
        S_TMP_0="/sdcard/download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_download" "$S_TMP_0" \
            "4e1fe3b1-05a1-4636-8a2c-e241d041a7e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_WSL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_WSL"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL" \
    "503700c2-c423-4310-b05b-e241d041a7e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
    #--------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        export MMMV_USERSPACE_DISTRO_T1_LINUX_WSL_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL/bin"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL_BIN" \
            "25066ed5-f4dd-4bdb-b05b-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            Z_PATH="$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL_BIN:$Z_PATH"
        fi
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_general_only"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY" \
    "4249715e-0930-443a-93bb-e241d041a7e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #--------------------
            export MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY/bin"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN" \
                "2b45ef12-69a3-4541-9c4b-e241d041a7e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                Z_PATH="$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN:$Z_PATH"
            fi
            #--------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1 # Just to be sure.
#--------------------------------------------------------------------------
# According to the 
#
#     https://vim.fandom.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
#     archival copies: 
#         https://archive.vn/DaYZK
#         https://web.archive.org/web/20210810075503/https://vim.fandom.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
#
# the
#
#     let $PAGER=''
#
# in the ~/.vimrc combined with the 
#
#     export PAGER="/bin/sh -c \"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
#
# in the ~/.bashrc should make sure that 
# the Vim is used for displaying man pages.
#----------------------------------------
if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_COL_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
            #export PAGER="/bin/sh -c \"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
            export MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_VIM_T1="export PAGER=\"/bin/sh -c \\\"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\\\\\"<cword>\\\\\\\")<CR><CR>' -\\\"\""
            alias mmmv_ui_manpagereader_Vim_t1="$MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_VIM_T1"
        fi
    fi
fi
#----------------------------------------
# The idea for displaying man pages in Emacs 
# originates from 
#     https://stackoverflow.com/questions/10644163/how-to-view-man-pages-using-emacs-when-invoking-man-command-in-command-line
#     archival copy: https://archive.ph/oxghe
#
func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1(){
    local S_SEARCHSTRING="$1"
    #----------------------------------------------------------------------
    if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
        nice -n 5 emacs -eval "(woman \"$S_SEARCHSTRING\")";  
        func_mmmv_wait_and_sync_t1
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
            echo "This function should never be called if "
            echo "the Emacs is missing from PATH."
            echo "GUID=='55037d41-9b54-43fb-a331-e241d041a7e7'"
            echo ""
        fi
    fi
} # func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1

if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
    export MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_EMACS_T1="export PAGER=\"func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1 \""
    alias mmmv_ui_manpagereader_Emacs_t1="$MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_EMACS_T1"
fi
#--------------------------------------------------------------------------

export C_INCLUDE_PATH="$MMMV_C_INCLUDE_PATH:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$MMMV_CPLUS_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"

if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    # In some cases the 
    printf "\e[?2004l"
    # makes sure that text can be copy-pasted to terminal
    # without being surrounded by tildes like "~copypastedtext~".
    #     https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
    # archival copies:
    #     https://archive.is/xf6KZ
    #     https://web.archive.org/web/20161125181111/https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
fi

# As of 2020 the 
export  CONFIG_SHELL="`which bash`" 
# is compulsory for building projects like the GCC, because
# supposedly other shells have more flaws/bugs.
#--------------------------------------------------------------------------
SB_LIBTOOL_EXISTS_ON_PATH="f"
if [ "`which libtool 2> /dev/null`" != "" ]; then
    # The GNU libtool is required for 
    # building at least some versions of the GCC.
    SB_LIBTOOL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "libtool" "6513c8a4-cba3-4ae6-ac2b-e241d041a7e7"
fi
#--------------------------------------------------------------------------
SB_FOSSIL_EXISTS_ON_PATH="f"
if [ "`which fossil 2> /dev/null`" != "" ]; then
    # https://www.fossil-scm.org
    SB_FOSSIL_EXISTS_ON_PATH="t"
    alias mmmv_run_Fossil_rebuild_t1="nice -n20 fossil rebuild --vacuum --compress --cluster --analyze "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "fossil" "12dba8c5-027e-4161-b12b-e241d041a7e7"
fi
#--------------------------------------------------------------------------
if [ "$SB_GLIMPSE_EXISTS_ON_PATH" == "" ]; then
    SB_GLIMPSE_EXISTS_ON_PATH="f"
    if [ "`which glimpse 2> /dev/null`" != "" ]; then
        SB_GLIMPSE_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_GLIMPSEINDEX_EXISTS_ON_PATH" == "" ]; then
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="f"
    if [ "`which glimpseindex 2> /dev/null`" != "" ]; then
        SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_AGREP_EXISTS_ON_PATH" == "" ]; then
    SB_AGREP_EXISTS_ON_PATH="f"
    if [ "`which agrep 2> /dev/null`" != "" ]; then
        SB_AGREP_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_GLIMPSEINDEX_EXISTS_ON_PATH" == "t" ]; then
    # The 
    alias mmmv_se_glimpse_index_t1="SI_MAX_NUMBER_OF_MiB_DURING_INDEXING=\"20\" ; nice -n 5 glimpseindex -M \$SI_MAX_NUMBER_OF_MiB_DURING_INDEXING -n -B -b -f -s -H " # $FULL_PATH_TO_FOLDER_WITH_INDICES  $FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS
    # creates index files that have a path of 
    # $FULL_PATH_TO_FOLDER_WITH_INDICES/.glimpse_Foo
    #
    # For scripts the following code might be useful:
    #
    #     rm $FULL_PATH_TO_FOLDER_WITH_INDICES/.glimpse_*
    #     wait
    #     SI_MAX_NUMBER_OF_MiB_DURING_INDEXING="20"
    #     glimpseindex -M $SI_MAX_NUMBER_OF_MiB_DURING_INDEXING \
    #         -n -B -b -f -s -H $FULL_PATH_TO_FOLDER_WITH_INDICES \
    #         $FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS
    #
fi
if [ "$SB_GLIMPSE_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_se_glimpse_search_t1="nice -n 2 glimpse -y -H " # $FULL_PATH_TO_FOLDER_WITH_INDICES <the rest of the parameters> searchstrng
    # Examples:
    #
    #     # Case insensitive search from subparts of words:
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i searchstring
    # 
    #     # Case insensitive search with a requirement that
    #     # the match must match a whole word.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i -w searchstring
    # 
    #     # The same as above, but at most 77 search results are displayed.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i -w -L 77 searchstring
    # 
    #     # Fuzzy search with a maximum number of mismaching characters of 2.
    #     # The "-i" and "-w" options do not work with fuzzy search.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -2 searchstring
    #
fi
#--------------------------------------------------------------------------
# The SB_EXA_EXISTS_ON_PATH
# MIGHT have been declared at the 
# /home/mmmv/applications/declare_applications.bash
if [ "$SB_EXA_EXISTS_ON_PATH" != "t" ]; then
    SB_EXA_EXISTS_ON_PATH="f"
    if [ "`which exa 2> /dev/null`" != "" ]; then
        SB_EXA_EXISTS_ON_PATH="t"
        # The aliases ls0 and mmmv_ls0
        # are declared at a lower part of this file.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "exa" "558ac884-b051-4cca-804b-e241d041a7e7"
    fi
fi
func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X(){
    local S_SUFFIX="$1" # is the sorting parameter of 
                        # the ls replacement called exa
    #----------------------------------------------------------------------
    if [ "$SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED" == "t" ]; then
        S_TMP_4="$S_TMP_0 $S_TMP_3$S_SUFFIX $S_TMP_1"
        alias ls1_$S_SUFFIX="$S_TMP_4"
        alias mmmv_ls1_$S_SUFFIX="$S_TMP_4"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo "The function that outputs this message "
            echo "is in a role of a lambda-function."
            echo "GUID=='37c0ba45-6667-46f1-a810-e241d041a7e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X
if [ "$SB_EXA_EXISTS_ON_PATH" == "t" ]; then
    #----------------------------------------------------------------------
    # According to 2022_09_07 version of the
    #     https://github.com/ogham/exa/issues/1108
    # the "-b" at the 
    S_TMP_0="nice -n 2 exa "
    S_TMP_1=" -b -l -T -L "
    S_TMP_2="$S_TMP_0 $S_TMP_1"
    # changes the size display mode from decimal prefixes (kB,MB,GB,...)
    # to the binary, classical, prerixes (KiB,MiB,GiB,...). The 
    alias ls0="$S_TMP_2"
    alias mmmv_ls0="$S_TMP_2"
    # reside in this if-clause to make sure that they
    # get defined in a situation, where the exa 
    # is placed on PATH by the 
    #     /home/mmmv/applications/declare_applications.bash
    #----------------------------------------------------------------------
    S_TMP_3=" --sort="
    #--------------------
    #S_SUFFIX="name"
    #S_TMP_4="$S_TMP_0 $S_TMP_3$S_SUFFIX $S_TMP_1"
    SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED="t"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "accessed"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "created"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "extension"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "modified"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "name"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "size"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "type"
    SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED="f"
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_B_C_A_exec_t1" # is written in Ruby
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_TMP_0" "4211b464-80c7-40e0-b03b-e241d041a7e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        # The space at the next line beofero the "; S_ERROR_CODE=..." is important.
        export MMMV_ALIAS_ERROR_CODE_CHECK_T1="mmmv_polish_ABC_2_B_C_A_exec_t1 ' ; S_ERR_CODE=\"\$?\" ; if [ \"\$S_ERR_CODE\" != \"0\" ]; then echo \"\" ; echo -e \"Program exited with \\\e[31merror code \$S_ERR_CODE\\\e[39m .\" ; echo \"GUID==\\\"785efa41-25b5-46ea-8a59-9053d0a0c6e7\\\"\" ; echo \"\" ; fi ' "
        alias mmmv_userspace_distro_t1_test_error_code_check_t1="$MMMV_ALIAS_ERROR_CODE_CHECK_T1 ls "
        alias mmmv_run_with_error_code_check_t1="$MMMV_ALIAS_ERROR_CODE_CHECK_T1 "
    fi
fi
#--------------------
# Some tested code fragments for developing this idea further:
#
#     # The space at the next line beofero the "; S_ERROR_CODE=..." is important.
#     S_ERROR_CODE_CHECK="mmmv_polish_ABC_2_B_C_A_exec_t1  ' ; S_ERR_CODE=\"\$?\" ; if [ \"\$S_ERR_CODE\" != \"0\" ]; then echo \"\" ; echo -e \"Program exited with \\\e[31merror code \$S_ERR_CODE\\\e[39m .\" ; echo \"GUID==\\\"\$S_GUID\\\"\" ; echo \"\" ; fi ' "
#     S_SUMMAARNE_PREFIKS="export S_GUID='ahoo' ; $S_ERROR_CODE_CHECK "
#     alias testalias_01="$S_SUMMAARNE_PREFIKS ls "
# 
# The solution here might be to create some heavily customised version of
# mmmv_polish_ABC_2_B_C_A_exec_t1. For example, the error checking suffix Bash
# might be part of that customised Ruby script.
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_alias_admin_create_home_tmp_t1(){
    #----------------------------------------------------------------------
    # /home might be at a parttition that uses the NilFS2 file system.
    # /tmp might reside at a partition that uses the ext4 file system. 
    # NilFS2 file system is optimised for safeguarding data to the point that
    # as of 2023_01 it lacks the fsck tool, because 
    # the NilFS2 does not need that tool. The space of
    # files that are deleted from a NilFS2 partition
    # is released by a nilfs-clean daemon. If the daemon is not running,
    # deleting files from a NilFS2 partition consumes extra space, because
    # the record that says, that a file is deleted, takes
    # extra space. From speed point of view it makes sense to keep
    # all temporary files at some non-NilFS2 partion. For example,
    # build folders should be at non-NilFS2 partitions and all valuable
    # data that must be retained, including installation folders,
    # should reside at a NilFS2 partiton.
    #----------------------------------------------------------------------
    local S_TMP_0="_tmp_"
    local S_FP_GLOBALTMP="/tmp/`whoami`$S_TMP_0"  # hopefully at a non-NilFS2 
                                          # partition, may be at an ext4 partition
    local S_FP_USERTMP="$HOME/tmp_"  # Assumption is that /home resides 
                                     #at a NilFS2 partition.
    #----------------------------------------------------------------------
    if [ ! -e "$S_FP_USERTMP" ]; then  # might be a broken symlink
        #------------------------------------------------------------------
        if [ ! -e "$S_FP_GLOBALTMP" ]; then
            if [ ! -h "$S_FP_GLOBALTMP" ]; then
                mkdir -p $S_FP_GLOBALTMP
                func_mmmv_wait_and_sync_t1
                if [ -e "$S_FP_GLOBALTMP" ]; then
                    chmod -f -R 0700 $S_FP_GLOBALTMP
                    func_mmmv_wait_and_sync_t1
                fi
                func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                    "$S_FP_GLOBALTMP" "2774ca72-f502-4e42-914b-e241d041a7e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "$S_FP_GLOBALTMP is a\e[31m broken symlink \e[39m."
                    echo "GUID=='47a24993-e3ea-40ac-8e40-e241d041a7e7'"
                    echo ""
                fi
            fi
        fi
        #----------------------------------------
        if [ ! -e "$S_FP_USERTMP" ]; then 
            #----------------------------------------
            # The S_FP_USERTMP might have referenced a 
            # broken symlink that might have become 
            # a non-broken symlink after the 
            #     mkdir -p $S_FP_GLOBALTMP"
            if [ -e "$S_FP_GLOBALTMP" ]; then
                if [ -d "$S_FP_GLOBALTMP" ]; then
                    #----------------------------------------
                    if [ ! -h "$S_FP_USERTMP" ]; then 
                        # At this line the $S_FP_USERTMP was actually missing.
                        ln -s "$S_FP_GLOBALTMP" "$S_FP_USERTMP"
                        func_mmmv_wait_and_sync_t1
                        if [ -e "$S_FP_USERTMP" ]; then 
                            chmod -f -R 0700 $S_FP_USERTMP
                            func_mmmv_wait_and_sync_t1
                        else
                            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                                echo ""
                                echo -e "\e[31m Failed to create a symlink \e[39m"
                                echo "    $S_FP_USERTMP"
                                echo "that would point to to "
                                echo "    $S_FP_GLOBALTMP"
                                echo "GUID=='85d75c27-d8b7-41da-9820-e241d041a7e7'"
                                echo ""
                            fi
                        fi
                    else
                        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                            echo ""
                            echo -e "$S_FP_USERTMP is a\e[31m broken symlink \e[39m."
                            echo "GUID=='1132fb82-31c7-4390-8230-e241d041a7e7'"
                            echo ""
                        fi
                    fi
                    #----------------------------------------
                fi
            fi
            #----------------------------------------
        fi
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_alias_admin_create_home_tmp_t1
# The code that implements the 
alias mmmv_admin_create_home_tmp_t1="func_mmmv_userspace_distro_t1_alias_admin_create_home_tmp_t1 ;"
# can NOT be called automatically at login, because
# it needs to output warning messages and that
# might terminate an SSH session. Sometimes
# SSH clients interperet any stdout output during the
# execution of the ~/.bashrc as a login related error condition.
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_hostname_specific/`hostname`"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "34a25dee-1c19-443d-b89b-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
#else
#    # It's OK for that folder to be missing.
fi
#--------------------------------------------------------------------------
S_FP_0="$HOME/m_local/bin" # yet anohter place for host specific executables
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    fi
#else
#    # It's OK for that folder to be missing.
fi
#----------------------------------------
S_FP_0="/home/mmmv/m_local/bin" # yet anohter place for host specific executables
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    fi
#else
#    # It's OK for that folder to be missing.
fi
#--------------------------------------------------------------------------
# The 
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_installed_program_specific/_bashrc_subpart_that_contains_the_checks_and_declarations.bash"
# might add more programs to the PATH/Z_PATH.
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#--------------------------------------------------------------------------
S_FP_0="$HOME/m_local/etc/_bashrc_optional_extra_01"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        source "$S_FP_0"
    else
        # The
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "4cfd9411-084d-4c21-a61b-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        # is here for outputting an error message.
    fi
fi
#--------------------------------------------------------------------------
export PATH="$Z_PATH" # To at least somewhat accurately check 
                      # the availability of Python/pip/pip3 
                      # and other package collection based 
                      # installed programs. There's another line like that later.
#--------------------------------------------------------------------------
if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_CURL_EXISTS_ON_PATH" == "t" ]; then
        # SH_EXISTS_ON_PATH
        alias mmmv_admin_install_Rust_t1="nice -n 2 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh "
    fi
fi
#--------------------
SB_TRAFILATURA_EXISTS_ON_PATH="f"
if [ "`which trafilatura 2> /dev/null`" != "" ]; then
    SB_TRAFILATURA_EXISTS_ON_PATH="t"
    # The trafilatura is a Python3 application 
    # that is meant to be installed by
    #
    #     pip3 install --no-cache-dir trafilatura 
    # 
#else
    # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #     "trafilatura" "5d4ccb40-15cd-454e-96aa-e241d041a7e7"
fi
#--------------------
SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="f"
if [ "`which mmmv_cre_temporary_file_t1 2> /dev/null`" != "" ]; then
    SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="t"
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo ""
        echo -e "Command line utility \"\e[31mmmmv_cre_temporary_file_t1\e[39m\" \e[31mmissing from PATH\e[39m."
        echo -e "Recommended action in Bash:\e[36m"
        echo ""
        echo "  S_FP_FOLDER=\"$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_hostname_specific/$HOSTNAME\" "
        echo "  mkdir \$S_FP_FOLDER ; wait ; sync ; wait ; "
        echo "  S_FP_FILE_DESTINATION=\"\$S_FP_FOLDER/mmmv_cre_temporary_file_t1\" "
        echo "  S_FP_FILE_ORIGIN=\"$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_cre_temporary_file_t1_host_independent\""
        echo "  cp \$S_FP_FILE_ORIGIN \$S_FP_FILE_DESTINATION ; wait ; sync ; wait ; "
        echo "   "
        echo "  # and then create a RAM-partition and after that update the  "
        echo "  # value of the variable S_FP_TMP_FOR_SMALL_FILES in file "
        echo "  # \$S_FP_FILE_DESTINATION, function "
        echo "  # func_initialize_configuration_by_initializing_global_variables "
        echo -e "\e[39m"
        echo "Thank You for reading this text."
        echo "GUID=='e155e48a-5e0e-45d3-8230-e241d041a7e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1 # Just to be sure.
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_A_C_B_exec_t1"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
            #--------------------------------------------------------------
            if [ "$SB_REV_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                    #------------------------------------------------------
                    # Sample Bash line:
                    #
                    #     cat ./text_with_linebreaks.txt | rev | sed -e 's/^/ /g' | rev | tr --delete '\n\r' 
                    #
                    #     mmmv_polish_ABC_2_A_C_B_exec_t1 \
                    #         " cat " \
                    #         " | rev | sed -e 's/^/ /g' | rev | tr --delete '\n\r' " \
                    #         ./text_with_linebreaks.txt
                    #
                    # The sed command at the above example makes sure that 
                    # a word at the end of one line is not concatenated
                    # to the word at the start of the next line. As the
                    # very last line in a textfile never has an ending linebreak,
                    # the sed command also makes sure that the very last 
                    # non-space character at the very last line of the textfile
                    # does not get deleted. 
                    #
                    alias mmmv_textfilter_f2c_remove_linebreaks_t1="$S_FP_0 \" cat \" \" | rev | $S_CMD_GNU_SED -e 's/^/ /g' | rev | tr --delete '\n\r' \" " 
                    #------------------------------------------------------
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_TRAFILATURA_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_JQ_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
                        #--------------------------------------------------
                        # The "python2 -m json.tool" is a JSON source formatter.
                        # The trafilatura is a Python3 application.
                        #alias mmmv_HTML_body_2_txt_from_URL_t1="nice -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --URL \" \" | python2 -m json.tool | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        alias mmmv_HTML_body_2_txt_from_URL_t1="nice -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --URL \" \" | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        alias mmmv_HTML_body_2_txt_from_file_t1="nice -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --input-file \" \" | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        #--------------------------------------------------
                    fi
                fi
            fi
            #--------------------------------------------------------------
        else
            #--------------------------------------------------------------
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_0" "44766d03-3c3e-4752-a71a-e241d041a7e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            #--------------------------------------------------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_ACB_exec_t1"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then # Halve-overkill here, but
                                                      # it alleviates the situation
                                                      # a bit at some corner cases.
            #--------------------------------------------------------------
            if [ "$SB_LOCALECTL_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                        #------------------------------------------------------
                        # alias mmmv_ui_display_keyboard_layout_variants_t1="S_KEYBOARD_LAYOUT='ru' ; printf \"\\n \`localectl list-x11-keymap-variants \$S_KEYBOARD_LAYOUT | tr '\\n\\r' ' ' \` \n\n\""
                        #--------
            #mmmv_polish_ABC_2_ACB_t1 "S_KEYBOARD_LAYOUT='"  "' ; printf \"\\n \`localectl list-x11-keymap-variants \$S_KEYBOARD_LAYOUT | tr '\\n\\r' ' ' \` \n\n\"" "ru"
                        #--------
                        #alias mmmv_ui_display_keyboard_layout_variants_t1="mmmv_polish_ABC_2_ACB_t1 \"S_KEYBOARD_LAYOUT='\"  \"' ; printf \\\"\\\\n \\\`localectl list-x11-keymap-variants \\\$S_KEYBOARD_LAYOUT | tr '\\\\n\\\\r' ' ' \\\` \\n\\n\\\"\" \"ru\""
                        #--------
                        alias mmmv_ui_display_keyboard_layout_variants_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_KEYBOARD_LAYOUT='\"  \"' ; printf \\\"\\\\n \\\`localectl list-x11-keymap-variants \\\$S_KEYBOARD_LAYOUT | tr '\\\\n\\\\r' ' ' \\\` \\n\\n\\\"\" "
                        #------------------------------------------------------
                    fi
                fi
            fi
            #--------------------------------------------------------------
        fi
    else
        #--------------------------------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "346d5712-201a-4fb8-a64a-e241d041a7e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        #--------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="f"
if [ "`which mmmv_cre_temporary_file_t1 2> /dev/null`" != "" ]; then
    SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="t"
else
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
            #--------------------------------------------------------------
            # As of 2023 RAM partitions are difficult to use, 
            # if not impossible to use, on 
            # Windows Subsystem for Linux (WSL) and Android Linux.
            #--------------------------------------------------------------
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "mmmv_cre_temporary_file_t1" "7284b167-6d3f-42a6-a82a-e241d041a7e7"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_cre_temporary_file_t1_host_independent"
                if [ -e "$S_TMP_0" ]; then
                    if [ ! -d "$S_TMP_0" ]; then
                        echo -e "The\e[31m mmmv_cre_temporary_file_t1 \e[39mis meant to be a host specific copy of the "
                        echo ""
                        echo -e "\e[33m  $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_cre_temporary_file_t1_host_independent \e[39m"
                        echo ""
                        echo -e "The idea is that the\e[31m mmmv_cre_temporary_file_t1\e[39m can create"
                        echo "temporary files to a RAM-partiton that has been specified at"
                        echo ""
                        echo -e "\e[33m   /etc/fstab \e[39m"
                        echo ""
                        echo "On year 2023 mainstream Linux distributions the "
                        echo -e "line at the\e[33m /etc/fstab \e[39mMIGHT look like "
                        echo -e "\e[33m"
                        echo "tmpfs  /some/folder/created_by_root_and_with_permissions_1777/RAM_10MiB  tmpfs  nodev,size=10M  0 0 "
                        echo -e "\e[39m"
                        echo -e "The motivation for using a custom script like the\e[31m mmmv_cre_temporary_file_t1 \e[39m"
                        echo -e "is that if the\e[31m mmmv_cre_temporary_file_t1 \e[39mis called like "
                        echo ""
                        echo -e "\e[36m    S_TEMPORARY_FILE_PATH=\"\`\e[31mmmmv_cre_temporary_file_t1\e[36m --max_file_size_64KiB \`\"\e[39m"
                        echo ""
                        echo "then the temporary file with a random file name is created to a "
                        echo "RAM partition that has been mounted to a folder that may have . "
                        echo "a host specific path. This increases code reuse by eliminating "
                        echo "temporary file creation code, including file name generation code, "
                        echo "from all Bash scripts that use this script. The use of RAM partition "
                        echo "for storing very short-lived temporary files reduces nonvolatile storage "
                        echo "device wear in cases, where the sync command is used. In the case of "
                        echo "year 2023 mainstream Linux distributions the sync command is "
                        echo "needed in Bash scripts to make sure that a newly created file "
                        echo "is fully present at the file system for reading."
                        echo "GUID=='45c4ac63-f2be-47df-9a50-e241d041a7e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
export PATH="$Z_PATH"
export MMMV_PATH_0="$PATH"
alias mmmv_ui_set_PATH_0="export PATH=\"$MMMV_PATH_0\""
#----------------------------------------
#export MANPATH="$MANPATH"
export MMMV_MANPATH_0="$MANPATH"
alias mmmv_ui_set_MANPATH_0="export MANPATH=\"$MMMV_MANPATH_0\""
#----------------------------------------
export MMMV_LD_LIBRARY_PATH_0="export LD_LIBRARY_PATH=\"$LD_LIBRARY_PATH\""
export CPLUS_INCLUDE_PATH_0="export CPLUS_INCLUDE_PATH=\"$CPLUS_INCLUDE_PATH\""
export C_INCLUDE_PATH_0="export C_INCLUDE_PATH=\"$C_INCLUDE_PATH\""
#----------------------------------------
alias mmmv_ui_reset_PATH_MANPATH_LD_LIBRARY_PATH_CPLUS_INCLUDE_PATH_C_INCLUDE_PATH="export PATH=\"$MMMV_PATH_0\" ; export MANPATH=\"$MMMV_MANPATH_0\" ; export LD_LIBRARY_PATH=\"$MMMV_LD_LIBRARY_PATH_0\" ; export CPLUS_INCLUDE_PATH=\"$CPLUS_INCLUDE_PATH_0\" ; export C_INCLUDE_PATH=\"$C_INCLUDE_PATH_0\" ; "
#--------------------------------------------------------------------------
# This has to be at the very end, because the actions can depend
# on, what is available on PATH. For example, there is no point of 
# crating a cache folder of a program that is not available on PATH.
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_optional_cache_folder_initializations.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export SB_MMMV_USERSPACE_DISTRO_T1_FIRST_SESSION="f" # domain: {"","f","t"}
                                                     # default: "" -> "t"
#--------------------------------------------------------------------------
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    #echo "~/.bashrc execution complete." # might be printed after error messages.
    echo "common_bashrc_main.bash execution complete." # might be printed after error messages.
    #echo "✓" # might be printed after error messages.
fi
#==========================================================================
