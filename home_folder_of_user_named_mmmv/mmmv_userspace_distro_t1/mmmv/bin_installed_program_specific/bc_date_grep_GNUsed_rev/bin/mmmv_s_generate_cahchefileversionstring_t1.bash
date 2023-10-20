#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# The main control flow entry in this script is the func_main(),
# which resides near the end of this file. The structure of this file:
#
#     <boilerplate, the library of reusable Bash functions>
#     func_main()
#
#==========================================================================

func_mmmv_assert_error_code_zero_t1_angervaks(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #----------------------------------------------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe Bash code that calls this function is flawed. \e[39m"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "Aborting script."
        echo "GUID=='55c66b16-f9c6-4ff4-940d-6282808077e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        exit 1
    fi
    #------------------------------
    # If the "$?" were evaluated in this function, 
    # then it would be "0" even, if it is
    # something else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo "Something went wrong. Error code: $S_ERR_CODE"
        echo -e "\e[31mAborting script. \e[39m"
        echo "GUID=='b8decf44-1920-489c-a30d-6282808077e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t1_angervaks

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2_angervaks() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #----------------------------------------------------------------------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo -e "\e[31mCommand \"$S_COMMAND_NAME\" could not be found from the PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='173d8299-dc56-49c8-830d-6282808077e7'"
        echo ""
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2_angervaks

#--------------------------------------------------------------------------

func_mmmv_assert_Linux_or_BSD_t1(){
    local S_GUID_CANDIDATE="$1"
    #----------------------------------------------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mS_GUID_CANDIDATE==\"\", but it is expected to be a GUID. \e[39m"
        echo "GUID=='451ce352-ed00-44a9-a10d-6282808077e7'"
        echo ""
        exit 1 # exit with an error
    fi 
    #--------------------
    #S_TMP_0="`uname -a | grep -E \"([Ll][Ii][Nn][Uu][Xx]|[Bb][Ss][Dd]|[Cc][Yy][Gg][Ww][Ii][Nn])\"`"
    S_TMP_0="`uname -a | grep -E \"([Ll][Ii][Nn][Uu][Xx]|[Bb][Ss][Dd])\"`"
    if [ "$S_TMP_0" == "" ]; then
        echo ""
        echo "The classical command line utilities at "
        echo "different operating systems, for example, Linux and BSD,"
        echo "differ. This script is designed to run only on Linux and BSD."
        echo "If You are willing to risk that some of Your data "
        echo "is deleted and/or Your operating system instance"
        echo "becomes permanently flawed, to the point that "
        echo "it will not even boot, then You may edit the Bash script that "
        echo "calls the function that displays this error message "
        echo "by uncommenting that function."
        echo ""
        echo "If You do decide to edit the Bash script, then "
        echo "a recommendation is to test Your modifications "
        echo "within a virtual appliance or, if virtual appliances are not"
        echo "an option, as some new operating system user that does not have "
        echo "any access to the vital data/files."
        echo ""
        echo "Aborting script without doing anything."
        echo ""
        echo "GUID=='2aa4ee38-2dea-49af-850d-6282808077e7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_assert_Linux_or_BSD_t1

#--------------------------------------------------------------------------
S_ARGV_0=$1 # Ruby style indexing

func_output_err_message_and_exit_with_error_if_any_command_line_arguments_present(){
    if [ "$S_ARGV_0" != "" ]; then
        #------------------------------
        echo ""
        echo "This script outputs a cache file version string that "
        echo "can be used for implementing the mmmv_cachefile_use_protocol_t1 ."
        echo "The idea is that if cache files are created like "
        echo -e "\e[36m"
        echo "    # A Bash code sample:"
        echo "    echo \"cache file content\" > ./\`mmmv_s_generate_cahchefileversionstring_t1.bash \`_Foo_cache_file.txt"
        echo -e "\e[39m"
        echo "then newer cache files can be selected by using "
        echo "alphabetic sorting:"
        echo -e "\e[36m"
        echo "    # A Bash code sample:"
        echo "    if [ \"\$S_CMD_GNU_SED\" == \"\" ]; then S_CMD_GNU_SED=\\\"sed\\\" ; if [ \\\"\\\`uname -a | grep -i 'BSD' \\\`\\\" != '' ]; then S_CMD_GNU_SED=\\\"gsed\\\" ; fi ; wait ; fi ; S_NEWEST_CACHE_FILE_PATH=\"\`pwd\`/\`ls -1 | sort -r | \$S_CMD_GNU_SED -e '2~1d'\`\" ; echo \$S_NEWEST_CACHE_FILE_PATH"
        echo -e "\e[39m"
        echo -e "\e[31mThis script does not take any command line arguments\e[39m."
        echo "Exiting with an error code 1."
        echo "GUID=='a7d50558-863b-41d7-b10d-6282808077e7'"
        echo ""
        exit 1
        #------------------------------
    fi
} # func_output_err_message_and_exit_with_error_if_any_command_line_arguments_present

#--------------------------------------------------------------------------
S_CMD_GNU_SED="$S_CMD_GNU_SED" # probably ==""

func_main(){ 
    #------------------------------
    func_mmmv_exit_if_not_on_path_t2_angervaks "grep"
    func_mmmv_assert_Linux_or_BSD_t1 "c48ef84b-b1d8-4a16-850d-6282808077e7"
    if [ "$S_CMD_GNU_SED" == "" ]; then 
        S_CMD_GNU_SED="sed" 
        if [ "`uname -a | grep -i 'BSD' `" != '' ]; then 
             S_CMD_GNU_SED="gsed" 
        fi 
        wait 
    fi 
    #--------
    func_mmmv_exit_if_not_on_path_t2_angervaks "date"
    func_mmmv_exit_if_not_on_path_t2_angervaks "bc"
    func_mmmv_exit_if_not_on_path_t2_angervaks "rev"
    func_mmmv_exit_if_not_on_path_t2_angervaks "$S_CMD_GNU_SED"
    #--------
    func_output_err_message_and_exit_with_error_if_any_command_line_arguments_present
    #------------------------------
    $S_CMD_GNU_SED --version > /dev/null # to test, if it at least 
                                         # somewhat works, because
                                         # it is not that easy to 
                                         # detect non-zero error code at
                                         # S_FOO="`sed some failing nonsense`"
    func_mmmv_assert_error_code_zero_t1_angervaks "$?" \
        "6dc23a4b-a901-4beb-910d-6282808077e7"
    #------------------------------
    # The formula:
    #     ((((((i_year*13+i_month)*33+i_day)*25+i_hour)*70+i_minute)*70+i_second)*100000+rand(99999))<
    #     < 10^(   5  + 2+  0     + 2+ 0    + 2+ 0    + 2 +  0     + 2 +  0      +  6    +  0 )=
    #     = 10^(21) < 10^(22)
    # The absolute maximum value for the formula:
    #     ((((((99999*13+12)*33+32)*25+60)*70+60)*70+60)*100000+99999)=
    #     = 525525017576099999 < 10^(18) 
    #------------------------------
    SI_YEAR="`date +%Y`"
    SI_MONTH="`date +%m`"
    SI_DAY="`date +%d`"
    SI_HOUR="`date +%H`"
    SI_MINUTE="`date +%M`"
    SI_SECOND="`date +%S`"
    SI_RAND="`date +%S`"
    #--------
    S_RANDOM="`echo \"$RANDOM+$RANDOM+$RANDOM+$RANDOM\" | bc | \
        $S_CMD_GNU_SED -e 's/\\(^.\{5\}\\).*\$/\\1/' `"
    #echo "$S_RANDOM"
    S_FORMULA="(((((($SI_YEAR*13+$SI_MONTH)*33+$SI_DAY)*25+ \
        $SI_HOUR)*70+$SI_MINUTE)*70+$SI_SECOND)*100000+$S_RANDOM)"
    #echo "$S_FORMULA"
    SI_0="000000000000000000`echo \"$S_FORMULA\" | bc `" # 18 leading zeros
    SI_1="`echo \"$SI_0\" | rev | \
        $S_CMD_GNU_SED -e 's/\\(^.\{18\}\\).*\$/\\1/' | rev `"
    # echo "012345678" | sed -e 's/\(^....\).*$/\1/'
    printf "$SI_1"
    #------------------------------
} # func_main

#--------------------------------------------------------------------------
func_main
exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="02c415d8-76de-40a5-930d-6282808077e7"
#==========================================================================
