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
export MMMV_USERSPACE_DISTRO_T1_VERSION="82411af0-9340-4169-b1eb-63a04001b6e7"
# does not duplicate the 
# S_VERSION_OF_THIS_FILE="4cc0ebef-6e35-447d-87fb-63a04001b6e7" 
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
printf "Running the ~/.bashrc sub-part common_bashrc_main.bash .. " # might take about 30s.
#--------------------------------------------------------------------------
if [ "$MMMV_SB_DEBUG" == "" ]; then
    MMMV_SB_DEBUG="t" # the default
fi
if [ "$MMMV_SB_DEBUG" != "t" ]; then
    if [ "$MMMV_SB_DEBUG" != "f" ]; then
        echo ""
        echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
        echo ""
        echo "    MMMV_SB_DEBUG==\"$MMMV_SB_DEBUG\""
        echo ""
        echo "but the valid values are: \"\", \"t\", \"f\"."
        echo "default: \"\" -> \"t\""
        echo "GUID=='548f12e3-3388-4660-9e3b-63a04001b6e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "" ]; then
    MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS="t" # the default
fi
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" != "t" ]; then
    #----------------------------------------------------------------------
    if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" != "f" ]; then
        echo ""
        echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
        echo ""
        echo "    MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS==\"$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS\""
        echo ""
        echo "but the valid values are: \"\", \"t\", \"f\"."
        echo "default: \"\" -> \"t\""
        echo "GUID=='c2b53e78-6290-42b9-953b-63a04001b6e7'"
        echo ""
    fi
    #----------------------------------------------------------------------
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
        echo ""
        echo -e "\e[31mThe operating system is neither Linux, nor BSD. \e[39m"
        echo "The mmmv aliases are probably not tested "
        echo "with the current operating system."
        echo "GUID=='65b75952-6d3c-486e-961a-63a04001b6e7'"
        echo ""
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
                echo "GUID=='4e952a82-d57a-4d6b-b15a-63a04001b6e7'"
                echo ""
                SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # the default value
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
        echo ""
        echo -e "\e[31mThe S_FP_BASHFILE had a value of an empty string.\e[39m"
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi 
        echo "GUID=='2cd93b55-253d-4f7b-ae1a-63a04001b6e7'"
        echo ""
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ ! -e "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
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
                echo "GUID=='21c13562-b4e8-442a-9449-63a04001b6e7'"
                echo ""
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
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "references a folder, but it must reference a file."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='27e3c0d4-61a1-439b-9459-63a04001b6e7'"
            echo ""
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
            echo ""
            echo -e "\e[31mThe implementation of this function is flawed.\e[39m"
            echo "SB_INCLUSION_POSSIBLE==$SB_INCLUSION_POSSIBLE"
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='1c49a613-d468-427d-b358-63a04001b6e7'"
            echo ""
        fi
    fi
} # func_mmmv_include_bashfile_if_possible_t2


func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1(){
    local S_FP_DECLARATION_BASH="$1"
    #--------
    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1="mode_ok_to_load"
        func_mmmv_include_bashfile_if_possible_t2 "$S_FP_DECLARATION_BASH" \
            "4e24dd65-cfce-422a-a72a-63a04001b6e7"
    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1="mode_loading_complete"
} # func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1

#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1(){
    local S_CONSOLE_PROGRAM_NAME="$1" 
    local S_GUID_CANDIDATE="$2" 
    #--------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe value of the S_GUID_CANDIDATE is an empty string\e[39m,"
        echo "but it is expected to be a GUID."
        echo "GUID=='845cc241-c6c1-443e-a9c8-63a04001b6e7'"
        echo ""
    fi 
    #--------------------
    echo ""
    if [ "$S_CONSOLE_PROGRAM_NAME" != "" ]; then
        echo -e "The console program \"\e[31m$S_CONSOLE_PROGRAM_NAME\e[39m\" is missing form PATH."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='b533afee-4745-45de-a787-63a04001b6e7'"
    else
        echo -e "\e[31mThe value of the S_CONSOLE_PROGRAM_NAME is an empty string\e[39m,"
        echo "but it is expected to be a console program name, which "
        echo "can not be an empty string."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='9218f58f-8877-425c-93a7-63a04001b6e7'"
    fi 
    echo ""
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
            #         "4167536a-2929-4b19-844a-63a04001b6e7"
            # 
            # can not be used here, because its error message 
            # claims that the domain is only {"t","f"}, but
            # in this case the "" is also part of the domain. 
            # 
            if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" != "t" ]; then
                if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" != "f" ]; then
                    if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
                        echo ""
                        echo -e "\e[31mSB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING==\"$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING\"\e[39m"
                        echo "but its domain is: {\"\",\"t\",\"f\"}"
                        echo "GUID=='412a5ca2-45e3-48e1-8a47-63a04001b6e7'"
                        echo ""
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
            echo ""
            echo -e "\e[31mThe value of the S_GUID_CANDIDATE is an empty string\e[39m,"
            echo "but it is expected to be a GUID."
            echo "Leaving at least one alias undefined."
            echo "GUID=='954ed55a-51bd-4913-8616-63a04001b6e7'"
            echo ""
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$S_ALIAS_NAME" == "" ]; then
            echo ""
            echo -e "\e[31mThe value of the S_ALIAS_NAME is an empty string\e[39m,"
            echo "but it is expected to be an alias name."
            echo "Leaving at least one alias undefined."
            echo "GUID=='d2a12545-30b5-42f1-a816-63a04001b6e7'"
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            echo ""
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$S_FP_FOLDER_PATH_CANDIDATE" == "" ]; then
            echo ""
            echo -e "\e[31mThe value of the S_FP_FOLDER_PATH_CANDIDATE is an empty string\e[39m,"
            echo "but it is expected to be a full path to a folder."
            echo "Leaving at least one alias undefined."
            echo "GUID=='2f1c8965-48b2-4a95-b145-63a04001b6e7'"
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            echo ""
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
                "72427990-21d4-481b-b629-63a04001b6e7"
            if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
                echo "Leaving at least one alias undefined."
                echo "GUID=='5c2a3002-30d4-4692-9335-63a04001b6e7'"
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi
                echo ""
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
                echo ""
                echo "The folder "
                echo ""
                echo "    $S_FP_FOLDER_PATH_CANDIDATE"
                echo ""
                echo "exists, but either it is not accessible to the current user"
                echo "or the pwd-value in it differs from the path given to "
                echo "this Bash function."
                echo "Leaving at least one alias undefined."
                echo "GUID=='3b8cdde2-ca66-4688-9c44-63a04001b6e7'"
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi
                echo ""
            fi 
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        S_TMP_0="alias $S_ALIAS_NAME=\"cd $S_FP_FOLDER_PATH_CANDIDATE \""
        eval ${S_TMP_0}
    fi #-------------------------------------------------------------------
    func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
        "$SB_OK2ATTEMPT" "SB_OK2ATTEMPT" \
        "2176a363-65eb-4302-ac59-63a04001b6e7"
    #----------------------------------------------------------------------
    func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
        "$SB_VERIFICATION_FAILED_LOCAL" "SB_VERIFICATION_FAILED_LOCAL" \
        "1fe1ba23-70fb-41cc-bb19-63a04001b6e7"
    if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
        SB_VERIFICATION_FAILED_LOCAL="t"
    fi
    SB_VERIFICATION_FAILED="$SB_VERIFICATION_FAILED_LOCAL"
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_declare_alias_cd_t1

# The tests:
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_01" \
#    "/root" \
#    "3739a1f4-91a2-40f1-b728-63a04001b6e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_02" \
#    "/tmp/olematu" \
#    "481df082-cb62-4afe-b258-63a04001b6e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_03" \
#    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash" \
#    "24bd3234-36f3-4d2a-b627-63a04001b6e7"
#

#--------------------------------------------------------------------------
S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_func_core_t3"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "3b7577d1-73f1-46f1-b727-63a04001b6e7"

func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "grep"
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
        echo ""
        echo -e "\e[31mThe environment variable EDITOR has not been set\e[39m"
        echo "and its initialization to \"$S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME\" "
        echo "failed because the \"$S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME\""
        echo "is missing from PATH."
        echo "GUID=='2a8d61c1-911d-4afb-ac24-63a04001b6e7'"
        echo ""
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
    MMMV_CFLAGS_TEMPLATE=" -march=native $MMMV_CFLAGS_COMMON "  

if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    # For some reason the " -march=native " triggers an error 
    # on Termux, if the classical configure script is run.
    # The error message is something along the lines that 
    # a compiler does not work.
    MMMV_CFLAGS_TEMPLATE=" -mtune=native $MMMV_CFLAGS_COMMON "  
fi
if [ "$CFLAGS" == "" ]; then
    export CFLAGS="$MMMV_CFLAGS_TEMPLATE"
fi
if [ "$CXXFLAGS" == "" ]; then
    export CXXFLAGS="$MMMV_CFLAGS_TEMPLATE"
fi

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
Z_PATH=""
if [ -e "/usr/sbin" ]; then
    # The 
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "/usr/sbin" "f25993f0-7057-4b61-8656-63a04001b6e7"
    # is for displaying an error message, if the "/usr/sbin" is not a folder.
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="/usr/sbin"
    else
        if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
            echo ""
            echo -e "\e[31m The function \e[39m"
            echo -e "\e[31m func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1(...) \e[39m"
            echo -e "\e[31m is flawed. \e[39m"
            echo "GUID=='10beee85-ef92-4667-be34-63a04001b6e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
# Usually the
#export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
# would do, but there are use cases, where user "mmmv" is not used 
# and for that reason the path is derived:
S_TMP_0="`cd $S_FP_DIR/../../../ ; pwd`"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$S_TMP_0" "53b4d11f-82c7-414c-8d36-63a04001b6e7"
if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
    echo ""
    echo -e "\e[31mFailed to derive a value for the MMMV_USERSPACE_DISTRO_T1_HOME .\e[39m"
    echo "Assigning "
    export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
    echo ""
    echo "    MMMV_USERSPACE_DISTRO_T1_HOME:=$MMMV_USERSPACE_DISTRO_T1_HOME"
    echo ""
    echo "GUID=='f14a039a-8c74-423c-8693-63a04001b6e7'"
    echo ""
else
    if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo ""
        echo "     SB_VERIFICATION_FAILED==\"$SB_VERIFICATION_FAILED\" "
        echo ""
        echo "GUID=='1346f6b5-822f-4852-b833-63a04001b6e7'"
        echo ""
    fi
    export MMMV_USERSPACE_DISTRO_T1_HOME="$S_TMP_0"
    S_TMP_1="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin"
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_TMP_1" "3f51a403-2024-4d99-8926-63a04001b6e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="$S_TMP_1:$Z_PATH"
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
        "find" "8266e23e-6e7f-40ce-8b55-63a04001b6e7"
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
        "grep" "1230f021-0c0b-435f-9655-63a04001b6e7"
fi

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
        "wget" "75cb2b69-e4c3-4440-8c44-63a04001b6e7"
fi

SB_CURL_EXISTS_ON_PATH="f"
if [ "`which curl 2> /dev/null`" != "" ]; then
    SB_CURL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "curl" "79bf7c82-f940-411e-8a34-63a04001b6e7"
fi

# aria2 is often times available from distribution package collection.
# https://github.com/aria2
SB_ARIA2C_EXISTS_ON_PATH="f"
if [ "`which aria2c 2> /dev/null`" != "" ]; then
    SB_ARIA2C_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "aria2c" "e5bfc3c4-1c4a-40e7-9a13-63a04001b6e7"
fi

SB_READLINK_EXISTS_ON_PATH="f"
if [ "`which readlink 2> /dev/null`" != "" ]; then
    SB_READLINK_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "readlink" "28206021-523f-4bdc-8a53-63a04001b6e7"
fi

SB_XARGS_EXISTS_ON_PATH="f"
if [ "`which xargs 2> /dev/null`" != "" ]; then
    SB_XARGS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "xargs" "4187f34e-28f9-4b0f-ab23-63a04001b6e7"
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
        "df" "5129079b-3f6e-417c-b812-63a04001b6e7"
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
    #        "xview" "22539bb5-d929-46cb-b932-63a04001b6e7"
    fi
    
    SB_XVIEWER_EXISTS_ON_PATH="f"
    if [ "`which xviewer 2> /dev/null`" != "" ]; then
        SB_XVIEWER_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xviewer" "85cb1143-2912-4792-a652-63a04001b6e7"
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
                "viewnior" "52450323-6d34-41da-8b41-63a04001b6e7"
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
        "chafa" "4113a2b4-309c-449d-9e81-63a04001b6e7"
fi

SB_CATIMG_EXISTS_ON_PATH="f"
if [ "`which catimg 2> /dev/null`" != "" ]; then
    SB_CATIMG_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_catimg="nice -n 3 catimg "
    alias mmmv_image_viewer_for_terminal_catimg_w150="nice -n 3 catimg -w 150 "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "catimg" "a1249de9-dcaf-4fd0-bc11-63a04001b6e7"
fi

SB_MPV_EXISTS_ON_PATH="f"
if [ "`which mpv 2> /dev/null`" != "" ]; then
    SB_MPV_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_mpv_t1="nice -n 3 mpv --quiet --vo=tct "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "mpv" "b3479482-b0cc-4329-be81-63a04001b6e7"
fi

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
        "col" "55eb2f61-15c1-4667-a150-63a04001b6e7"
fi

SB_DMESG_EXISTS_ON_PATH="f"
if [ "`which dmesg 2> /dev/null`" != "" ]; then
    SB_DMESG_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "dmesg" "01598b28-306b-4a73-a320-63a04001b6e7"
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
        "mount" "15679ac4-85de-45ac-834f-63a04001b6e7"
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
        "sh" "c15f6f17-0e88-44c3-8adf-63a04001b6e7"
fi

SB_TCSH_EXISTS_ON_PATH="f"
if [ "`which tcsh 2> /dev/null`" != "" ]; then
    SB_TCSH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tcsh" "1a1a8184-fa39-423f-a33d-63a04001b6e7"
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
# The actual values of the 
# SB_JAVA_EXISTS_ON_PATH and the SB_JAVAC_EXISTS_ON_PATH
# are dependent on the JAVA_HOME and JDK_HOME, 
# which are/will_be_in_the_future analysed at a separate Bash file, 
# $S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_java_related_main.bash"
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
            "gcc" "2e1df863-15dc-49d3-841d-63a04001b6e7"
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
            "g++" "10e33672-0d6f-42a0-831c-63a04001b6e7"
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
            "clang" "59321ae2-7722-43f4-9c5c-63a04001b6e7"
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
            "clang++" "49a9a008-9ffa-412d-994c-63a04001b6e7"
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
        "emacs" "3643b384-d8dc-4e21-904b-63a04001b6e7"
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
        "gawk" "47f58262-144b-4d5a-a72b-63a04001b6e7"
fi
#--------------------
SB_HEAD_EXISTS_ON_PATH="f"
if [ "`which head 2> /dev/null`" != "" ]; then
    SB_HEAD_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "head" "2efb7a14-aaf8-4366-bd4a-63a04001b6e7"
fi
#--------------------
SB_JOE_EXISTS_ON_PATH="f"
if [ "`which joe 2> /dev/null`" != "" ]; then
    SB_JOE_EXISTS_ON_PATH="t"
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
        "printf" "f1df484b-32d0-4bb7-b82a-63a04001b6e7"
fi
#--------------------
SB_SED_EXISTS_ON_PATH="f"
if [ "`which sed 2> /dev/null`" != "" ]; then
    SB_SED_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sed" "3336e537-98f6-4ab6-b749-63a04001b6e7"
fi
#--------------------
SB_SORT_EXISTS_ON_PATH="f"
if [ "`which sort 2> /dev/null`" != "" ]; then
    SB_SORT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sort" "61944823-58a8-4983-b139-63a04001b6e7"
fi
#--------------------
SB_STRINGS_EXISTS_ON_PATH="f"
if [ "`which strings 2> /dev/null`" != "" ]; then
    SB_STRINGS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "strings" "40d74273-6743-4489-9b28-63a04001b6e7"
fi
#--------------------
SB_TR_EXISTS_ON_PATH="f"
if [ "`which tr 2> /dev/null`" != "" ]; then
    SB_TR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tr" "1fa82db2-ce0e-4993-a718-63a04001b6e7"
fi
#--------------------
SB_VIM_EXISTS_ON_PATH="f"
if [ "`which vim 2> /dev/null`" != "" ]; then
    SB_VIM_EXISTS_ON_PATH="t"
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::::web::browsers:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which uzbl 2> /dev/null`"
    SB_UZBL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_UZBL_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_uzbl="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which dillo 2> /dev/null`"
    SB_DILLO_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DILLO_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_dillo="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which netsurf 2> /dev/null`"
    SB_NETSURF_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NETSURF_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_netsurf="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which rekonq 2> /dev/null`"
    SB_REKONQ_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_REKONQ_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_rekonq="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which midori 2> /dev/null`"
    SB_MIDORI_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_MIDORI_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_midori="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which iceweasel 2> /dev/null`"
    SB_ICEWEASEL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_ICEWEASEL_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_iceweasel="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which firefox 2> /dev/null`"
    SB_FIREFOX_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FIREFOX_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_firefox="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which qutebrowser 2> /dev/null`"
    SB_QUTEBROWSER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_QUTEBROWSER_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_qutebrowser="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which epiphany 2> /dev/null`"
    SB_EPIPHANY_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_EPIPHANY_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_epiphany="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which konqueror 2> /dev/null`"
    SB_KONQUEROR_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_KONQUEROR_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_konqueror="nice -n 5 $S_TMP_0 "
        alias mmmv_filemanager_konqueror="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which falkon 2> /dev/null`"
    SB_FALKON_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FALKON_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_falkon="nice -n 5 $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which falcon 2> /dev/null`"
    SB_FALCON_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FALCON_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_falcon="nice -n 5 $S_TMP_0 "
    fi
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
        "lftp" "ac5689db-3cae-45d1-a028-63a04001b6e7"
fi
#--------------------
SB_PUTTY_EXISTS_ON_PATH="f"
if [ "`which putty 2> /dev/null`" != "" ]; then
    SB_PUTTY_EXISTS_ON_PATH="t"
fi
#--------------------
SB_RSYNC_EXISTS_ON_PATH="f"
if [ "`which rsync 2> /dev/null`" != "" ]; then
    SB_RSYNC_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rsync" "9475bb5b-4157-44d9-b827-63a04001b6e7"
fi
#--------------------
SB_SSH_EXISTS_ON_PATH="f"
if [ "`which ssh 2> /dev/null`" != "" ]; then
    SB_SSH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "ssh" "544e6021-f329-4c3c-8b57-63a04001b6e7"
fi
#--------------------
SB_SCP_EXISTS_ON_PATH="f"
if [ "`which scp 2> /dev/null`" != "" ]; then
    SB_SCP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "scp" "37fa1b75-3f77-4297-9926-63a04001b6e7"
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
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        S_TMP_0="`which gitg 2> /dev/null`"
        SB_GITG_EXISTS_ON_PATH="f"
        if [ "$S_TMP_0" != "" ]; then
            SB_GITG_EXISTS_ON_PATH="t"
            if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_gitg="nice -n 19 $S_TMP_0 "
            else
                echo ""
                echo -e "\e[31mgitg exists on PATH while the git is missing.\e[39m"
                echo "GUID=='304903b5-aee2-48e8-8722-63a04001b6e7'"
                echo ""
            fi
        fi
        S_TMP_0="`which gitk 2> /dev/null`"
        SB_GITK_EXISTS_ON_PATH="f"
        if [ "$S_TMP_0" != "" ]; then
            SB_GITK_EXISTS_ON_PATH="t"
            if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_gitk="nice -n 19 $S_TMP_0 "
            else
                echo ""
                echo -e "\e[31mgitk exists on PATH while the git is missing.\e[39m"
                echo "GUID=='342bd0b3-489f-45e7-b842-63a04001b6e7'"
                echo ""
            fi
            if [ "$SB_GITG_EXISTS_ON_PATH" == "f" ]; then
                echo ""
                echo -e "\e[31mgitk exists on PATH while the gitg is missing.\e[39m"
                # As of 2021 the gitk has an optionally available 
                # menu option that depends on the gitg.
                echo "GUID=='6cb152f1-6ad4-4db4-8622-63a04001b6e7'"
                echo ""
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
            "bison" "2d139042-9f67-40ca-ba16-63a04001b6e7"
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
            "re2c" "a193da47-8c51-457a-8b25-63a04001b6e7"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="`which yacc 2> /dev/null`"
    SB_YACC_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_YACC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "yacc" "36bc1241-fe08-4178-8d35-63a04001b6e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::compression::software::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
SB_TAR_EXISTS_ON_PATH="f"
if [ "`which tar 2> /dev/null`" != "" ]; then
    SB_TAR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tar" "40a7ec15-7585-4cb0-8744-63a04001b6e7"
fi
#--------------------
SB_GZIP_EXISTS_ON_PATH="f"
if [ "`which gzip 2> /dev/null`" != "" ]; then
    SB_GZIP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gzip" "56663f25-28db-4aed-8934-63a04001b6e7"
fi
#--------------------
SB_GUNZIP_EXISTS_ON_PATH="f"
if [ "`which gunzip 2> /dev/null`" != "" ]; then
    SB_GUNZIP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gunzip" "58b63fe1-ceff-488a-b743-63a04001b6e7"
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
        "pigz" "816d638e-23cf-41f2-a193-63a04001b6e7"
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
        "xz" "74df9c0e-e582-49b0-b433-63a04001b6e7"
fi
#--------------------
SB_UNXZ_EXISTS_ON_PATH="f"
if [ "`which unxz 2> /dev/null`" != "" ]; then
    SB_UNXZ_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "unxz" "2eeaaba2-2cfd-4a50-b232-63a04001b6e7"
fi
#--------------------
SB_RAR_EXISTS_ON_PATH="f"
if [ "`which rar 2> /dev/null`" != "" ]; then
    SB_RAR_EXISTS_ON_PATH="t"
else
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rar" "291a71ff-26c8-4686-b872-63a04001b6e7"
    fi
fi
#--------------------
SB_UNRAR_EXISTS_ON_PATH="f"
if [ "`which unrar 2> /dev/null`" != "" ]; then
    SB_UNRAR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "unrar" "41fb6c84-9e14-4dc6-8d41-63a04001b6e7"
fi
#--------------------
SB_ARJ_EXISTS_ON_PATH="f"
if [ "`which arj 2> /dev/null`" != "" ]; then
    SB_ARJ_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "arj" "2a4b3c94-47f1-4670-9a41-63a04001b6e7"
fi
#--------------------
SB_XAR_EXISTS_ON_PATH="f"
if [ "`which xar 2> /dev/null`" != "" ]; then
    SB_XAR_EXISTS_ON_PATH="t"
#else
#    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
#        "xar" "46afb672-34af-4aec-a650-63a04001b6e7"
fi
if [ "$SB_XZ_EXISTS_ON_PATH" != "" ]; then
    #----------------------------------------
    if [ "$SB_XZ_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_XAR_EXISTS_ON_PATH" == "t" ]; then
            if [ "$XZ_DEFAULTS" != "" ]; then
                alias mmmv_xar="XZ_DEFAULTS=\"$XZ_DEFAULTS\" nice -n 17 xar --toc-cksum=sha256 --compression=xz  --compression-args=9 --coalesce-heap --keep-existing "
            else
                echo ""
                echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
                echo ""
                echo "     XZ_DEFAULTS==\"$XZ_DEFAULTS\" "
                echo ""
                echo "GUID=='1b9d53c2-55b0-4ed1-8322-63a04001b6e7'"
                echo ""
            fi
        fi
    else
        if [ "$SB_XZ_EXISTS_ON_PATH" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo ""
            echo "     SB_XZ_EXISTS_ON_PATH==\"$SB_XZ_EXISTS_ON_PATH\" "
            echo ""
            echo "GUID=='1784bcc3-c794-401f-8431-63a04001b6e7'"
            echo ""
        fi
    fi
    #----------------------------------------
else
    echo ""
    echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
    echo ""
    echo "     SB_XZ_EXISTS_ON_PATH==\"$SB_XZ_EXISTS_ON_PATH\" "
    echo ""
    echo "GUID=='2797c084-2d3e-49b8-9721-63a04001b6e7'"
    echo ""
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
            "autoconf" "41f5335c-9d16-426f-b550-63a04001b6e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------
SB_BASE64_EXISTS_ON_PATH="f"
if [ "`which base64 2> /dev/null`" != "" ]; then
    SB_BASE64_EXISTS_ON_PATH="t"
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
                "debtree" "1ef54446-94f8-43d0-bf5f-63a04001b6e7"
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
    #        "libtool" "13c60de5-cca3-46c1-945f-63a04001b6e7"
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
            "m4" "5b87f0a2-e080-4277-be2e-63a04001b6e7"
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
                "make" "b49d57f4-6e25-462e-953e-63a04001b6e7"
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
        # mmmv_userspace_distro_t1/attic/documentation: 
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
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_RESIZE_EXISTS_ON_PATH="f"
    if [ "`which resize 2> /dev/null`" != "" ]; then
        SB_RESIZE_EXISTS_ON_PATH="t"
        alias mmmv_ui_display_active_terminal_dimensions_in_characters_t1="nice -n 5 resize "
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "resize" "957a3bf1-ea3b-4b97-ba3d-63a04001b6e7"
    fi
fi
#--------------------
SB_SHRED_EXISTS_ON_PATH="f"
if [ "`which shred 2> /dev/null`" != "" ]; then
    SB_SHRED_EXISTS_ON_PATH="t"
    alias mmmv_fs_secure_erase_shred_1="nice -n 5 shred --force --iterations=1 -u "
    alias mmmv_fs_secure_erase_shred_3="nice -n 5 shred --force --iterations=3 -u "
    alias mmmv_fs_secure_erase_shred_5="nice -n 5 shred --force --iterations=5 -u "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "shred" "2415dbc3-3c7c-4bd8-963d-63a04001b6e7"
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_SNAP_EXISTS_ON_PATH="f"
    if [ "`which snap 2> /dev/null`" != "" ]; then
        SB_SNAP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "snap" "4359eeb3-bc00-4a92-a92d-63a04001b6e7"
        echo -e "\e[33mOn Debian the snap might be installed by \e[39m"
        echo -e "\e[33m    apt-get install snapd \e[39m# yes, not the "snap", but "snapd"."
        echo ""
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
        "uuencode" "ee9e7f14-9db7-4f6c-a72c-63a04001b6e7"
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
        echo -e "In the case of Debian and Termux the \"\e[33muuencode\e[39m\""
        echo -e "\e[33mMIGHT be part of the package \"sharutils\". \e[39m"
        echo "GUID=='4f550bc1-9703-41ac-a6e1-63a04001b6e7'"
        echo ""
    fi
fi
#--------------------
SB_UUDECODE_EXISTS_ON_PATH="f"
if [ "`which uudecode 2> /dev/null`" != "" ]; then
    SB_UUDECODE_EXISTS_ON_PATH="t"
else
    if [ "$SB_UUENCODE_EXISTS_ON_PATH" == "t" ]; then
       func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
           "uudecode" "2724ae74-74fc-4c40-992c-63a04001b6e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
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
            "xdotool" "93d35b2a-ba5e-4212-925b-63a04001b6e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_WMCTRL_EXISTS_ON_PATH="f"
    if [ "`which wmctrl 2> /dev/null`" != "" ]; then
        SB_WMCTRL_EXISTS_ON_PATH="t"
        #--------
        if [ "$SB_XDOTOOL_EXISTS_ON_PATH" == "t" ]; then
            # https://gist.github.com/platan/e63b465c2fcfe3d0cccd
            # archival copy:https://archive.ph/PZhM8 
            alias mmmv_ui_maximize_active_window_t1="nice -n 3 wmctrl -i -r \"\`xdotool getactivewindow\`\" -b add,maximized_vert,maximized_horz "
        fi
        #--------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "wmctrl" "1a26bd51-e1ef-4fef-9b1b-63a04001b6e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_FCCACHE_EXISTS_ON_PATH="f"
    if [ "`which fc-cache 2> /dev/null`" != "" ]; then
        SB_FCCACHE_EXISTS_ON_PATH="t"
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
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "fc-cache" "f88c5ea2-b377-4932-ad5a-63a04001b6e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_IPTABLES_EXISTS_ON_PATH="f"
    if [ "`which iptables 2> /dev/null`" != "" ]; then
        SB_IPTABLES_EXISTS_ON_PATH="t"
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "iptables" "2eb0dd82-fe70-4ab8-805a-63a04001b6e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_UFW_EXISTS_ON_PATH="f"
    if [ "$SB_IPTABLES_EXISTS_ON_PATH" == "t" ]; then
        # https://launchpad.net/ufw
        # ufw is an iptables wrapper.
        # There MIGHT be some further documentation aobut the UFW at
        # $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/third_party_documentation/Linux_and_Bash/Linux_firewalls/UFW
        if [ "`which ufw 2> /dev/null`" != "" ]; then
            SB_UFW_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "ufw" "10595781-3bfa-4195-a539-63a04001b6e7"
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
                "gufw" "0325930a-b1e0-48e1-a149-63a04001b6e7"
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
    #         "iptables" "e5665c1b-ab5c-4f36-a738-63a04001b6e7"
    fi
fi
#--------------------------------------------------------------------------
#alias mmmv_visudo="visudo -f /etc/sudoers.d/mmmv_sudoers_seadistus "
#--------------------------------------------------------------------------
S_WHOAMI="`whoami`"
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
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "e546426a-759e-428e-8728-63a04001b6e7"

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
                "39575182-9726-49a3-a557-63a04001b6e7" 
        fi
    else
        if [ -h "$S_FP_0" ]; then # broken symlink
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_0" "33c5c522-95fc-4b8c-8527-63a04001b6e7"
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
# from studying this huge ./common_bashrc_main.txt , 
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
#S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_java_related_main.bash"
#func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# has to be included only after the application delcaration 
# Bash scripts have been included.


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
FP_MMMV_BASHRC="$HOME/.mmmv/mmmv_bashrc"
FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH="$FP_MMMV_BASHRC/dynamic_symlinks_on_PATH"
SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="f"
#--------
if [ ! -e "$FP_MMMV_BASHRC" ]; then
    mkdir -p $FP_MMMV_BASHRC 
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV_BASHRC" "fc1e8d2c-ed37-4c8f-8256-63a04001b6e7"
fi
#--------
if [ -e "$FP_MMMV_BASHRC" ]; then
    if [ -d "$FP_MMMV_BASHRC" ]; then
        if [ ! -e "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
            mkdir -p $FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH 
            func_mmmv_wait_and_sync_t1
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" "1423e931-e007-458c-ad36-63a04001b6e7"
            if [ -e "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="t"
            fi
        else
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" "5c530d20-4937-4295-a555-63a04001b6e7"
            if [ -d "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="t"
            fi
        fi
    fi
fi
#--------
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
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_CENTRAL "
            echo ""
            echo "is a broken symlink."
            echo "GUID=='4e351bc4-ffe0-4aa6-9b30-63a04001b6e7'"
            echo ""
        else
            if [ -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a symlink to a folder, but "
                echo "it must be a file or a symlink to a file."
                echo "GUID=='b4a92ad2-f6a1-4df3-9050-63a04001b6e7'"
                echo ""
            fi
        fi
    else
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_CENTRAL "
            echo ""
            echo "is missing."
            echo "GUID=='429b4600-cc9d-455f-8680-63a04001b6e7'"
            echo ""
        else
            if [ -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a folder, but it must be a file or a symlink to a file."
                echo "GUID=='bd44c508-3326-43d8-b3cf-63a04001b6e7'"
                echo ""
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
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a symlink to a folder, but "
                    echo "it must be a file or a symlink to a file."
                    echo "GUID=='1ac6b625-4634-4a02-803f-63a04001b6e7'"
                    echo ""
                fi
            fi # symlink_is_not_broken(S_FP_LOCAL)
        else # file or folder, not a symlink
            if [ -e "$S_FP_LOCAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ -d "$S_FP_LOCAL" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a folder, but it must be "
                    echo "a file or a symlink to a file."
                    echo "GUID=='de3e80b4-d48e-4a57-a03d-63a04001b6e7'"
                    echo ""
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
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_LOCAL "
                echo ""
                echo "is a broken symlink to the "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "GUID=='1f047b04-4849-4ccf-9e5d-63a04001b6e7'"
                echo ""
            fi
        else
            if [ ! -e $S_FP_LOCAL ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_LOCAL "
                echo ""
                echo "is missing."
                echo "GUID=='525319a7-93a1-4542-99bc-63a04001b6e7'"
                echo ""
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
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_CENTRAL "
            echo ""
            echo "is a broken symlink."
            echo "GUID=='5f784ad3-cb13-4c12-8d5c-63a04001b6e7'"
            echo ""
        else
            if [ ! -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a symlink to a file, but "
                echo "it must be a folder or a symlink to a folder."
                echo "GUID=='e502d3d8-9df8-4c95-be4b-63a04001b6e7'"
                echo ""
            fi
        fi
    else
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_CENTRAL "
            echo ""
            echo "is missing."
            echo "GUID=='a11ea072-03ca-4afa-a41b-63a04001b6e7'"
            echo ""
        else
            if [ ! -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a file, but it must be a folder or a symlink to a folder."
                echo "GUID=='1be8d625-59ce-45b3-ae3a-63a04001b6e7'"
                echo ""
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
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a symlink to a file, but "
                    echo "it must be a folder or a symlink to a folder."
                    echo "GUID=='5f95b1f2-0d8d-4b47-b02a-63a04001b6e7'"
                    echo ""
                fi
            fi # symlink_is_not_broken(S_FP_LOCAL)
        else # file or folder, not a symlink
            if [ -e "$S_FP_LOCAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ ! -d "$S_FP_LOCAL" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a file, but it must be "
                    echo "a folder or a symlink to a folder."
                    echo "GUID=='14f1f494-bc11-40f2-ba3a-63a04001b6e7'"
                    echo ""
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
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_LOCAL "
                echo ""
                echo "is a broken symlink to the "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "GUID=='3f35d82e-307a-4944-abd9-63a04001b6e7'"
                echo ""
            fi
        else
            if [ ! -e $S_FP_LOCAL ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_LOCAL "
                echo ""
                echo "is missing."
                echo "GUID=='ba584a41-0436-4d5d-8249-63a04001b6e7'"
                echo ""
            fi
        fi
    fi # SB_OK_TO_CREATE_LINK === "t"
} # func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1

#--------------------------------------------------------------------------
S_FP_VIMRC_HOME="$HOME/.vimrc"
S_FP_VIMRC_CENTRAL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_vimrc"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_VIMRC_HOME" \
  "$S_FP_VIMRC_CENTRAL" 


S_FP_OCTAVERC_HOME="$HOME/.octaverc"
S_FP_OCTAVERC_CENTRAL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_octaverc"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_OCTAVERC_HOME" \
  "$S_FP_OCTAVERC_CENTRAL" 

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
            "$S_FP_FONTS_HOME" "7b7c3cb0-f3ca-4ef0-bd15-63a04001b6e7"
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
                # https://www.techrepublic.com/blog/linux-and-open-source/how-do-i-install-and-use-fonts-in-linux/
                # archival copy: https://archive.vn/UgphK
                nice -n 15 fc-cache -f -v 
                # Related Bash alias: mmmv_admin_refresh_fonts_cache_t1
            fi
        else
            # Outputs an error message.
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_FONTS_HOME" "1e730461-0f40-40ad-b524-63a04001b6e7"
        fi
    fi
fi
#--------------------------------------------------------------------------
FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS="$HOME/.vim/manually_installed_plugins"
if [ ! -e "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" ]; then
    if [ -h "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" ]; then
        echo ""
        echo "The"
        echo "    $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS"
        echo ""
        echo "is a broken symlink."
        echo "GUID=='d1ed9296-8086-49d6-8158-63a04001b6e7'"
        echo ""
    else
        mkdir -p $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS
        func_mmmv_wait_and_sync_t1
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
            "18ee5eb3-98a7-4f09-9814-63a04001b6e7"
    fi
else
    # The next line gives an error message, if it is a file.
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
        "40e134f5-f138-4b3d-a754-63a04001b6e7"
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
alias mmmv_gem_install_set_00_basic_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_00"
alias mmmv_gem_install_set_01_additional_database_engines="$S_TMP_0 $S_TMP_LIST_OF_GEMS_01"
alias mmmv_gem_install_set_02_scientific_computing="$S_TMP_0 $S_TMP_LIST_OF_GEMS_02"
alias mmmv_gem_install_set_03_communication_applications="$S_TMP_0 $S_TMP_LIST_OF_GEMS_03"
alias mmmv_gem_install_set_04_development_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_04"
alias mmmv_gem_install_all_mmmv_gem_sets=" \
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
    alias mmmv_gem_install_proxy="$S_TMP_0"
    alias mmmv_gem_install_set_00_basic_tools_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_00"
    alias mmmv_gem_install_set_01_additional_database_engines_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_01"
    alias mmmv_gem_install_set_02_scientific_computing_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_02"
    alias mmmv_gem_install_set_03_communication_applications_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_03"
    alias mmmv_gem_install_set_04_development_tools_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_04"
    alias mmmv_gem_install_all_mmmv_gem_sets_proxy="$S_TMP_0 \
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
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "28fe6bc1-3138-4215-83b3-63a04001b6e7"
fi

S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_create_redirection_HTML_t1"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "4ba7dd9b-bd9c-4390-b563-63a04001b6e7"

if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_find_t1"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "2af94474-cf55-4b69-a722-63a04001b6e7"
fi
#--------------------------------------------------------------------------
S_TMP_0="`echo $LANG | grep UTF-8 `"
if [ "$S_TMP_0" == "" ]; then
    echo ""
    echo "The environment variable "
    echo ""
    echo "    LANG==\"$LANG\""
    echo ""
    echo "does not have a value with the required suffix of \"UTF-8\"."
    echo "Some of the possible accepted values are:"
    echo "\"en_GB.UTF-8\", \"en_US.UTF-8\", \"C.UTF-8\"."
    echo "GUID=='bd18ed31-2148-4842-90a8-63a04001b6e7'"
    echo ""
    # The UTF-8 locale is required by the Mosh .
    # https://mosh.org/
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
    S_TMP_2="GUID=='3e0a3003-7278-4154-b017-63a04001b6e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
if [ "`which fusermount 2> /dev/null`" == "" ]; then
    # The fusermount is for unmounting data carriers 
    # that are mounted with the sshfs.
    S_TMP_0="The fusermount was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='2f2b3345-d23e-4901-8217-63a04001b6e7'"
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
                "2529f843-6322-4eeb-b542-63a04001b6e7"
        fi # whoami === root
    fi
    #----------------------------------------------------------------------
    S_TMP_2="/snap"
    if [ -e $S_TMP_2 ]; then
        if [ -d $S_TMP_2 ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_TMP_2" "c3d720c2-a79f-4842-a321-63a04001b6e7" 
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
                "$S_TMP_2" "e3ce348f-aaf8-45fd-b011-63a04001b6e7"
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
    S_FP_TASKLIST_EXE="/mnt/c/Windows/System32/tasklist.exe"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TASKLIST_EXE" "3f834130-7edc-49a3-9a21-63a04001b6e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="vcxsrv.exe"
        S_TMP_1="`$S_FP_TASKLIST_EXE | grep \"$S_TMP_0\" `"
        if [ "$S_TMP_1" == "" ]; then
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
                echo "GUID=='e0d71973-8d21-4365-a026-63a04001b6e7'"
            else
                echo ""
                echo "X11 not available." # as probabilistically expected, so 
                # no long distracting texts needed.
                echo "GUID=='c4e34d31-a9b7-4019-ba26-63a04001b6e7'"
            fi
            echo ""
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
        "36778962-a9fd-4849-aa41-63a04001b6e7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    alias dmesg="sudo /bin/dmesg "
    #alias hddtemp="sudo /usr/sbin/hddtemp "
    #----------------------------------------------------------------------
    if [ "$SB_USERNAME_IS_root" == "t" ]; then
        # WSL specific way to mount the DVD/CDRW drive.
        alias mmmv_admin_mount_DVD_t1="mount -t drvfs D: /mnt/d "
    else
        func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
            "$SB_USERNAME_IS_root" \
            "5c777e53-4452-42a4-9a50-63a04001b6e7"
    fi
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
            "7473f662-e934-4c87-9840-63a04001b6e7" 
    else
        if [ "$SB_ABSENCE_DETECTED" != "t" ]; then
            echo ""
            echo -e "\e[31mThe code in this function is flawed.\e[39m"
            echo "SB_ABSENCE_DETECTED==\"$SB_ABSENCE_DETECTED\"."
            echo "GUID=='95510cb7-34fe-46a1-9016-63a04001b6e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
} # func_FreeBSD_userspace_specific_declarations
#--------------------------------------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX" "SB_OPERATINGSYSTEM_LINUX" \
    "93e1041d-c080-4dbb-9b50-63a04001b6e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_WSL" "SB_OPERATINGSYSTEM_LINUX_WSL" \
    "34492c43-2c81-41f9-ba20-63a04001b6e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID" "SB_OPERATINGSYSTEM_LINUX_ANDROID" \
    "3c1fdec6-41a2-4786-9090-63a04001b6e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" "SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" \
    "e6e47d34-8f7b-4bc2-8f10-63a04001b6e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD" "SB_OPERATINGSYSTEM_BSD" \
    "1d7b5be2-7e6e-4ac8-914f-63a04001b6e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD_FREEBSD" "SB_OPERATINGSYSTEM_BSD_FREEBSD" \
    "39d5f484-d95c-4554-bb4f-63a04001b6e7"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo "GUID=='6274d2e4-e59d-495e-a625-63a04001b6e7'"
        echo ""
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo "GUID=='b15f9998-8842-4502-ab55-63a04001b6e7'"
        echo ""
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo "GUID=='489c23c3-9058-4f65-9624-63a04001b6e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo "GUID=='40436cf1-af41-41c1-b954-63a04001b6e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_BSD_FREEBSD" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo "GUID=='03dac1ba-8746-41c3-a933-63a04001b6e7'"
        echo ""
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
            alias mmmv_admin_create_symlink_to_cupspdf_t1="S_FP_LINK=\"\$HOME/CUPS_PDF\" ; S_FP_CUPSPDF_OUTPUT_DIR=\"/var/spool/cups-pdf/\$S_WHOAMI\" ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR\" ]; then if [ -d \"\$S_FP_CUPSPDF_OUTPUT_DIR\" ]; then if [ -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"Something with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='350f3e64-b3c8-4aa0-b533-63a04001b6e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"A broken symlink with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='3757f3f4-aab8-4ca3-8132-63a04001b6e7'\" ; echo \"\" ; else ln -s \"\$S_FP_CUPSPDF_OUTPUT_DIR\" \"\$S_FP_LINK\" ; sync; wait; sync ;  if [ ! -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo -e \"\e[31mFailed to create symlink \e[39m\" ; echo \"    \$S_FP_LINK\" ; echo \"    -->\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR\" ; echo \"GUID=='0b44a3f3-6ceb-449c-b252-63a04001b6e7'\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR\" ; if [ -h \"\$S_FP_CUPSPDF_OUTPUT_DIR\" ]; then echo \"is a symlink to a file, but a folder is expected.\" ; else echo \"is a file, but a folder is expected.\" ; fi ; echo \"GUID=='37ad2825-aa57-4cf7-8c41-63a04001b6e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\e[31mFolder is missing. \e[39m\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR\" ; echo \"It MIGHT be that the cups-pdf has not been installed.\" ; echo \"GUID=='5842b8b5-e1dd-4e8a-bb21-63a04001b6e7'\" ; echo \"\" ; fi ;"
            # except the GUIDs, is:
            #     S_FP_LINK="$HOME/CUPS_PDF" ;
            #     #S_FP_CUPSPDF_OUTPUT_DIR="/var/spool/cups-pdf/$S_WHOAMI" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR="/var/spool/cups-pdf/`whoami`" ;
            #     if [ -e "$S_FP_CUPSPDF_OUTPUT_DIR" ]; then 
            #         if [ -d "$S_FP_CUPSPDF_OUTPUT_DIR" ]; then 
            #             if [ -e "$S_FP_LINK" ]; then
            #                 echo "" ;
            #                 echo "Something with the path of " ;
            #                 echo "    $S_FP_LINK" ;
            #                 echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                 echo "GUID=='2212cf5f-9e7a-4b0c-9351-63a04001b6e7'" ;
            #                 echo "" ;
            #             else
            #                 if [ -h "$S_FP_LINK" ]; then
            #                     echo "" ;
            #                     echo "A broken symlink with the path of " ;
            #                     echo "    $S_FP_LINK" ;
            #                     echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                     echo "GUID=='17d8d095-8fd4-484e-b140-63a04001b6e7'" ;
            #                     echo "" ;
            #                 else
            #                     ln -s "$S_FP_CUPSPDF_OUTPUT_DIR" "$S_FP_LINK" ;
            #                     sync; wait; sync ;  
            #                     if [ ! -e "$S_FP_LINK" ]; then 
            #                         echo "" ;
            #                         echo -e "\e[31mFailed to create symlink \e[39m" ;
            #                         echo "    $S_FP_LINK" ;
            #                         echo "    -->" ;
            #                         echo "    $S_FP_CUPSPDF_OUTPUT_DIR" ;
            #                         echo "GUID=='bebd8ee1-0a32-4262-9f20-63a04001b6e7'" ;
            #                         echo "" ;
            #                     fi ;
            #                 fi ;
            #             fi ;
            #         else 
            #             echo "" ;
            #             echo "The " ;
            #             echo "    $S_FP_CUPSPDF_OUTPUT_DIR" ;
            #             if [ -h "$S_FP_CUPSPDF_OUTPUT_DIR" ]; then 
            #                 echo "is a symlink to a file, but a folder is expected." ;
            #             else 
            #                 echo "is a file, but a folder is expected." ;
            #             fi ;
            #             echo "GUID=='27a18b91-72ec-4792-b44f-63a04001b6e7'" ;
            #             echo "" ;
            #         fi ;
            #     else 
            #         echo "" ;
            #         echo -e "\e[31mFolder is missing. \e[39m" ;
            #         echo "    $S_FP_CUPSPDF_OUTPUT_DIR" ;
            #         echo "It MIGHT be that the cups-pdf has not been installed." ;
            #         echo "GUID=='15d9baf4-0fa9-4b71-893f-63a04001b6e7'" ;
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
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo "GUID=='838133d5-733f-4ea3-824e-63a04001b6e7'"
        echo ""
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
        S_GUID_CANDIDATE_OPTIONAL="1bb77da3-6104-4db2-875f-63a04001b6e7"
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
                echo ""
                echo "A mmmv_userspace_distro_t1 related "
                echo -e "\e[31msubpart of the ~/.bashrc is flawed\e[39m."
                echo "    SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL==\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\""
                echo "GUID=='e3ff8009-5d7e-448b-9d5e-63a04001b6e7'"
                echo ""
            fi
        fi
    fi
    #----------------------------------------------------------------------
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL"
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
        #                    echo \"GUID=='135e994f-b274-4390-994d-63a04001b6e7'\"; \
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
        #                echo \"GUID=='2ac92195-020e-4e8d-ab4d-63a04001b6e7'\"; \
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
        #            echo \"GUID=='5aa86662-6f35-4014-9d3c-63a04001b6e7'\"; \
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
        #        echo \"GUID=='22bc2e53-8490-4fa6-be1c-63a04001b6e7'\"; \
        #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #            echo \"$S_ERR_MSG_SUBPART_01\"; \
        #        fi;\
        #        echo \"\"; \
        #    fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the 
        alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='25fa3d51-8197-4e2d-ae4b-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='a2a243de-7d35-4cba-a93b-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='e5d1e1a6-feb5-4ece-a52a-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='4b738c92-8167-4b64-942a-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #--------------------
        # The following versions are older versions that have been tested to work.
        #alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='1e2529b2-5ab2-4795-8159-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='3ba54484-1438-4689-a249-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='c84fec56-19a5-46cb-ab89-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='f259bb5b-22ff-42e0-ac18-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #     alias $S_ALIAS_NAME="if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; sync; wait; else echo \"\"; echo \"The file $S_FP_NEW already exists. Not overwriting.\"; echo \"GUID=='1444b604-0d60-4541-8d18-63a04001b6e7'\"; $S_ERR_MSG_SUBPART_01 echo \"\"; fi "
        #     alias $S_ALIAS_NAME="if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='7135b34f-156e-41cf-a247-63a04001b6e7'\"; $S_ERR_MSG_SUBPART_01 echo \"\"; fi else echo \"\"; echo \"The file \"; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='50d353f3-0b6b-4985-8837-63a04001b6e7'\"; $S_ERR_MSG_SUBPART_01 echo \"\"; fi "
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
        S_GUID_CANDIDATE_OPTIONAL="1ea42413-5588-4959-974f-63a04001b6e7"
    else
        #S_ERR_MSG_SUBPART_01="echo \"S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'\" ; "
        S_ERR_MSG_SUBPART_01="S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'"
    fi
    #----------------------------------------------------------------------
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL"
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
        #                    echo \"GUID=='830a7d15-7d5a-436b-83c6-63a04001b6e7'\"; \
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
        #                echo \"GUID=='029f28d5-1d6e-4194-9d16-63a04001b6e7'\"; \
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
        #            echo \"GUID=='73bd6dc8-5885-439a-9845-63a04001b6e7'\"; \
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
        #        echo \"GUID=='65b09722-acb1-489b-a615-63a04001b6e7'\"; \
        #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #            echo \"$S_ERR_MSG_SUBPART_01\"; \
        #        fi;\
        #        echo \"\"; \
        #    fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the 
        alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then nice -n 10 tar -xzf $S_FP_TEMPLATE ./ ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; if [ -d \"$S_FP_NEW\" ]; then if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a folder with the path of \"; else echo \"Created a new folder with the path of \"; fi; else if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a file with the path of \"; else echo \"Created a new file with the path of \"; fi; fi; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='3d302c44-3357-4b40-8b44-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='13d5c362-fb6e-4489-9c44-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='226003e3-734e-4e28-aa33-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='2e72bc4f-22ef-4499-8a23-63a04001b6e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #--------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_tar_gz_t1

#--------------------------------------------------------------------------
S_TMP_CMD_CRE_GIT_CLONE="cp $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/pull_new_version_from_git_repository.bash ./ ; mkdir -p ./the_repository_clones ; sync ; wait ; "
alias mmmv_cre_git_clone="$S_TMP_CMD_CRE_GIT_CLONE"

# The next line
S_TMP_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_github_repos_2_clonescript_bash_t1.rb"
# uses a full path, because at this line the 
#    $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin
# is only on the Z_PATH, not yet on PATH.

func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_TMP_FP_0" "5e325f8a-39de-4d1e-98df-63a04001b6e7"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="mkdir -p ./src_from_GitHub ; sync ; wait ; cd ./src_from_GitHub ; $S_TMP_CMD_CRE_GIT_CLONE cd ./the_repository_clones ; wait ; echo \"\" ; echo \"The working directory shifted to\" ; echo \"\" ; echo \"    ./src_from_GitHub/the_repository_clones\" ; "
        alias mmmv_cre_git_clone_collection_from_GitHub_t1="$S_TMP_0 ruby -e 's_username=ARGV[0]; s_cmd=\"$S_TMP_FP_0 https://github.com/\"+s_username ; exec(s_cmd) ' "
        alias mmmv_cre_git_clone_collection_from_GitHub_t2="$S_TMP_0 $S_TMP_FP_0 "
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_fossil_clone" "mmmv_Fossil_operator_t1.bash" \
    "e2b458d1-8d67-4780-a81f-63a04001b6e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_tunnel_creation_script_template_t1" "ssh_tunnel_t1.bash" \
    "4d558c65-749d-48ea-ac2e-63a04001b6e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_WARC_Tools" "2016_12_xx_WARC_tools.tar.xz" \
    "2627f911-4fa8-4faf-9f3e-63a04001b6e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SQL_dump_script" "create_backup_from_MySQL_db.bash" \
    "2ed97094-8bad-48ad-9b3e-63a04001b6e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_disassembly_and_reassembly_script_t1" "disassembly_and_reassembly_t1.bash" \
    "2c1e8a52-1f24-4d0e-a85e-63a04001b6e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_config_template" "_ssh_config_template.txt" \
    "21d672e5-f212-4056-b74d-63a04001b6e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_bashrc_minimalistic_template_01" "_bashrc_minimalistic_template_01" \
    "44d87902-d8b7-460b-9f1d-63a04001b6e7"
#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="nice -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/rsync_based_backups_creator.tar.gz ./ "
        if [ "$SB_RSYNC_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_cre_rsync_based_backups_creator="$S_TMP_0"
        else
            if [ "$SB_RSYNC_EXISTS_ON_PATH" != "f" ]; then
                echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
                echo "GUID=='1fb33191-cbf2-456a-9742-63a04001b6e7'"
            fi
            alias mmmv_cre_rsync_based_backups_creator="echo \"\" ; echo \"The \\\"rsync\\\" is not on PATH.\" ; echo \"GUID=='c6509465-d83f-426c-9ce2-63a04001b6e7'\" ; echo \"\" ; $S_TMP_0"
        fi
  fi
fi
#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_image_length_limiter_t1" \
            "image_edge_length_limiter_t1.tar.gz" "image_edge_length_limiter_t1" \
            "c7adf5a2-d0a2-4ea7-9e2d-63a04001b6e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ZeroNet_Rev3703_from_mmmv_repackaging" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2.tar.gz" "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2" \
            "43c4c4f4-b948-4080-bf1b-63a04001b6e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ruby_boilerplate_t4" \
            "2022_09_24_mmmv_ruby_boilerplate_t4.tar.gz" "2022_09_24_mmmv_ruby_boilerplate_t4" \
            "17035be2-c12b-4cce-a83b-63a04001b6e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_bash_boilerplate_t2_copy" \
            "2022_10_31_mmmv_bash_boilerplate_t2.tar.gz" "2022_10_31_mmmv_bash_boilerplate_t2" \
            "23918ad1-910e-476f-863b-63a04001b6e7"
        #----
    fi
fi
#------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_CVS_clonescript_t1" \
    "CVS_clonescript_template_01.bash" "CVS_clonescript.bash" \
    "1fb082b3-6959-454b-ab4a-63a04001b6e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_x_txt_git_pack_Bash_script_t1" \
    "mmmv_git_pack_template_t1.bash" "x.txt" \
    "269ffb72-1422-4f33-a85a-63a04001b6e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Rakefile_template_t1" \
    "2022_10_06_Rakefile_template_t1.rb" "Rakefile" \
    "b15613e1-d436-4648-a63a-63a04001b6e7" 
#------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_utilities"
FP_MMMV_PROCESS_EDITOR_BASH="$S_TMP_0/mmmv_process_editor/src/mmmv_process_editor.bash "
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_text_processing_lstop_t1="nice -n 6 ruby $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_text_processing_lstop_t1/mmmv_text_processing_lstop_t1.rb "
    alias mmmv_orderless_linediff="nice -n 6 ruby $S_TMP_0/orderless_linediff/bin/orderless_linediff.rb -f "
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
alias mmmv_vim_common_bashrc_main_txt="nice -n 2 vim $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc_main.txt "

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
        "fd5e7eae-a000-4733-bf4a-63a04001b6e7"

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_general" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/general" \
        "51af3e11-a04e-4eba-9819-63a04001b6e7"
else
    func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
        "$SB_USERNAME_IS_mmmv" \
        "24691be5-8d1f-4e5e-a419-63a04001b6e7"
fi
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
    "mmmv_go_mmmv_userspace_distro_t1_mmmv" \
    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv" \
    "22ec9611-cd64-47b1-8419-63a04001b6e7"
#--------------------------------------------------------------------------
if [ "$SB_FFMPEG_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ffmpeg_t1="nice -n 20 ffmpeg -i "
fi
#--------------------------------------------------------------------------
if [ "$SB_XPROP_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_admin_show_window_PID_t1="echo \"\"; echo \"Please click on the window to find out its process ID, PID?\"; echo \"\" ; wait; ps -A | grep \$(xprop | grep _NET_WM_PID | sed 's/^.\\+= //g')"
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
alias mmmv_admin_test_print_character_testpatterns_2_console="echo \"adad bdbd ftft lIlI oaoa ococ oqoq aeae ecec qgqg 3535 3737 1717 4747 4141 8686 rnrn hnhn yvyv uvuv yuyu pgpg jiji IiIi l|l| I|I| QOQO 0Q0Q 0o0o OoOo O0O0 OCOC 0C0C 8080 lJlJ IJIJ jJjJ RKRK GCGC G6G6 !|!| ß8ß8 ß8ß8 1234567890 abcdefghijklmnoprstuvwxyzõäöüžš ABCDEFGHIJKLMNOPRSTUVWXYZÕÄÖÜŽŠ .:,; _- ?! ^~ [](){} $€ |/\\\\ \\\"'\\\`\""
# Some font examples:
# Perfect or nearly perfect:
#     Monospace
#     Liberation Mono
# Good:
#     Lucida Console
# Compromise versions:
#     Fira Mono
#     DEC Terminal
#     PT Mono
#     DejaVu Sans Mono
#     Efont Fixed
#
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
    echo ""
    echo -e "\e[31mHost \"$HOSTNAME\" specific initializations were skipped.\e[39m"
    echo "Probably the problem is that the "
    echo ""
    echo "    $S_FP_APPLIANCE_INSTANCE_SPECIFIC_MAIN_BASH"
    echo ""
    echo "has not yet been customised for this host."
    echo "GUID=='e21e3e5e-f271-439b-99b1-63a04001b6e7'"
    echo ""
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_Android_Termux"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX" \
    "92720df3-e3d2-4a0a-a119-63a04001b6e7"
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    #--------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX/bin"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN" \
            "f25a32df-8703-44d7-9349-63a04001b6e7"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            Z_PATH="$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN:$Z_PATH"
        fi
    fi
    #--------------------
    # https://wiki.termux.com/wiki/Termux-setup-storage
    # archival copy: https://archive.ph/4wbWF
    # local copy: $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/third_party_documentation/Linux_and_Bash/Linux_distribution_specific_documentation/Termux/PDFs/2022_08_31_Termux-setup-storage_t1.pdf
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
        "f498ef3d-41f2-43b0-b148-63a04001b6e7" \
        "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="/sdcard/Download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_Download" "$S_TMP_0" \
            "33a1ea03-fdcb-43e0-8848-63a04001b6e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
        S_TMP_0="/sdcard/download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_download" "$S_TMP_0" \
            "711c1f35-f224-44ea-8628-63a04001b6e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1 # Just to be sure.
#--------------------------------------------------------------------------
export PATH="$Z_PATH:$PATH"
alias mmmv_ui_set_PATH_0="export PATH=\"$Z_PATH:$PATH\""
#--------------------------------------------------------------------------
export MANPATH="$MANPATH"
alias mmmv_ui_set_MANPATH_0="export MANPATH=\"$MANPATH\""
#----------------------------------------
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
        echo ""
        echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
        echo "This function should never be called if "
        echo "the Emacs is missing from PATH."
        echo "GUID=='ee940fc5-3a75-4a74-8651-63a04001b6e7'"
        echo ""
    fi
} # func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1

if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
    export MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_EMACS_T1="export PAGER=\"func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1 \""
    alias mmmv_ui_manpagereader_Emacs_t1="$MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_EMACS_T1"
fi
#--------------------------------------------------------------------------

export C_INCLUDE_PATH="$MMMV_C_INCLUDE_PATH:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$MMMV_CPLUS_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"

# In some cases the 
printf "\e[?2004l"
# makes sure that text can be copy-pasted to terminal
# without being surrounded by tildes like "~copypastedtext~".
#     https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
# archival copies:
#     https://archive.is/xf6KZ
#     https://web.archive.org/web/20161125181111/https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1

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
        "libtool" "15374135-a7e4-452b-9828-63a04001b6e7"
fi
#--------------------------------------------------------------------------
SB_FOSSIL_EXISTS_ON_PATH="f"
if [ "`which fossil 2> /dev/null`" != "" ]; then
    # https://www.fossil-scm.org
    SB_FOSSIL_EXISTS_ON_PATH="t"
    alias mmmv_run_Fossil_rebuild_t1="nice -n20 fossil rebuild --vacuum --compress --cluster --analyze "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "fossil" "1a24ac44-f0b8-4d07-9c28-63a04001b6e7"
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
            "exa" "dc0531f5-3e70-4950-ac17-63a04001b6e7"
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
        echo ""
        echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
        echo "The function that outputs this message "
        echo "is in a role of a lambda-function."
        echo "GUID=='286ee3d1-9f0d-43c3-9051-63a04001b6e7'"
        echo ""
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
# This has to be at the very end, because the actions can depend
# on, what is available on PATH. For example, there is no point of 
# crating a cache folder of a program that is not available on PATH.
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_optional_cache_folder_initializations.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export SB_MMMV_USERSPACE_DISTRO_T1_COMMON_BASHRC_EXECUTION_ALMOST_COMPLETE="t" # domain: {"","f","t"}
#--------------------------------------------------------------------------
#echo "~/.bashrc execution complete." # might be printed after error messages.
echo "common_bashrc_main.bash execution complete." # might be printed after error messages.
#echo "✓" # might be printed after error messages.
#==========================================================================

